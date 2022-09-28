<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryResource;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class CategoryApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::get();
        return response()->json([
            "message" => "success",
            "success" => true,
            "categories" => CategoryResource::collection($categories)
        ],200);
    }
    public function categoriesByAuthor()
    {
        $categories = Category::when(Auth::user()->role === 'author', fn ($q) => $q->where('user_id', Auth::id()))->get();
        return response()->json([
            "message" => "success",
            "success" => true,
            "categories" => CategoryResource::collection($categories)
        ],200);
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
            "title" => "required|unique:categories,title|min:3",
        ]);
        $category = Category::create([
            "title" => $request->title,
            "user_id" => Auth::id()
        ]);
        return response()->json([
            "message" => 'success',
            "success" => true,
            'category' => new CategoryResource($category)
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
        $category = Category::find($id);
        if (is_null($category)) {
            return response()->json(["message" => "item not found"], 404);
        }
        return new CategoryResource($category);
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

        $category = Category::find($id);
        Gate::authorize('update',$category);
        if(is_null($category)){
            return response()->json([
                "message" => "category does not exists",
            ]);
        }
        $request->validate([
            "title" => "nullable|min:3",
        ]);
        if($request->title){
            $category->title = $request->title;
        }
        $category->update();
        return response()->json([
            "message" => "update successful",
            "success" => true,
            "category" => new CategoryResource($category)
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
        $category = Category::find($id);
        Gate::authorize('delete',$category);
        if(is_null($category)){
            return response()->json([
                "message" => "category does not exists",
            ]);
        }
        $category->delete();
        return response()->json([
            "message" => "delete successful",
            "success" => true
        ]);
    }
}
