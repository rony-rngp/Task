<?php

use Illuminate\Support\Facades\Route;



Route::domain('{shop}.'.env('APP_URL'))->group(function () {
    Route::get('/', [\App\Http\Controllers\Frontend\HomeController::class, 'shop_page'])->name('shop.view');;
});

Route::get('/', [\App\Http\Controllers\Frontend\HomeController::class, 'index']);

Route::get('/category-products', [\App\Http\Controllers\Frontend\HomeController::class, 'category_products'])->name('category_products');

//merchant routes
Route::group(['prefix' => 'merchant', 'as' => 'merchant.'], function (){

    //auth routes
    Route::controller(\App\Http\Controllers\Merchant\AuthController::class)->group(function (){
        Route::match(['get', 'post'],'/login', 'login')->name('login');
        Route::match(['get', 'post'],'/register', 'register')->name('register');
        Route::post('/logout', 'logout')->name('logout')->middleware('merchant');
    });

    Route::middleware('merchant')->group(function (){
        Route::get('dashboard', [\App\Http\Controllers\Merchant\AuthController::class, 'dashboard'])->name('dashboard');

        //store routes
        Route::resource('stores', \App\Http\Controllers\Merchant\StoreController::class);

        //category routes
        Route::resource('categories', \App\Http\Controllers\Merchant\CategoryController::class);

        //product routes
        Route::resource('products', \App\Http\Controllers\Merchant\ProductController::class);
        Route::get('get-categories', [\App\Http\Controllers\Merchant\ProductController::class, 'get_categories'])->name('get_categories');

    });


});

//admin routes
Route::group(['prefix' => 'admin', 'as' => 'admin.'], function (){
    //auth routes
    Route::controller(\App\Http\Controllers\Backend\AuthController::class)->group(function (){
        Route::match(['get', 'post'],'/login', 'login')->name('login');
        Route::post('/logout', 'logout')->name('logout')->middleware('admin');
        Route::get('dashboard', 'dashboard')->name('dashboard')->middleware('admin');
    });


});
