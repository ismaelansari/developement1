@extends('backend.layouts.loggedInApp')
@section('content')
<div class="main-body">
@include('backend.common.alert')
					<div class="inner-body">
						<!--Start-->
						<div class="user-card-wrapper">
							<h2 class="title">User Details</h2>
							<div class="users-details-cart">
								<!--img-txt-->
								<div class="img-txt clearfix">
									<div class="img">
										<img onerror="profileImgError(this)" src="{{$data['product']->user->profile_image}}" alt="User Image">
									</div>
									<div class="txt">
										<h2>{{$data['product']->user->name ?? 'Not available' }}</h2>
										<p><i class="fas fa-envelope"></i> {{$data['product']->user->email ?? 'Not available' }}</p>
										<p><i class="fas fa-phone-alt"></i> {{$data['product']->user->mobile ?? 'Not available' }}</p>
										<p><i class="fas fa-calendar-alt"></i> Member since <span> {{date('d-M-Y',strtotime($data['product']->user->created_at))}}</span></p>
									</div>
								</div><!--img-txt-->

							</div>
						</div><!--end-->

						<!--Start-->
						<div class="user-card-wrapper">
								<h2 class="title">Product Details</h2>
								<div class="users-details-cart">
									<div class="cart-txt">
										<h2 class="title2">{{$data['product']->title}}</h2>
										<div class="category bpm">
											<label class="sub-heading">Category</label>
											<span>{{$data['product']->category->category_name}}</span>
											<span>{{$data['product']->subCategory->sub_category_name}}</span>
										</div>

										<div class="bpm">
											<div class="row">
													<div class="col-md-3">
														<div class="description">
															<label class="sub-heading">Price</label>
															<h5>$ {{$data['product']->price}}</h5>
														</div>
													</div>
													<div class="col-md-3">
														<div class="description">
															<label class="sub-heading">Features</label>
															
															<div class="custom-checkbox">
																<label class="single-checkbox">
																	<input type="checkbox" @if($data['product']->is_promotion) checked @endif" disabled>
																	<span class="checkmark"></span>
																</label>
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="description">
															<label class="sub-heading">Promotion</label>
															<div class="custom-checkbox">
																<label class="single-checkbox">
																	<input type="checkbox" @if($data['product']->is_featured) checked @endif" disabled>
																	<span class="checkmark"></span>
																</label>
															</div>
														</div>
													</div>
													<div class="col-md-3">
														<div class="description">
															<label class="sub-heading">Expiry Day's</label>
															<p>{{$data['product']->expiry_day ?? '-'}}</p>
														</div>
													</div>
												</div>
										</div>
										
										<div class="description bpm">
											<label class="sub-heading">Description</label>
											<p>{{$data['product']->description}}</p>
										</div>

										<div class="description bpm">
											<label class="sub-heading">Address</label>
											<p>{{$data['product']->address}}</p>
										</div>

										<div class="description bpm">
											<label class="sub-heading">YouTube</label>
											@if($data['product']->website_link)
											<a href="{{$data['product']->youtube_link}}">{{$data['product']->youtube_link}}</a>
											@else
											 -
											@endif
										</div>
										<div class="description bpm">
											<label class="sub-heading">Website</label>
											@if($data['product']->website_link)
											<a href="{{$data['product']->website_link}}">{{$data['product']->website_link}}</a>
											@else
											 -
											@endif
										</div>

										<div class="tags bpm">
											<label class="sub-heading">Tags</label>
											@if($data['product']->tags)
                                                 @php $tags = explode(',',$data['product']->tags)@endphp
                                                 @foreach($tags as $tag)
											     <span>{{$tag}}</span>
											     @endforeach
											@else
											  -
											@endif
									</div>
								</div>
						</div><!--end-->

						<!--Start-->
						<div class="user-card-wrapper">
							<h2 class="title">Images</h2>
							@if($data['product']->images)
							<div class="images">
								<div class="row">
									<!--single img-->
									@foreach($data['product']->images as $image)
										<div class="col-md-4">
											<div class="img">
												<img onerror="productImgError(this)" src="{{$image}}" alt="Product Image">
											</div>
										</div><!--end-->
									@endforeach
								</div>
							</div>
							@else
							 <p>Image not available</p>
							@endif
						</div><!--end-->

					</div>	
				</div>
@endsection
@push('js')
  <script type="text/javascript">

  	  //Image Preview
	  $('input[name="profile_image"]').on('change',function(e){
	   	  tmppath = URL.createObjectURL(event.target.files[0]);
		  $('.image-preview').attr('src',tmppath);
	  });

  	  // store or update clinic
      $('#update-profile-form').on('submit',function(e){
			e.preventDefault();
			var click = $(this);
			let form  = $(this);
 		    let data  = new FormData(this);
			$.ajax({
				"headers":{
				'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
			},
				'type':'POST',
				'url' : form.attr('action'),
				'data' : data,
				cache : false,
				contentType : false,
				processData : false,
			beforeSend: function() {

			},
			'success' : function(response){
 				  click.find('span').hide();
				if(response.status == 'success'){
   			      swal("Success!",response.message, "success");
				}
				if(response.status == 'failed'){
				  swal("Failed!",response.message, "error");
				}
				if(response.status == 'error'){
					 $.each(response.errors, function (key, val) {
					 click.find('[name='+key+']').after('<span style="color:red">'+val+'</span>');
					 });
				}
			},
			'error' : function(error){
				console.log(error);
			},
			complete: function() {

			},
			});
      });

      $('body').on('submit','#change-password',function(e){
	 	e.preventDefault();
	    var click = $(this);
		let form  = $(this);
	    let data = form.serialize();
		$.ajax({
			"headers":{
			'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
		},
			'type':'PUT',
			'url' : form.attr('action'),
			'data' : data,
		beforeSend: function() {

		},
		'success' : function(response){
				click.find('span').remove();
				click.find('input').val('');
			if(response.status == 'success'){
			      swal("Success!",response.message, "success");
			}
			if(response.status == 'failed'){
			  swal("Failed!",response.message, "error");
			}
			if(response.status == 'error'){
				$.each(response.errors, function (key, val) {
				click.find('[name='+key+']').after('<span style="color:red">'+val+'</span>');
				});
			}
		},
		'error' : function(error){
			console.log(error);
		},
		complete: function() {

		},
		});
	 });

  </script>
@endpush