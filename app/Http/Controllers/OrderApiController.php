<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderResource;
use App\Models\Item;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::get();
        return response()->json([
            "message" => "success",
            "success" => true,
            "orders" => $orders
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
        // $exist = Order::where('item_id',$request->item_id)
        //                 ->where('user_id',Auth::id())
        //                 ->first();
        // if(!empty($exist)){
        //     return response()->json([
        //         "message" => "This item has been already ordered",
        //         "success" => false
        //     ]);
        // }
        // $request->validate([
        //     "item_id" => "required|exists:items,id",
        //     "stock" => "required|numeric|min:1",
        //     "amount" => "required|numeric|min:1"
        // ]);
        // $orders = [];
        // return $request;

        //     foreach($request->orders_list as $key=>$el){
        //         // return $el;
        //         $orders[$key] = [
        //             "user_id" => Auth::user()->id,
        //             'item_id' => $el->id,
        //             'stock' => $el->stock,
        //             'amount' => $el->amount
        //         ];
        //     }
        // return $orders;

        $order = Order::insert(
            $request-> orders_list
        );
        // $order = Order::create([
        //     "user_id" => Auth::id(),
        //     "item_id" => $request->item_id,
        //     "stock" => $request->stock,
        //     "amount" => $request->amount,
        // ]);
        return response()->json([
            'message' => "success",
            'success' => true,
            'order' => $order
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
        return abort(404);
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
        $order = Order::find($id);
        if(is_null($order)){
            return response()->json([
                "message" => "order does not exists",
            ]);
        }
        $request->validate([
            "stock" => "nullable|numeric|min:1",
        ]);
        if($request->stock && $request->stock > 0){
            $order->stock = (int)$request->stock;
            $price = Item::SELECT('price')
                    ->WHERE('id',$order->item_id)
                    ->first();
            $order->amount = $price->price * $request->stock;
        }
        $order->update();
        return response()->json([
            "message" => "update successful",
            "success" => true,
            "order" => $order
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
        $order = Order::find($id);
        if(is_null($order)){
            return response()->json([
                "message" => "order does not exists",
            ]);
        }
        $order->delete();
        return response([
            "message" => "delete successful",
            "success" => true
        ]);
    }
    public function orderByAuth(){
        $orders = Auth::user()->orders;
        return response()->json([
            "message" => 'success',
            'success' => true,
            'orders' => OrderResource::collection($orders)
        ]);
    }
}
