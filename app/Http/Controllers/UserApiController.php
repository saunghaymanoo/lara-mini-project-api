<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserApiController extends Controller
{
    public function index()
    {
        $users = User::latest('id')
            ->paginate(3)
            ->withQueryString()
            ->onEachSide(1);
        return UserResource::collection($users);
    }
    public function show($id)
    {
        $user = User::find($id);
        if (is_null($user)) {
            return response()->json(["message" => "user not found"], 404);
        }
        return new UserResource($user);
        // return response()->json([
        //     'user'=>$user
        // ]);
    }
    public function store(Request $request)
    {
        // $request->validate([
        //     "name" => "required|max:50",
        //     "email" => "required|email",
        //     "role" => "required",
        //     "password" => "required|min:5|confirmed"
        // ]);
        // $user = User::create([
        //     "name" => $request->name,
        //     "email" => $request->email,
        //     "role" => $request->role,
        //     "password" => $request->password,
        // ]);
        // return response()->json([
        //     "message" => "update successful",
        //     "success" => true,
        //     "user" => new UserResource($user)
        // ]);
        $request->validate([
            "name" => "required|max:50",
            "role" => "required",
            "email" => "required|email|unique:users,email",
            "password" => "required|min:5|confirmed"
        ]);

        User::create([
            "name" => $request->name,
            "email" => $request->email,
            "role" => $request->role,
            "password" => Hash::make($request->password)
        ]);

        return response()->json([
            "message" => "success",
            "success" => true
        ], 200);
    }
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if (is_null($user)) {
            return response()->json(["message" => "user not found"], 404);
        }
        $request->validate([
            "name" => "nullable|max:50",
            "email" => "nullable|email",
            "role" => "nullable",
            "password" => "nullable|min:5|confirmed"
        ]);
        if ($request->name) {
            $user->name = $request->name;
        }
        if ($request->email) {
            $user->email = $request->email;
        }
        if ($request->role) {
            $user->role = $request->role;
        }
        if ($request->password) {
            if (Hash::check($request->old_password, $user->password) && Auth::id() == $request->user_id) {
                $user->password = Hash::make($request->password);
            } else {
                return response()->json([
                    'message' => 'wrong password'
                ]);
            }
        }
        $user->update();
        return response()->json([
            "message" => "update successful",
            "success" => true,
            "user" => new UserResource($user)
        ]);
    }
    public function destroy($id)
    {
        $user = User::find($id);
        if (is_null($user)) {
            return response()->json(["message" => "user not found"], 404);
        }
        $user->delete();
        return response()->json([
            "message" => "delete successful",
            "success" => true
        ]);
    }
    public function changePassword(Request $request,$id)
    {
        $user = User::find($id);
        if (is_null($user)) {
            return response()->json(["message" => "user not found"], 404);
        }
        $request->validate([
            "password" => "required|min:5|confirmed"
        ]);
        if ($request->password) {
            if (Hash::check($request->old_password, $user->password)) {
                if (Auth::id() == $request->user_id) {
                    $user->password = Hash::make($request->password);
                    $user->update();
                    return response()->json([
                        "message" => "change successful",
                        "success" => true,
                    ]);
                } else {
                    return response()->json([
                        'message' => 'invalid user'
                    ]);
                }
            } else {
                return response()->json([
                    'message' => 'wrong password'
                ]);
            }
        }
    }
}
