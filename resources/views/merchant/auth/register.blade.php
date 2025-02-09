@extends('layouts.merchant.auth_layout')

@section('title', 'Merchant Registration')

@section('content')

    <div class="card px-sm-6 px-0">
        <div class="card-body">
            <!-- Logo -->
            <div class="app-brand justify-content-center mb-6">
                <a href="{{ route('merchant.register') }}" class="app-brand-link gap-2">
                    <span class="app-brand-text demo text-heading fw-bold">Merchant Register</span>
                </a>
            </div>
            <!-- /Logo -->

            <br>
            <form class="mb-8" action="{{ route('merchant.register') }}" method="post">
                @csrf

                <div class="mb-7">
                    <input type="text" class="form-control" id="name" required name="name" value="{{ old('name') }}" placeholder="Enter your name" autofocus />
                    <span class="text-danger">{{ $errors->has('name') ? $errors->first('name') : '' }}</span>
                </div>

                <div class="mb-7">
                    <input type="email" class="form-control" id="email" required name="email" placeholder="Enter your email" value="{{ old('email') }}" autofocus />
                    <span class="text-danger">{{ $errors->has('email') ? $errors->first('email') : '' }}</span>
                </div>

                <div class="mb-7">
                    <input type="text" class="form-control" id="shop_name" required name="shop_name" value="{{ old('shop_name') }}" placeholder="Enter your shop name" autofocus />
                    <span class="text-danger">{{ $errors->has('shop_name') ? $errors->first('shop_name') : '' }}</span>
                </div>

                <div class="mb-7 form-password-toggle">
                    <div class="input-group input-group-merge">
                        <input type="password" id="password" required class="form-control" name="password" placeholder="Enter your shop password" aria-describedby="password" />
                    </div>
                    <span class="text-danger">{{ $errors->has('password') ? $errors->first('password') : '' }}</span>
                </div>

                <div class="mb-6">
                    <button class="btn btn-danger d-grid w-100" type="submit">Register</button>
                </div>
            </form>

            <p class="text-center mb-9">
                <span>Already have an account?</span>
                <a href="{{ route('merchant.login') }}">
                    <span>Login here</span>
                </a>
            </p>



        </div>
    </div>

@endsection