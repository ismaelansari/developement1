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
                        <input type="text" placeholder="Search by name, email , phone" name="search" value="{{Request::get('search')}}">
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="col-md-6 col-sm-6 col-xs-6">
                  <div class="filter-btn">
                    <a class="button" href="{{route('admin.users')}}">Clear</a>
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
                    <h2>User List ({{$data['users']->total()}})</h2>
                  </div>
                </div>
              </div>
            </div><!--END header-->

            <!--my tenders-->
            <div class="supplier-request">
              <div class="row">
                @foreach($data['users'] as $key => $user)
                <!--single-s-request-->
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="single-s-request">
                    <div class="img-text clearfix">
                      <div class="img">
                           <img src="{{$user->profile_image}}" onerror="profileImgError(this)">
                      </div>
                      <div class="txt">
                         <h2>{{$user->name}}</h2>
                         <p><i class="fas fa-envelope"></i>{{$user->email}}</p>
                         <p><i class="fas fa-phone"></i>{{$user->phone}}</p>
                      </div>
                    </div>
                	<div class="buttons txt">
                        <a href="{{route('admin.user.details',$user->id)}}">Details</a>
					</div>
                  </div>
                </div><!--END single-s-request-->
                @endforeach
              </div>
              <div class="row">
                <div class="col-md-12 text-right">
                   {{-- Render Pagination --}}
                   {{ $data['users']->appends(request()->query())->links()  }}
                  </div>
              </div>
            </div><!--END my tenders-->

          </div>  
        </div>
@endsection
@push('js')
@endpush