<!doctype html>

<html lang="en" class="light-style layout-menu-fixed layout-compact" dir="ltr" data-theme="theme-default" data-assets-path="{{ asset('backend/assets') }}/" data-style="light">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>@yield('title')</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{ asset('backend/assets') }}/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="{{ asset('backend/assets') }}/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/vendor/libs/apex-charts/apex-charts.css" />

    <!-- sweetalert 2 -->
    <link rel="stylesheet" href="{{ asset('backend/assets/sweetalert2/sweetalert2.css') }}">

    <!-- Page CSS -->
    <style>
        .border-bottom{
            border-bottom: 1px solid #E4E6E8;
        }
    </style>

@stack('css')

<!-- Helpers -->
    <script src="{{ asset('backend/assets') }}/vendor/js/helpers.js"></script>
    <script src="{{ asset('backend/assets') }}/js/config.js"></script>
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

    @include('layouts.backend.partials.sidebar')
    <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

        @include('layouts.backend.partials.topbar')

        <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

            @yield('content')
            <!-- / Content -->


                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<!-- / Layout wrapper -->

<!-- Toast with Placements -->
<div class="bs-toast toast toast-placement-ex m-2"
     role="alert"
     aria-live="assertive"
     aria-atomic="true"
     data-bs-delay="3000">
    <div class="toast-header">
        <i class="bx bx-bell me-2"></i>
        <div class="me-auto fw-medium alert_title">Success</div>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body"></div>
</div>

<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->

<script src="{{ asset('backend/assets') }}/vendor/libs/jquery/jquery.js"></script>
<script src="{{ asset('backend/assets') }}/vendor/libs/popper/popper.js"></script>
<script src="{{ asset('backend/assets') }}/vendor/js/bootstrap.js"></script>
<script src="{{ asset('backend/assets') }}/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="{{ asset('backend/assets') }}/vendor/js/menu.js"></script>
<!-- Main JS -->
<script src="{{ asset('backend/assets') }}/js/main.js"></script>

<!-- endbuild -->


<!-- custom toastr -->
<script>
    function showToast(alert='primary', position="topRight", message) {
        const toastPlacementExample = document.querySelector('.toast-placement-ex');
        const selectedType = 'bg-'+alert;

        let selectedPlacement;
        if(position == 'topLeft'){
            selectedPlacement = 'top-0 start-0'.split(' ');
        }else if(position == 'topRight'){
            selectedPlacement = 'top-0 end-0'.split(' ');
        }else if(position == 'topCenter'){
            selectedPlacement = 'top-0 start-50 translate-middle-x'.split(' ');
        }else if(position == 'middleCenter'){
            selectedPlacement = 'op-50 start-50 translate-middle'.split(' ');
        }else if(position == 'bottomLeft'){
            selectedPlacement = 'bottom-0 start-0'.split(' ');
        }else if(position == 'bottomRight'){
            selectedPlacement = '"bottom-0 end-0'.split(' ');
        }else{
            selectedPlacement = 'top-0 end-0'.split(' ');
        }

        if(alert == 'primary' || alert == 'success'){
            $(".alert_title").text('Success');
        }else{
            $(".alert_title").text('Error');
        }

        // Dispose existing toast if it exists
        if (toastPlacementExample && toastPlacementExample._toast) {
            toastPlacementExample._toast.dispose();
        }

        // Add the selected classes
        toastPlacementExample.classList.add(selectedType);
        DOMTokenList.prototype.add.apply(toastPlacementExample.classList, selectedPlacement);

        $(".toast-body").text(message);

        // Create and show the toast
        const toast = new bootstrap.Toast(toastPlacementExample);
        toast.show();

        // Store the toast instance for potential disposal later
        toastPlacementExample._toast = toast;
    }
</script>

<!-- sweetalert2 -->
<script src="{{ asset('backend/assets/sweetalert2/sweetalert2@11.js') }}"></script>
<script>
    function deleteData(id) {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
        });

        swalWithBootstrapButtons.fire({
            title: 'Are you sure?',
            text: "You won't be able to delete this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                event.preventDefault();
                document.getElementById('delete-form-'+id).submit();
            }
        })
    }
</script>

@stack('js')

</body>
</html>