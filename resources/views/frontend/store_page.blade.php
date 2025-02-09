<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <div class="text-center mb-4">
        <h1 id="shop-name">{{ $store->name }}</h1>
        <a href="{{ url(env('APP_URL')) }}">Main Home Page</a>
    </div>

    <ul class="nav nav-pills mb-4 justify-content-center">
        @foreach ($store->categories ?? [] as $key => $category)
            @if($key == 0)
                <input type="hidden" id="first_category_id" value="{{ $category->id }}">
            @endif
            <li class="nav-item">
                <a class="nav-link {{ $loop->first ? 'active' : '' }}" data-bs-toggle="pill" style="cursor: pointer" onclick="categoryProduct('{{ $category->id }}')">{{ $category->name }}</a>
            </li>
        @endforeach
    </ul>

    <div id="loader" class="d-flex justify-content-center mt-4 d-none">
        <div class="spinner-border" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <div class="row" id="product-cards">
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function () {
        var first_category_id = $("#first_category_id").val();

        categoryProduct(first_category_id);

    });

    function categoryProduct(category_id) {

        var store_id = "{{ $store->id }}";

        $("#loader").removeClass('d-none');

        $.ajax({
            url : "{{ route('category_products') }}",
            type : 'get',
            data : {category_id:category_id, store_id: store_id},

            success:function (res) {

                $("#loader").addClass('d-none');

                $('#product-cards').html('');
                res.forEach(function (product) {
                    var productCard = `
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <div class="card-body text-center">
                                <h5 class="card-title">${product.name}</h5>
                            </div>
                        </div>
                    </div>
                    `;
                    $('#product-cards').append(productCard);
                });
            },
            error: function () {
                $("#loader").addClass('d-none');
                alert('An error occurred while fetching products.');
            }

        });
    }

</script>

</body>
</html>
