<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container text-center mt-5">

    <h1>Welcome to {{ env('APP_NAME') }}</h1>

    <div class="mt-4">
        <a href="{{ route('admin.login') }}" target="_blank" class="btn btn-primary btn-lg" >Admin</a>
        <a href="{{ route('merchant.login') }}" target="_blank" class="btn btn-secondary btn-lg ms-3" >Merchant</a>
    </div>

    <div class="mt-5">
        <h2>Browse Stores</h2>
        <div class="row justify-content-center mt-3" id="category-buttons">
            @foreach($stores as $store)
            <a href="{{ route('shop.view', ['shop' => $store->name]) }}" target="_blank" class="btn btn-outline-dark col-3 m-2">{{ $store->name }}</a>
            @endforeach
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
