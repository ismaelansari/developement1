@extends('backend.layouts.loggedInApp')
@section('content')
    <div class="main-body">

           <!-----START searching box--------->
          <section class="searching-filter">
            <form method="GET">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-6">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="input">
                        <input type="text" placeholder="Search by name, category , email , phone" name="search" value="{{Request::get('search')}}">
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="col-md-6 col-sm-6 col-xs-6">
                  <div class="filter-btn">
                    <a class="button" href="{{route('admin.products')}}">Clear</a>
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
                    <h2>Product List</h2>
                  </div>
                </div>
              </div>
            </div><!--END header-->

            <!--my tenders-->
            <div class="supplier-request">
              <div class="row">
                @foreach($data['products'] as $key => $product)
                <!--single-s-request-->
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="single-s-request">
                    <div class="img-text clearfix">
                      <div class="img">
                           <img onerror="productImgError(this)" src="{{$product->image}}" alt="Profile image">
                      </div>
                      <div class="txt">
                         <h2>{{$product->title}}</h2>
                         <p><i class="fas fa-user"></i><a href="{{route('admin.user.details',$product->created_by)}}">{{$product->user->name}}</a></p>
                         <p><i class="fas fa-layer-group"></i>{{$product->category->category_name}} > {{$product->subCategory->sub_category_name}}</p>
                         <p><i class="fas fa-tags"></i>{{number_format($product->price,2)}}</p>
                      </div>
                    </div>
                	<div class="buttons txt">
                        <a href="{{route('admin.product.details',$product->id)}}">Details</a>
					         </div>
                  </div>
                </div><!--END single-s-request-->
                @endforeach
              </div>
            </div><!--END my tenders-->

          </div>  
        </div>
@endsection
@push('js')
@endpush