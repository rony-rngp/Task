@extends('layouts.backend.app')

@section('title', 'Admin Dashboard')

@push('css')

@endpush

@section('content')

    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="d-flex justify-content-between align-items-center" >
                        <h5 class="card-header">Merchant List</h5>

                    </div>
                    <div class="table-responsive text-nowrap">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Created At</th>
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-0">
                                @foreach($merchants as $merchant)
                                    <tr>
                                        <td>{{ $merchant->id }}</td>
                                        <td>{{ $merchant->name }}</td>
                                        <td>{{ $merchant->email }}</td>
                                        <td>{{ $merchant->created_at }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

    </div>

@endsection

@push('js')

@endpush