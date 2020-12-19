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
                        <input type="text" placeholder="{{__('Search by city , division & local area')}}" name="search" value="{{Request::get('search')}}">
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="col-md-6 col-sm-6 col-xs-6">
                  <div class="filter-btn">
                    <a class="button" href="{{route('admin.cities')}}">{{__('Clear')}}</a>
                    <button class="button" type="submit">{{__('Submit')}}</button>
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
                    <h2>{{__('City Or Division')}} ({{count($data['cities'])}})</h2>
                    <a style="float: right;" class="btn-theme" href="{{route('admin.city.add')}}">{{__('Add City')}}</a>
                  </div>
                </div>
              </div>
            </div><!--END header-->

            <!--my tenders-->
            <div class="supplier-request">
              <div class="row">
                @forelse($data['cities'] as $key => $city)
                  <!--single-s-request-->
                  <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="single-s-request">
                      <div class="img-text clearfix">
                        <div class="txt">
                          <h2>{{$city->title}} ({{$city->title_bn}})</h2>
                          <p><b>{{__('Local Area')}} :</b> {{__('Not availabe')}}</p>
                        </div>
                      </div>
                      <div class="buttons txt">
                      <a href="{{route('admin.city.edit',$city->id)}}">{{__('Details')}}</a>
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