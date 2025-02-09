@extends('layouts.merchant.app')

@section('title', 'Store List')

@push('css')

@endpush

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="d-flex justify-content-between align-items-center" >
                        <h5 class="card-header">Store List</h5>
                        <div class="me-5">
                            <a href="{{ route('merchant.stores.create') }}" class="btn btn-primary"> Create Store</a>
                        </div>
                    </div>
                    <div class="table-responsive text-nowrap">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-0">
                            @forelse($stores as $key => $store)
                                <tr>
                                    <td>{{ $store->id }}</td>
                                    <td>{{ $store->name }}</td>
                                    <td>
                                        <a class="btn btn-sm btn-primary" href="{{ route('merchant.stores.edit', $store->id) }}"><i class="bx bx-edit-alt me-1"></i> Edit</a>

                                        <button class="btn btn-sm btn-danger" id="delete" type="button" onclick="deleteData({{ $store->id }})">
                                            <i class="bx bx-trash me-1"></i> Delete
                                        </button>
                                        <form id="delete-form-{{ $store->id }}" action="{{ route('merchant.stores.destroy', $store->id) }}" method="post" class="d-none">
                                            @csrf
                                            @method('delete')
                                        </form>
                                        <!--End Delete Data-->
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="3" class="text-center">Data not found</td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>
                        <div class="mt-3 float-end me-5" >
                            {{ $stores->links('pagination::bootstrap-4') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

@push('js')

@endpush