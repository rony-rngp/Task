<?php

namespace App\Http\Controllers\Merchant;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::with('store', 'category')->where('user_id', Auth::user()->id)->paginate(50);
        return view('merchant.product.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $stores = Store::where('user_id', Auth::user()->id)->get();
        return view('merchant.product.create', compact('stores'));
    }

    /**
     * get category
     */
    public function get_categories(Request $request)
    {
        $categories = Category::where(['user_id' => Auth::user()->id, 'store_id' => $request->store_id])->get();
        return response()->json($categories);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'store_id' => 'required',
            'category_id' => 'required',
            'name' => [
                'required',
                Rule::unique('products', 'name')->where(function ($query) use ($request) {
                    return $query->where('user_id', Auth::id())->where('store_id', $request->store_id)->where('category_id', $request->category_id);
                }),
            ],
        ]);

        $product = new Product();
        $product->user_id = Auth::user()->id;
        $product->store_id = $request->store_id;
        $product->category_id = $request->category_id;
        $product->name = $request->name;
        $product->save();

        return redirect()->route('merchant.products.index')->with('success', 'Product created successfully');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $stores = Store::where('user_id', Auth::user()->id)->get();
        $product = Product::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        $categories = Category::where(['user_id' => Auth::user()->id, 'store_id' => $product->store_id])->get();
        return view('merchant.product.edit', compact('stores', 'product', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'store_id' => 'required',
            'category_id' => 'required',
            'name' => [
                'required',
                Rule::unique('products', 'name')->where(function ($query) use ($request, $id) {
                    return $query->where('id', '!=', $id)->where('user_id', Auth::id())->where('store_id', $request->store_id)->where('category_id', $request->category_id);
                }),
            ],
        ]);

        $product = Product::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        $product->store_id = $request->store_id;
        $product->category_id = $request->category_id;
        $product->name = $request->name;
        $product->save();

        return redirect()->route('merchant.products.index')->with('success', 'Product updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        $product->delete();
        return redirect()->back()->with('success', 'Product deleted successfully');
    }
}
