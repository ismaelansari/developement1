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
	 <link rel="stylesheet" type="text/css" href="{{asset('public')}}/css/image-uploader.min.css">
	<style type="text/css">
		body{
			background: #000;
			margin: 0;
			padding: 0;
		}
		input, textarea {
		  color:#fff !important;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #14181e !important;
		  box-sizing: border-box;
		  background-color: #090e14 !important;
		  font-size: 15px !important;
		}

		select {
		  padding: 12px 20px;
		  margin: 8px 0;
		  color:#fff !important;
		  display: inline-block;
		  border: 1px solid #14181e !important;
		  box-sizing: border-box;
		  background-color: #01385f !important;
		  font-size: 15px !important;
		}

		input[type=submit] {
		  width: 100%;
		  background-color: #01385f !important;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		}
	</style>
</head>
<body>

  <div class="wrapper">
  	 <form class="form" action="{{url('api/submit/form')}}" method="post" enctype="multipart/form-data">
  	 	@csrf
  	 	<input type="hidden" name="user_id" value="{{Request::get('user_id')}}">
  	 	<input type="hidden" name="category_id" value="{{Request::get('category_id')}}">

			  	 	<div class="form-group">
			  	 		<input type="title" name="title" placeholder="Title" value="{{old('title')}}" class="form-control" autocomplete="off">
			  	 		@if($errors->has('title')) 
						    <div class="text-error">{{ $errors->first('title') }}</div>
						@endif
			  	 	</div>
			  	 	
			  	 	<div class="form-group">
                       <textarea name="description" placeholder="Description" class="form-control">{{old('description')}}</textarea>
   			  	 	   @if($errors->has('description'))
 						   <span class="text-error">{{ $errors->first('description') }}</span>
						@endif
			  	 	</div>
			  	 	
			  	 	<div class="form-group">
			  	 		<input type="number" name="price" placeholder="Price" value="{{old('price')}}" class="form-control" autocomplete="off">
			  	 	  	@if($errors->has('price'))
 						   <span class="text-error">{{ $errors->first('price') }}</span>
						@endif
			  	 	</div>

  	 	@forelse($data['fields'] as $key => $field)
			  @switch($field->type)
		       @case('text')
			  	 	<div class="form-group">
			  	 		<input type="text" name="{{$field->input_name}}" placeholder="{{$field->title}}"  class="form-control" value="{{old($field->input_name)}}" autocomplete="off">
			  	 		@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
						@endif
			  	 	</div>
		        @break

		        @case('email')
					<div class="form-group">
					     <input type="email" name="{{$field->input_name}}" placeholder="{{$field->title}}"  class="form-control" value="{{old($field->input_name)}}" autocomplete="off">
					     @if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
						 @endif
					</div>
				@break
			    @case('phone')
					<div class="form-group">
					<input type="text" name="{{$field->input_name}}" placeholder="{{$field->title}}"  class="form-control" value="{{old($field->input_name)}}" autocomplete="off">
					@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
					@endif
					</div>
				@break;
				@case('number')
					<div class="form-group">
					<input type="number" name="{{$field->input_name}}" placeholder="{{$field->title}}" value="{{old($field->input_name)}}"  class="form-control" autocomplete="off">
					@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
					@endif
					</div>
				@break;
				@case('cost')
					<div class="form-group">
					<input type="number" name="{{$field->input_name}}" placeholder="{{$field->title}}" value="{{old($field->input_name)}}" class="form-control" autocomplete="off">
					@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name)}}</div>
					@endif
					</div>
				@break;
				@case('time')
					<div class="form-group">
					<input type="time" name="{{$field->input_name}}" placeholder="{{$field->title}}" value="{{old($field->input_name)}}"  class="form-control" value="{{old($field->input_name)}}" autocomplete="off">
					@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
					@endif
					</div>
				@break;
				@case('date')
					<div class="form-group">
					<input type="date" name="{{$field->input_name}}" placeholder="{{$field->title}}"  class="form-control" value="{{old($field->input_name)}}" autocomplete="off">
					@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
					@endif
					</div>
				@break;
				@case('year')
					<div class="form-group">
					<input type="year" name="{{$field->input_name}}" value="{{old($field->input_name)}}" placeholder="{{$field->title}}"  class="form-control" autocomplete="off">
					@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
					@endif
					</div>
				@break
				@case('select')
					<div class="form-group">
					<select name="{{$field->input_name}}" class="form-control">
						<option >{{$field->input_name}}</option>
						@forelse(unserialize($field->field_options) as $option)
						 <option @if(old($field->input_name) == $option) selected @endif value="{{$option}}">{{$option}}</option>
						@empty
						@endforelse
					</select>
					@if($errors->has($field->input_name)) 
						    <div class="text-error">{{ $errors->first($field->input_name) }}</div>
					@endif
					</div>
				@break
			@endswitch
		@empty
		@endforelse
						<div class="form-group">
				  	 		<input type="title" name="city" placeholder="{{__('City')}}" value="{{old('city')}}" class="form-control" autocomplete="off">
				  	 		@if($errors->has('city')) 
							    <div class="text-error">{{ $errors->first('city') }}</div>
							@endif
				  	 	</div>
						<div class="drop-choose-img">
						     <div class="drag-upload-img"></div>
						</div>
		<input type="submit" value="Add">
  	 </form>
  </div>  

</body>
 <!--script-->
<script type="text/javascript" src="{{asset('public/backend')}}/js/jquery.min.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="{{asset('public/backend')}}/js/sweetalert.min.js"></script>
 <script type="text/javascript" src="{{asset('public')}}/js/image-uploader.min.js"></script>
<style type="text/css">
	 form{
		padding: 10px;
	 }
	 .image-uploader .upload-text {
        color:#fff;
	  }
</style>
<script type="text/javascript">
	 $('.drag-upload-img').imageUploader({
		preloaded: '',
		imagesInputName: 'image',
		preloadedInputName: 'old',
		maxSize: 6 * 1024 * 1024, // 6 MB
		maxFiles: 6, // Max 6 file upload
		extensions: ['.jpg', '.jpeg', '.png'],
		mimes:['image/jpg','image/jpeg', 'image/png']
	 });
</script>
</html>