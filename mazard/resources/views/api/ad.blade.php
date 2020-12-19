<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>
	<meta name="keywords" content="mazard">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="{{asset('public/backend/images/favicon-icon.png')}}">
	<!--css-->
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/css/bootstrap.min.css">
	<!--font awesome 4-->
	<link rel="stylesheet" type="text/css" href="{{asset('public/backend')}}/fonts/fontawesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="{{asset('public')}}/css/app.css">
	<style type="text/css">

	   /* #01385f */
		body{
			background: #000;
            color:#fff;		
		}
		.wrapper {
		    padding: 15px;
		}
		.wrapper .bb{
			margin-bottom: 10px;
			padding-bottom: 10px;
			border-bottom: 1px solid #212121;
		}
		.wrapper .title-price{
			position: relative;
		}
		.wrapper .title-price h1 {
		    color: #fff;
		    font-size: 18px;
		    margin: 0 0 5px;
		    font-weight: 600;
		    padding-right: 75px;
		}
		.wrapper .title-price h2{
			color: #fff;
		    font-size: 18px;
		    margin: 0;
		    font-weight: 600;
		}
		.wrapper .title-price span{
			font-size: 12px;
		    font-weight: 400;
		    color: #c1c1c1;
		    position: absolute;
		    right: 0;
		    top: 0;
		    z-index: 1;
		}
		.wrapper .description p{
			font-size: 13px;
		    color: #c1c1c1;
		    line-height: 18px;
		    margin: 0;
		}

		.wrapper .same-title{
			color: #fff;
		    font-size: 15px;
		    margin: 0 0 5px;
		}
		.wrapper .details p{
			font-size: 13px;
		    color: #c1c1c1;
		    line-height: 18px;
		    margin: 0;
		    width: 50%;
		    display: inline-block;
		    padding: 3px 0;
		    float: left;
		}
		.wrapper .details p span{
			color: #2196F3;
			margin-left: 2px;
		}

		</style>
</head>
<body>

  <div class="wrapper">
  	<div class="title-price bb">
  		<h1>{{$data['ad']->title}}</h1>
  		<h2>$200 <span>20/08/2020</span> </h2>
  	</div>

  	<div class="details bb">
  		<h2 class="same-title">Details</h2>

  		<div class="inner-details clearfix">
  			<p>Year: <span>2020</span></p>
  			<p>Mileage: <span>70</span></p>
  			<p>Condition: <span>New</span></p>
  			<p>Color: <span>White</span></p>
  		</div>
  	</div>

    <div class="description bb">
    	<h2 class="same-title">Description</h2>
    	<p>{{$data['ad']->description}}</p>
    </div>
  </div>  

</body>
 <!--script-->
<script type="text/javascript" src="{{asset('public/backend')}}/js/jquery.min.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/sweetalert.min.js"></script>
<style type="text/css">
	form{
		padding: 10px;
	}
</style>
</html>