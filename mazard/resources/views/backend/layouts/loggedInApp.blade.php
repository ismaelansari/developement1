<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>
	<meta name="keywords" content="cleaning, home">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="{{asset('public/backend/images/favicon-icon.png')}}">
	<!--css-->
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/css/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/css/style.css">{{asset('public/backend')}}/
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/css/responsive.css">
	<!--font awesome 4-->
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/fonts/fontawesome/css/all.min.css">
	<!--data table-->
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/css/dataTables.bootstrap.css">
	@stack('css')
	<script type="text/javascript">

	 function profileImgError(image) {
		image.onerror = "";
		image.src = "{{asset('public/backend/images/user-default-image.png')}}";
		return true;
	 }

	 function imgError(image) {
		image.onerror = "";
		image.src = "{{asset('public/backend/images/image-not-found.jpg')}}";
		return true;
	 }

	 function imageUpload(image) {
		image.onerror = "";
		image.src = "{{asset('public/backend/images/upload-image.png')}}";
		return true;
 	 } 
	
</script>
</head>
<body onload="loaderfun()">
	<div id="loader-wrapper">
		<div id="loader">
			<div class="svg-wrapper">
				<img src="{{asset('public/backend')}}/images/loader1.gif">
			</div>
		</div>
	</div>
	<main class="clearfix">
		<div class="noty-overlay"></div>
		<!--left block-->
		<div class="left-block">
			<button class="close-menu">
				<i class="fa fa-times"></i>
			</button>
			<div class="left-block-body">
				<nav>
					<div class="nav-logo">
						<a href="{{route('admin.home')}}">
							<img src="{{asset('public/backend')}}/images/nav-logo2.png" class="logo">
							<img src="{{asset('public/backend')}}/images/logo-icon.png" class="logo-icon">
						</a>
					</div>

					<div class="navlink">
						<ul>
							<li>
									<a href="{{route('admin.home')}}"><i class="fas fa-chart-line"></i><span>{{__('Dashboard')}}</span></a>
							</li>
							<li><a href="{{route('admin.users')}}"><i class="fa fa-users"></i> <span>{{__('Users')}}</span></a></li>
							<li><a href="{{route('admin.products')}}"><i class="fa fa-list-alt"></i> <span>{{__('Ads')}}</span></a></li>
							<li><a href="{{route('admin.categories')}}"><i class="fa fa-layer-group"></i> <span>{{__('Categories')}}</span></a></li>
							<li><a href="{{route('admin.cities')}}"><i class="fa fa-layer-group"></i> <span>{{__('Cities or Divisions')}}</span></a></li>
							<li><a href="{{route('admin.config')}}"><i class="fa fa-layer-group"></i> <span>{{__('Config')}}</span></a></li>
							<li><a href="{{ route('admin.logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="fas fa-sign-in-alt"></i>  {{ __('Logout') }}</a>
							<form id="logout-form" action="{{ route('admin.logout') }}" method="POST" style="display: none;">
							{{ csrf_field() }}
							</form></li>

						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!--left block end-->

		<!--right-block-->
		<div class="right-block">
			<div class="Navoverlay"></div>
			<div class="right-block-body">
				<div class="top-nav">
					<div class="nav-item clearfix">
						<div class="row">
							<div class="col-md-4 col-sm-4 col-xs-3">
								<div class="left-item">
									<button class="toggle-btn"><i class="fa fa-bars"></i></button>
								</div>
							</div>
							<div class="col-md-4 col-sm-4 d-none-m">
								 <div class="title">Dashboard</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-9 text-right">
								<div class="right-item">
									<div class="user-profile">
										   <a href="{{route('admin.profile')}}">
											<img onerror="profileImgError(this)" src="{{auth::user()->profile_image}}" alt="profile" class="img-responsive">
										</a>
										<span>
											<h2>{{auth::user()->name}}</h2>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!------right block body-->
                @section('content')@show
			</div>
		</div>
		<!--right-block end-->

	</main>
<!--script-->
<script type="text/javascript" src="{{asset('public/backend')}}/js/jquery.min.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/bootstrap.min.js"></script>
<!--data table-->
<script type="text/javascript" src="{{asset('public/backend')}}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/custom.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/sweetalert.min.js"></script>
@stack('js')
</body>
</html>