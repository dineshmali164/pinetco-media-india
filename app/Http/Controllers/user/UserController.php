<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function CheckmailIsRegistered(Request $request)
    {
        return User::where('email',$request->email)->count();   
    }
}
