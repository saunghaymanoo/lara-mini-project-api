<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserApiController extends Controller
{
    public function index()
    {
        $users = User::latest('id')
            ->paginate(3)
            ->withQueryString()
            ->onEachSide(1);
        return $users;
    }
}
