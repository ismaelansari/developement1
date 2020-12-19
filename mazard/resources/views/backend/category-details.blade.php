@extends('backend.layouts.loggedInApp')
@section('content')
				<div class="main-body">
                    @include('backend.common.alert')
					<div class="inner-body">
						<!--header-->
						<div class="header">
							<div class="row">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="title">
										<!-- <h2>My Tenders</h2> -->
										<p class="navigation">
											<a href="{{route('admin.categories')}}">{{__('Category List')}}</a>
											<a href="Myuser-details.html">{{__('Category Details')}}</a>
										</p>
									</div>
								</div>
							</div>
						</div><!--END header-->

						<div class="row">
								<div class="col-md-12">
                        		<div class="text-right"><button class="btn btn-theme btn-add-field">Add Field</button></div>
                        	</div>
						</div>

						<!--supplier-details-->
						<div class="supplier-profile-details Myuser-details">
								<div class="row">
									<!--supplier profile-->
									<div class="col-md-4 col-sm-4 col-xs-12">
										<form action="{{route('admin.category.update',$data['category']->id)}}" method="post" enctype="multipart/form-data">
										@csrf
										{{ method_field('PUT')}}
											<div class="profile-details">
												<div class="row">
													<div class="col-md-12">
														<div class="input-details">
															<div class="form-group">
															   <input class="form-control" type="text" placeholder="{{__('title in english')}}" name="title" value="{{old('title') ?? $data['category']->title}}" >
																@if ($errors->has('title'))
																   <span class="text-error">{{ $errors->first('title') }}</span>
																@endif
															</div>
														</div>
													</div>
												</div>
												<div class="input-details">
													<div class="custom-upload-img">
													{{-- <span class="edit"><i class="fas fa-pencil-alt"></i></span> --}}
													<label>
														<img onerror="imageUpload(this)" src="{{$data['category']->image}}">
														<input type="file" name="image" accept="image/*">
	                                                	 @if ($errors->has('image'))
														     <span class="text-error">{{ $errors->first('image') }}</span>
														 @endif
													</label>
												</div>
												</div>
												<button class="btn-theme">{{__('Update')}}</button>
											</div>
										 </form>
									</div><!--END supplier profile-->
											<!--supplier profile-->
									<div class="col-md-8 col-sm-8 col-xs-12">
										<table class="table">
											<thead>
												<thead>
													<tr>
														<th>Title</th>
														<th>Type</th>
														<th>Defaul</th>
														<th>Required</th>
														<th>Edit/Delete</th>
													</tr>
												</thead>
												<tbody>
													@forelse($data['category']->fields as $key => $field)
														<tr>
															<td>{{$field->title}}</td>
															<td>{{$field->type}}</td>
															<td>{{$field->default ?? '-'}}</td>
															<td>{{$field->is_required ? 'Yes' : 'No'}}</td>
															<td><i data-id="{{$field->id}}" class="fa fa-edit btn-edit"></i>&nbsp;<i data-id="{{$field->id}}" class="fa fa-trash btn-dlt"></i></td>
														</tr>
													@empty
													@endforelse
												</tbody>
											</thead>
											
										</table>
									</div><!--END supplier profile-->
								</div>
						</div><!--END supplier-details-->

						<!-- Modal -->
						<div class="modal fade" id="add-field-modal" role="dialog" aria-labelledby="add-field-modal" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle">Add field</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						        <form action="{{route('admin.create.field')}}" method="post" id="create-field-form">
								      <div class="modal-body"> 
								        	@csrf
								        	<input type="hidden" name="category_id" value="{{$data['category']->id}}">
								           <div class="form-group">
								           	 <label>Title<span>*</span></label>
								             <input type="text" name="title" class="form-control">
								           </div>
								           <div class="form-group">
								           	 <label>Type<span>*</span></label>
		                                     <select class="form-control" name="type">
		                                     	<option value="text" selected>Text</option>
		                                     	<option value="email">Email</option>
		                                     	<option value="phone">Phone</option>
		                                     	<option value="number">Number</option>
		                                     	<option value="textarea">Textarea</option>
		                                     	<option value="radio">Radio</option>
		                                     	<option value="checkbox">CheckBox</option>
		                                     	<option value="password">Password</option>
		                                     	<option value="select">Select</option>
		                                     	<option value="time">Time</option>
		                                     	<option value="cost">Cost</option>
		                                     	<option value="date">Date</option>
		                                     	<option value="year">Year</option>
		                                     	<option value="file">File</option>
		                                     </select>
								           </div>
								           <div class="form-group">
								           	 <label>Default Value</label>
								             <input type="text" name="default" value="" class="form-control">
								           </div>
								           <div class="form-group">
								           	 <label>Help</label>
								             <input type="text" name="help" value="" class="form-control">
								           </div>
								           <div class="form-group option-input">
								           	 <label>Option</label>
								             <div>
								             	<input type="text" name="option" class="form-control" data-role="tagsinput">
								             </div>
								           </div>
								           <div class="form-group">
								           	<label>
								           	  <input type="checkbox" name="is_required" value="1"> Required
								           	</label>
								           </div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								        <button type="submit" class="btn btn-theme">Save</button>
								      </div>
						        </form>
						    </div>
						  </div>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="edit-field-modal" role="dialog" aria-labelledby="add-field-modal" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle">Edit field</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						        <form action="{{route('admin.update.field')}}" method="post" id="edit-field-form">
						        	@csrf
						        	{{ method_field('PUT') }}
						        	<input type="hidden" name="id" value="">
								      <div class="modal-body"> 
								        	@csrf
								        	<input type="hidden" name="category_id" value="{{$data['category']->id}}">
								           <div class="form-group">
								           	 <label>Title<span>*</span></label>
								             <input type="text" name="title" class="form-control">
								           </div>
								           <div class="form-group">
								           	 <label>Type<span>*</span></label>
		                                     <select class="form-control" name="type">
		                                     	<option value="text">Text</option>
		                                     	<option value="email">Email</option>
		                                     	<option value="phone">Phone</option>
		                                     	<option value="number">Number</option>
		                                     	<option value="textarea">Textarea</option>
		                                     	<option value="radio">Radio</option>
		                                     	<option value="checkbox">CheckBox</option>
		                                     	<option value="password">Password</option>
		                                     	<option value="select">Select</option>
		                                     	<option value="time">Time</option>
		                                     	<option value="cost">Cost</option>
		                                     	<option value="date">Date</option>
		                                     	<option value="year">Year</option>
		                                     	<option value="file">File</option>
		                                     </select>
								           </div>
								           <div class="form-group">
								           	 <label>Default Value</label>
								             <input type="text" name="default" value="" class="form-control">
								           </div>
								          <div class="form-group">
								           	 <label>Help</label>
								             <input type="text" name="help" value="" class="form-control">
								           </div>
								           <div class="form-group option-input">
								           	 <label>Option</label>
												<input type="text" name="option" data-role="tagsinput">
								           </div>
								           <div class="form-group">
								           	<label>
								           	  <input type="checkbox" name="is_required" value="1"> Required
								           	</label>
								           </div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
								        <button type="submit" class="btn btn-theme">Update</button>
								      </div>
						        </form>
						    </div>
						  </div>
						</div>

					</div>
				</div>
@endsection
@push('css')
 <style type="text/css">
 </style>
 <link rel="stylesheet" type="text/css" href="{{asset('public/backend/css/tag.input.min.css')}}">
@endpush
@push('js')
 <script type="text/javascript" src="{{asset('public/backend/js/tag.input.min.js')}}"></script>
 <script type="text/javascript">

 	 $('#add-field-modal input[name="option"]').tagsInput();

 	 $('.option-input').hide();

 	 $('select[name="type"]').on('change',function(e){
 	 	 let value = e.target.value;
 	 	     if(value == 'select'){
 	 	     	$('.option-input').show();
 	 	     }else{
 	 	     	$('.option-input').hide();
 	 	     }
 	 });

 	// Get Fields
 	  let getFields = function (){
					$.ajax(
					{
						"headers":{
						'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
					},
						'type':'get',
						'url' : "{{route('ajax.fields',$data['category']->id)}}",
					beforeSend: function() {

					},
					'success' : function(response){
						console.log(response);
						let html = '';
						response.data.map(function(field,key){
							html += '<tr>';
							html += `<td>${field.title}</td>`;
							html += `<td>${field.type}</td>`;
							html += `<td>${field.default != null && field.default != '' ? field.default : ''}</td>`;
							html += `<td>${field.is_required == '1' ? 'yes' : 'no'}</td>`;
							html += `<td><i data-id="${field.id}" class="fa fa-edit btn-edit"></i>&nbsp;<i data-id="${field.id}" class="fa fa-trash btn-dlt"></i></td>`;
							html += '<tr>';
						});
              	        $('table tbody').html(html);
					},
  					'error' : function(error){
					},
					complete: function() {
					},
					});
 	  }

 	  $('input[name="option"]').on('click',function(e){
 	  	 e.preventDefault();
         $('input[name="option"]').tagsInput({width:'auto'});
 	  });

 	   //Image Preview
      $('input[type="file"]').on('change',function(event){
      // event.preventDefault();
       tmppath = URL.createObjectURL(event.target.files[0]);
      });

         $('body').on('click','.btn-dlt',function(e){
		  	  let id  = $(this).attr('data-id');
	          let url = "{{route('admin.delete.field')}}" + '/' + id;
			  swal({
			  title: "{{__('Are you sure?')}}",
			  text: "{{__('Once deleted, you will not be able to recover this field!')}}",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			 })
			 .then((willDelete) => {
				if(!willDelete){
					return false;
				}
					$.ajax({
						"headers":{
						'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
					},
						'type':'DELETE',
						'url' : url,
					beforeSend: function() {
					},
					'success' : function(response){
						if(response.status == 'success'){
							swal("Success!",response.message, "success");
   					        getFields();
						}
						if(response.status == 'failed'){
							swal("Failed!",response.message, "error");
						}
					},
					'error' : function(error){
					},
					complete: function() {
					},
					});
			 });
	     });

	     $('.btn-add-field').on('click',function(e){
	     	$('#create-field-form input[type="text"],#create-field-form select').val('');
	     	$('#add-field-modal').modal('show');
	     });
         
         $('#create-field-form').on('submit',function(e){
         	e.preventDefault();
			let form  = $(this);
		    let data = form.serialize();
			$.ajax({
				"headers":{
				'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
			},
				'type':'POST',
				'url' : form.attr('action'),
				'data' : data,
			beforeSend: function() {

			},
			'success' : function(response){
				form.find('.text-error').remove();
				console.log(response);
				if(response.status == 'success'){
				      swal("Success!",response.message, "success");
	  				  form.find('input[type="text"],select').val('');
	  				  $('#add-field-modal').modal('hide');
                      getFields();
	  			}
				if(response.status == 'failed'){
				     swal("Failed!",response.message, "error");
				}
				if(response.status == 'error'){
					$.each(response.errors, function (key, val) {
					form.find('[name='+key+']').after('<span class="text-error">'+val+'</span>');
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

			$('body').on('click','.btn-edit',function(e){
				e.preventDefault();
				let id = $(this).attr('data-id');
				$.ajax(
					{
						"headers":{
						'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
					},
						'type':'get',
						'url' : "{{route('admin.ajax.field')}}" +'/'+ id,
					beforeSend: function() {

					},
					'success' : function(response){
					    if(response.status=='success'){
					    	$('#edit-field-modal input[name="id"]').val(response.data.id);
					    	$('#edit-field-modal input[name="title"]').val(response.data.title);
					    	$('#edit-field-modal select[name="type"]').val(response.data.type);
					    	$('#edit-field-modal input[name="default"]').val(response.data.default);
					    	$('#edit-field-modal input[name="help"]').val(response.data.help);
					    	$('#edit-field-modal input[name="is_required"]').prop('checked',response.data.help);
					    	if(response.data.type == 'select'){
					    		 $('#edit-field-modal .option-input').show();
				    	    	 $('#edit-field-modal input[name="option"]').val(response.data.field_options);
				    	    	 $('#edit-field-modal input[name="option"]').tagsInput('refresh');
					    	}
					    }
					},
  					'error' : function(error){
					},
					complete: function() {
					},
					});
				$('#edit-field-modal').modal('show');
			});

			$('#edit-field-form').on('submit',function(e){
         	e.preventDefault();
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
				form.find('.text-error').remove();
				if(response.status == 'success'){
				      swal("Success!",response.message, "success");
	  				  form.find('input[type="text"],select').val('');
	  				  $('#edit-field-modal').modal('hide');
                      getFields();
	  			}
				if(response.status == 'failed'){
				     swal("Failed!",response.message, "error");
				}
				if(response.status == 'error'){
					$.each(response.errors, function (key, val) {
					form.find('[name='+key+']').after('<span class="text-error">'+val+'</span>');
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

