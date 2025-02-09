<?php

namespace App\Http\Controllers\Merchant;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::with('store')->where('user_id', Auth::user()->id)->paginate(20);
        return view('merchant.category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $stores = Store::where('user_id', Auth::user()->id)->get();
        return view('merchant.category.create', compact('stores'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
           'store_id' => 'required',
            'name' => [
                'required',
                Rule::unique('categories', 'name')->where(function ($query) use ($request) {
                    return $query->where('user_id', Auth::id())->where('store_id', $request->store_id);
                }),
            ],
        ]);

        $category = new Category();
        $category->user_id = Auth::user()->id;
        $category->store_id = $request->store_id;
        $category->name = $request->name;
        $category->save();

        return redirect()->route('merchant.categories.index')->with('success', 'Category created successfully');

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
        $category = Category::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        return view('merchant.category.edit', compact('category', 'stores'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'store_id' => 'required',
            'name' => [
                'required',
                Rule::unique('categories', 'name')->where(function ($query) use ($request, $id) {
                    return $query->where('id', '!=', $id)->where('user_id', Auth::id())->where('store_id', $request->store_id);
                })
            ],
        ]);

        $category = Category::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        $category->store_id = $request->store_id;
        $category->name = $request->name;
        $category->save();

        return redirect()->route('merchant.categories.index')->with('success', 'Category updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $category = Category::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        $category->delete();
        return redirect()->route('merchant.categories.index')->with('success', 'Category deleted successfully');

    }
}
