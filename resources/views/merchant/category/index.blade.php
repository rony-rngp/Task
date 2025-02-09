@extends('layouts.merchant.app')

@section('title', 'Category List')

@push('css')

@endpush

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="d-flex justify-content-between align-items-center" >
                        <h5 class="card-header">Category List</h5>
                        <div class="me-5">
                            <a href="{{ route('merchant.categories.create') }}" class="btn btn-primary"> Create Category</a>
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Store</th>
                                <th>Name</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-0">
                            @forelse($categories as $key => $category)
                                <tr>
                                    <td>{{ $category->id }}</td>
                                    <td>{{ @$category->store->name }}</td>
                                    <td>{{ $category->name }}</td>
                                    <td>
                                        <a class="btn btn-sm btn-primary" href="{{ route('merchant.categories.edit', $category->id) }}"><i class="bx bx-edit-alt me-1"></i> Edit</a>

                                        <button class="btn btn-sm btn-danger" id="delete" type="button" onclick="deleteData({{ $category->id }})">
                                            <i class="bx bx-trash me-1"></i> Delete
                                        </button>
                                        <form id="delete-form-{{ $category->id }}" action="{{ route('merchant.categories.destroy', $category->id) }}" method="post" class="d-none">
                                            @csrf
                                            @method('delete')
                                        </form>
                                        <!--End Delete Data-->
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-center">Data not found</td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                        <div class="mt-3 float-end me-5" >
                            {{ $categories->links('pagination::bootstrap-4') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

@push('js')

@endpush