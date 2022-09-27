<?php

namespace App\Http\Controllers;

use App\Http\Resources\ItemResource;
use App\Models\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;

class ItemApiController extends Controller
{
    public function index()
    {
        $items = Item::when(request('keyword'), fn ($q) => $q->where('name', 'like', "%" . request('keyword') . "%"))
            ->latest('id')
            ->paginate(3)
            ->withQueryString()
            ->onEachSide(1);
        return ItemResource::collection($items);
    }
    public function store(Request $request)
    {
        $request->validate([
            "name" => "required|unique:items,name|max:50",
            "code" => "required|unique:items,code|min:5",
            "subcategory_id" => "required|exists:subcategories,id",
            "description" => "required|min:10",
            "price" => "required|numeric",
            "discount" => "nullable|numeric",
            "photo" => "required|mimes:jpeg,jpg,png|file|max:512"
        ]);

        $newN = uniqid() . "-photo-" . $request->file('photo')->getClientOriginalName();
        $request->file('photo')->storeAs("public", $newN);

        $item = Item::create([
            "name" => $request->name,
            "code" => $request->code,
            "subcategory_id" => $request->subcategory_id,
            "user_id" => Auth::id(),
            "description" => $request->description,
            "price" => $request->price,
            "discount" => $request->discount,
            "photo" => $newN
        ]);

        return response()->json([
            "message" => "success",
            "success" => true,
            "item" => new ItemResource($item)
        ], 200);
    }
    public function show($id)
    {
        $item = Item::find($id);
        if (is_null($item)) {
            return response()->json(["message" => "item not found"], 404);
        }
        return new ItemResource($item);
        // return response()->json([
        //     'item'=>$item
        // ]);
    }
    public function update(Request $request,$id)
    {
        $item = Item::find($id);
        Gate::authorize('update',$item);
        if (is_null($item)) {
            return response()->json(["message" => "item not found"], 404);
        }
        $request->validate([
            "name" => "nullable|max:50",
            "code" => "nullable|min:5|unique:items,code,".$id,
            "subcategory_id" => "nullable|exists:subcategories,id",
            "description" => "nullable|min:10",
            "price" => "nullable|numeric",
            "discount" => "nullable|numeric",
            "photo" => "nullable"
        ]);
        if($request->name){
            $item->name = $request->name;
        }
        if($request->code){
            $item->code = $request->code;
        }
        if($request->subcategory_id){
            $item->subcategory_id = $request->subcategory_id;
        }
        if($request->description){
            $item->description = $request->description;
        }
        if($request->price){
            $item->price = $request->price;
        }
        if($request->discount){
            $item->discount = $request->discount;
        }
        // return $item->photo;
        if($request->file('photo')){
            Storage::delete("public/".$item->photo);
            $file= $request->file('photo');
            $newN = uniqid() . "-photo-" . $file->getClientOriginalName();
            $file->storeAs("public", $newN);
        }else{
            $newN = $item->photo;
        }
        $item->photo = $newN;
        $item->update();
        return response()->json([
            "message" => "update successful",
            "success" => true,
            "item" => new ItemResource($item)
        ]);
    }
    public function destroy($id){
        $item = Item::find($id); 
        Gate::authorize('delete',$item);
        if (is_null($item)) {
            return response()->json(["message" => "item not found"], 404);
        }
        $item->delete();
        return response()->json([
            "message" => "delete successful",
            "success" =>true
        ]);
    }
    public function itemsBySubcategory(){
        $items = Item::where(function($q){
            $q->when(request('keyword'), fn ($q) => $q->where('name', 'like', "%" . request('keyword') . "%"));
        })
            ->where('subcategory_id',request('subcategory_id'))
            ->latest('id')
            ->paginate(3)
            ->withQueryString()
            ->onEachSide(1);
        return ItemResource::collection($items);
    }
}
