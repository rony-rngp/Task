@extends('layouts.merchant.auth_layout')

@section('title', 'Admin Login')

@section('content')

    <div class="card px-sm-6 px-0">
        <div class="card-body">
            <!-- Logo -->
            <div class="app-brand justify-content-center mb-6">
                <a href="{{ route('admin.login') }}" class="app-brand-link gap-2">
                    <span class="app-brand-text demo text-heading fw-bold">Admin Login</span>
                </a>
            </div>
            <!-- /Logo -->

            <br>
            <form class="mb-8" action="{{ route('admin.login') }}" method="post">
                @csrf
                <div class="mb-7">
                    <input
                            type="email"
                            class="form-control"
                            id="email"
                            required
                            name="email"
                            placeholder="Enter your email"
                            value="admin@gmail.com"
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


            <div>
                <div class="d-flex justify-content-between">
                    <a href="{{ route('admin.login') }}" class="btn btn-primary">Admin</a>
                    <a href="{{ route('merchant.login') }}" class="btn btn-success">Merchant</a>
                </div>
            </div>

        </div>
    </div>

@endsection