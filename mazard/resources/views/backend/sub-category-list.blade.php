@forelse($data['category']->subCategories as $key => $subcategory)
<div class="profile-details">
	<label class="btn-dlt-wrapper">
		<i class="fa fa-trash btn-dlt" data-parent-category-id="{{$data['category']->id}}" data-url="{{route('admin.subcategory.remove',$subcategory->id)}}"></i>
	</label>
<form action="{{route('admin.subcategory.update')}}" method="POST" class="update-subcategory-form">
	@csrf
	<input type="hidden" name="category_id" value="{{$subcategory->id}}">
	<input type="hidden" name="parent_category_id" value="{{$data['category']->id}}">
	<div class="row">
		<div class="col-md-6">
			<div class="input-details">
				<div class="form-group">
				   <input class="form-control" type="text" placeholder="{{__('title in english')}}" name="english_title" value="{{$subcategory->title}}" readonly>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="input-details">
				<div class="form-group">
					<input class="form-control" type="text" placeholder="{{__('title in bangla')}}" name="bangla_title" value="{{$subcategory->title_bn}}" readonly>
				</div>
			</div>
		</div>
	</div>
	<div class="btn-wrapper">
		<button class="btn-theme btn-edit">{{__('Edit')}}</button>
		<button style="display: none;" class="btn-theme btn-reset">{{__('Reset')}}</button>
		<input style="display: none;" type="submit" class="btn-theme btn-update" value="{{__('Update')}}">
	</div>
</form>
</div>
@empty
@endforelse