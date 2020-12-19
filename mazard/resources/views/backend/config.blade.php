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
                        <input type="text" placeholder="Search by key" name="key" value="{{Request::get('key')}}">
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="col-md-6 col-sm-6 col-xs-6">
                  <div class="filter-btn">
                    <a class="button" href="{{route('admin.config')}}">Clear</a>
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
                  </div>
                </div>
              </div>
            </div><!--END header-->

            <!--my tenders-->
            <div class="supplier-request">
                <table class="table">
                  <tr>
                     <thead>
                        <th>Sr.</th>
                        <th>Config Key</th>
                        <th>Value</th>
                        <th>Action</th>
                     </thead>
                     <tbody>
                        @php $i = 1 @endphp
                        @foreach($data['config'] as $key => $config)
                           <tr>
                             <td>{{$i++}}</td>
                             <td>{{$config->key}}</td>
                             <td>{{$config->value}}</td>
                             <td><a href="{{route('admin.get.config',$config->id)}}" class="btn primary">Edit</a></td>
                           </tr>
                        @endforeach
                     </tbody>
                  </tr>
                </table>
            </div><!--END my tenders-->

          </div>  
        </div>
@endsection
@push('js')
@endpush