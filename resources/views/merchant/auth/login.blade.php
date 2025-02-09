@extends('layouts.merchant.auth_layout')

@section('title', 'Merchant Login')

@section('content')

    <div class="card px-sm-6 px-0">
        <div class="card-body">
            <!-- Logo -->
            <div class="app-brand justify-content-center mb-6">
                <a href="{{ route('merchant.login') }}" class="app-brand-link gap-2">
                    <span class="app-brand-text demo text-heading fw-bold">Merchant Login</span>
                </a>
            </div>
            <!-- /Logo -->

            <br>
            <form class="mb-8" action="{{ route('merchant.login') }}" method="post">
                @csrf
                <div class="mb-7">
                    <input
                            type="email"
                            class="form-control"
                            id="email"
                            required
                            name="email"
                            placeholder="Enter your email"
                            value="merchant1@gmail.com"
                            autofocus />
                    <span class="text-danger">{{ $errors->has('email') ? $errors->first('email') : '' }}</span>
                </div>
                <div class="mb-7 form-password-toggle">
                    <div class="input-group input-group-merge">
                        <input
                                type="password"
                                id="password"
                                required
                                class="form-control"
                                name="password"
                                placeholder="Enter your shop password"
                                value="11111111"
                                aria-describedby="password" />
                    </div>
                    <span class="text-danger">{{ $errors->has('password') ? $errors->first('password') : '' }}</span>
                </div>

                <div class="mb-6">
                    <button class="btn btn-danger d-grid w-100" type="submit">Login</button>
                </div>
            </form>

            <p class="text-center mb-9">
                <span>New on our platform?</span>
                <a href="{{ route('merchant.register') }}">
                    <span>Create an account</span>
                </a>
            </p>

            <div>
                <div class="d-flex justify-content-between">
                    <a href="{{ route('admin.login') }}" class="btn btn-primary">Admin</a>
                    <a href="{{ route('merchant.login') }}" class="btn btn-success">Merchant</a>
                </div>
            </div>

        </div>
    </div>

@endsection