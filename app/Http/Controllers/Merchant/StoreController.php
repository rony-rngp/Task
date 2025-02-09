<?php

namespace App\Http\Controllers\Merchant;

use App\Http\Controllers\Controller;
use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $stores = Store::where('user_id', Auth::user()->id)->paginate(10);
        return view('merchant.store.index', compact('stores'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('merchant.store.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|regex:/^[a-zA-Z0-9_-]+$/|unique:stores,name',
        ],[
            'name.required' => 'The name field is required.',
            'name.regex' => 'The name field may only contain letters, underscores (_), and hyphens (-). No spaces or other characters are allowed.',
        ]);

        $store = new Store();
        $store->user_id = Auth::user()->id;
        $store->name = $request->name;
        $store->save();

        return redirect()->route('merchant.stores.index')->with('success', 'Store created successfully');

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
        $store = Store::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        return view('merchant.store.edit', compact('store'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|regex:/^[a-zA-Z0-9_-]+$/|unique:stores,name,'.$id,
        ],[
            'name.required' => 'The name field is required.',
            'name.regex' => 'The name field may only contain letters, underscores (_), and hyphens (-). No spaces or other characters are allowed.',
        ]);

        $store = Store::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        $store->name = $request->name;
        $store->save();

        return redirect()->route('merchant.stores.index')->with('success', 'Store updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $store = Store::where(['user_id' => Auth::user()->id, 'id' => $id])->first();
        $store->delete();
        return redirect()->back()->with('success', 'Store deleted successfully');
    }
}
