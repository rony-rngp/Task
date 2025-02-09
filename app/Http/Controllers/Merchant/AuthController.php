<?php

namespace App\Http\Controllers\Merchant;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        if (Auth::check()){
            return redirect()->route('merchant.dashboard');
        }

        if ($request->isMethod('post')){

            $request->validate([
               'email' => 'required|email',
               'password' => 'required',
            ]);

            if (Auth::attempt(['email' => $request->email, 'password' =>$request->password])){
                return redirect()->route('merchant.dashboard');
            }else{
                throw ValidationException::withMessages(['email' => 'These credentials do not match our records.']);
            }
        }
        return view('merchant.auth.login');
    }

    public function register(Request $request)
    {
        if (Auth::check()){
            return redirect()->route('merchant.dashboard');
        }
        if ($request->isMethod('post')){

            $request->validate([
               'name' => 'required',
               'email' => 'required|email|unique:users,email',
               'shop_name' => 'required',
               'password' => 'required|string|min:8'
            ]);

            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->shop_name = $request->shop_name;
            $user->password = Hash::make($request->password);
            $user->save();

            notify()->success('Registration successful');

            return redirect()->route('merchant.login');

        }
        return view('merchant.auth.register');
    }

    public function dashboard()
    {
        return view('merchant.dashboard');
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('merchant.login');
    }

}
