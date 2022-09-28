<?php

namespace App\Http\Controllers;

use App\Http\Resources\SubcategoryResource;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class SubcategoryApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subcategories = Subcategory::get();
        return response()->json([
            "message" => "success",
            "success" => true,
            "subcategories" => SubcategoryResource::collection($subcategories)
        ]);
    }
    public function subcategoriesByAuthor(){
        $subcategories = Subcategory::when(Auth::user()->role === 'author', fn ($q) => $q->where('user_id', Auth::id()))->get();
        return response()->json([
            "message" => "success",
            "success" => true,
            "subcategories" => SubcategoryResource::collection($subcategories)
        ]);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            "title" => "required|min:3",
            "category_id" => "required|exists:categories,id"
        ]);
        $subcategory = Subcategory::create([
            "title" => $request->title,
            "category_id" => $request->category_id,
            "user_id" => Auth::id()
        ]);
        return response()->json([
            "message" => "success",
            "success" => true,
            "subcategory" => new SubcategoryResource($subcategory)
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $subcategory = Subcategory::find($id);
        if (is_null($subcategory)) {
            return response()->json(["message" => "subcategory not found"], 404);
        }
        return new SubcategoryResource($subcategory);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $subcategory = Subcategory::find($id);
        Gate::authorize('update',$subcategory);
        if(is_null($subcategory)){
            return response()->json([
                "message" => "subcategory does not exist"
            ]);
        }
        $request->validate([
            "title" => "nullable|min:3",
            "category_id" => "nullable|exists:categories,id"
        ]);
        if($request->title){
            $subcategory->title = $request->title;
        }
        if($request->category_id){
            $subcategory->category_id = $request->category_id;
        }
        $subcategory->update();
        return response()->json([
            "message" => "update successful",
            "success" => true,
            "subcategory" => new SubcategoryResource($subcategory)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $subcategory = Subcategory::find($id);
        Gate::authorize('delete',$subcategory);
        if(is_null($subcategory)){
            return response()->json([
                "message" => "subcategory does not exist"
            ]);
        }
        $subcategory->delete();
        return response()->json([
            "message" => "delete successful",
            "success" => true,
        ]);
    }
    public function subcategoriesByCategory($id){
        $subcategories = Subcategory::WHERE('category_id',$id)->get();
        return response()->json([
            "message" => "success",
            "success" => true,
            "subcategories" => SubcategoryResource::collection($subcategories)
        ]);
    }
}
