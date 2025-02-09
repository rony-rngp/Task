@extends('layouts.merchant.app')

@section('title', 'Create Product')

@push('css')

@endpush

@section('content')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
            <div class="col-xl">
                <div class="card mb-6">
                    <div class="d-flex justify-content-between align-items-center border-bottom">
                        <h5 class="card-header">Create Product</h5>
                        <div class="me-5">
                            <a href="{{ route('merchant.products.index') }}" class="btn btn-primary"> Back</a>
                        </div>
                    </div>

                    <div class="card-body">
                        <form action="{{ route('merchant.products.store') }}" method="post">
                            @csrf
                            <div class="mb-6 col-md-6">
                                <label class="form-label" for="store_id">Select Store <i class="text-danger">*</i></label>
                                <select name="store_id" id="store_id" class="form-control" required>
                                    <option value="">Select One</option>
                                    @foreach($stores as $store)
                                        <option value="{{ $store->id }}">{{ $store->name }}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger">{{ $errors->has('store_id') ? $errors->first('store_id') : '' }}</span>
                            </div>
                            <div class="mb-6 col-md-6">
                                <label class="form-label" for="category_id">Select Category <i class="text-danger">*</i></label>
                                <select name="category_id" id="category_id" class="form-control" required>
                                    <option value="">Select One</option>

                                </select>
                                <span class="text-danger">{{ $errors->has('category_id') ? $errors->first('category_id') : '' }}</span>
                            </div>

                            <div class="mb-6 col-md-6">
                                <label class="form-label" for="name">Product Name <i class="text-danger">*</i></label>
                                <input type="text" class="form-control" name="name" id="name" value="{{ old('name') }}" required >
                                <span class="text-danger">{{ $errors->has('name') ? $errors->first('name') : '' }}</span>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


@endsection

@push('js')
    <script>
        $(document).on('change', '#store_id', function () {

            var store_id = $(this).val();

            $.ajax({
                url : "{{ route('merchant.get_categories') }}",
                type : 'get',
                data : {store_id:store_id},

                success:function (res) {
                    var html = '<option value="">Select One</option>';
                    $.each(res, function (key, v) {
                        html +='<option value="'+v.id+'">'+v.name+'</option>';
                    });
                    $('#category_id').html(html);
                }
            });
        });
    </script>
@endpush