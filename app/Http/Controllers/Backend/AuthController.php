<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        if (Auth::guard('admin')->check()){
            return redirect()->route('admin.dashboard');
        }

        if ($request->isMethod('post')){

            $request->validate([
                'email' => 'required|email',
                'password' => 'required',
            ]);

            if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' =>$request->password])){
                return redirect()->route('admin.dashboard');
            }else{
                throw ValidationException::withMessages(['email' => 'These credentials do not match our records.']);
            }
        }
        return view('backend.auth.login');
    }

    public function dashboard()
    {
        $merchants = User::get();
        return view('backend.dashboard', compact('merchants'));
    }

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }
    
}
