<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthApiController extends Controller
{
    public function register(Request $request){
        $request->validate([
            "name" => "required|max:50",
            "email" => "required|email|unique:users,email",
            "password" => "required|min:5|confirmed"
        ]);

        User::create([
            "name" => $request->name,
            "email" => $request->email,
            "password" => Hash::make($request->password)
        ]);

        return response()->json([
            "message" => "success",
            "success" => true
        ],200);
    }
    public function login(Request $request){
        $request->validate([
            "email" => "required|email",
            "password" => "required|min:5"
        ]);
        if(Auth::attempt($request->only(['email','password']))){
            $token = Auth::user()->createToken('phone')->plainTextToken;
            $user = User::find(Auth::id());
            return response()->json([
                "success" => true,
                "token" => $token,
                "user" => new UserResource($user) 
            ],200);
        }
        
        return response()->json([
            "message" => "user not found"
        ]);
    }
    public function logout(){
        Auth::user()->currentAccessToken()->delete();
        return response()->json([
            "message"=>"logout successful",
            "success" => true
        ],200);
    }
    public function logoutAll(){
        Auth::user()->tokens()->delete();
        return response()->json([
            "message"=>"logout all sessions successful",
            "success" => true
        ],200);
    }
    public function tokens(){
        return Auth::user()->tokens;
    }
}
