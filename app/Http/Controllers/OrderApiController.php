<?php

namespace App\Http\Controllers;

use App\Http\Resources\OrderResource;
use App\Models\Item;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::when(request('startDate'), function($q)
        {
            $start = strtotime(request('startDate'));
            $startDate = date('Y-m-d',$start)." 00:00:00";
            $end = strtotime(request('endDate'));
            $endDate = date('Y-m-d',$end)." 23:59:59";
          return  $q->whereBetween('created_at', [$startDate, $endDate]);
        })
            ->latest('id')
            ->paginate(3)
            ->withQueryString()
            ->onEachSide(1);
        return OrderResource::collection($orders);
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
    public function barChartArr(){
            $dateArr = [];
            $dataArr = [];
            // $date = date('Y-m-d');
            for($i=1 ; $i<6 ; $i++){
                //date array
                $date = Carbon::now();
                $newDate = $date->subDays($i);
                array_unshift($dateArr, $newDate->format('Y-F-d'));
                //data array
                $dbDateArr =  Order::select(DB::raw('DATE_FORMAT(created_at, "%Y-%M-%d") as formatted_dob'))
                                // ->where('home.job_started_date','!=','null')
                                ->get();
                $totalRent = 0;
                foreach($dbDateArr as $r){
                    if($newDate->format('Y-F-d') == $r->formatted_dob){
                        $totalRent = $totalRent+1;
                    }
                }
                array_unshift($dataArr,$totalRent);
            }
            return response()->json([
                'dateArr' => $dateArr,
                'dataArr' => $dataArr
            ]);
    }
}
