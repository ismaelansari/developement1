@extends('backend.layouts.loggedInApp')
@section('content')
    <div class="main-body">
           @include('backend.common.alert')
           <!-----START searching box--------->
          <section class="searching-filter">
            <form method="GET">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="input">
                        <input type="text" placeholder="Search by category & subcategory name" name="search" value="{{Request::get('search')}}">
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="col-md-6 col-sm-6 col-xs-6">
                  <div class="filter-btn">
                    <a class="button" href="{{route('admin.categories')}}">Clear</a>
                    <button class="button" type="submit">Submit</button>
                  </div>
                </div>
              </div>
            </form>
          </section>
          <!-----END searching box--------->

          <div class="inner-body">
            <!--header-->
            <div class="header">
              <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <div class="title">
                    <h2>Category List ({{count($data['categories'])}})</h2>
                    <a style="float: right;" class="btn-theme" href="{{route('admin.add.category')}}">Add Category</a>
                  </div>
                </div>
              </div>
            </div><!--END header-->

            <!--my tenders-->
            <div class="supplier-request">
              <div class="row">
                @forelse($data['categories'] as $key => $category)
                  <!--single-s-request-->
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-s-request">
                      <div class="img-text clearfix">
                        <div class="img">
                          <img src="{{$category->image}}" onerror="imgError(this)">
                        </div>
                        <div class="txt">
                          <h2>{{$category->title}}</h2>
                           <p><i class="fas fa-layer-group"></i>
                             @forelse($category->subCategories as $sub_category)
                                <span>{{$sub_category->title}},</span>
                             @empty
                                 <span>Sub category not available</span>
                             @endforelse
                           </p>
                        </div>
                      </div>
                      <div class="buttons txt">
                      <a href="{{route('admin.category.details',$category->id)}}">Details</a>
                      </div>
                    </div>
                  </div><!--END single-s-request-->
                  @empty
                @endforelse
              </div>
            </div><!--END my tenders-->

          </div>  
        </div>
@endsection
@push('js')
@endpush