<?php

use App\Http\Controllers\AuthApiController;
use App\Http\Controllers\CategoryApiController;
use App\Http\Controllers\ItemApiController;
use App\Http\Controllers\OrderApiController;
use App\Http\Controllers\SubcategoryApiController;
use App\Http\Controllers\UserApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/register', [AuthApiController::class, 'register'])->name('api.register');
Route::post('/login', [AuthApiController::class, 'login'])->name('api.login');
Route::get('/itemsnoauth', [ItemApiController::class,'index']);
// Route::get('/itemsnoauth/{id}', [ItemApiController::class,'show']);
Route::get('/categoriesnoauth', [CategoryApiController::class,'index']);
Route::get('/subcategorybycategory/{id}', [SubcategoryApiController::class, 'subcategoriesByCategory']);
Route::get('/itembysubcategory', [ItemApiController::class, 'itemsBySubcategory']);

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('/items', ItemApiController::class);
    Route::apiResource('/categories', CategoryApiController::class);
    Route::apiResource('/subcategories', SubcategoryApiController::class);
    Route::apiResource('/orders', OrderApiController::class);
    Route::apiResource('/users', UserApiController::class);
    Route::get('/orderbyauth', [OrderApiController::class, 'orderByAuth']);
    Route::post('/logout', [AuthApiController::class, 'logout']);
    Route::post('/logoutall', [AuthApiController::class, 'logoutAll']);
    Route::post('/tokens', [AuthApiController::class, 'tokens']);
    // Route::get('/subcategorybycategory/{id}', [SubcategoryApiController::class, 'subcategoriesByCategory']);
    // Route::get('/itembysubcategory', [ItemApiController::class, 'itemsBySubcategory']);
    Route::put('/changepassword/{id}', [UserApiController::class, 'changePassword']);
    Route::get('/itemsbyauthor', [ItemApiController::class, 'itemsByAuthor']);
    Route::get('/categoriesbyauthor',[CategoryApiController::class,'categoriesByAuthor']);
    Route::get('/subcategoriesbyauthor',[SubcategoryApiController::class,'subcategoriesByAuthor']);
});
