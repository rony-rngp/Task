<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Store;
use Illuminate\Http\Request;
use function Symfony\Component\VarDumper\Caster\castDocument;

class HomeController extends Controller
{
    public function index()
    {
        $stores = Store::get();
        return view('welcome', compact('stores'));
    }

    public function shop_page($shop_name)
    {
        $store = Store::with('categories')->where('name', $shop_name)->first();
        if ($store == null){
            notify()->error('Store not found');
            return redirect(env('APP_URL'));
        }
        return view('frontend.store_page', compact('store'));
    }

    public function category_products(Request $request)
    {
        $products = Product::where(['store_id' => $request->store_id, 'category_id' => $request->category_id])->get();
        return response()->json($products);
    }

}
