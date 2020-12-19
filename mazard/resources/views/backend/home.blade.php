@extends('backend.layouts.loggedInApp')
@section('content')
 <div class="main-body">
   <div class="dashboard-data">
   		<div class="row">
               <div class="col-md-3 col-sm-4 col-xs-12">
                  <a href="{{route('admin.users')}}">
                  <div class="single-data">
                     <div class="img">
                        <i class="fas fa-users"></i>
                     </div>
                     <div class="txt">
                        <h2>Users</h2>
                        <h3>{{$data['totalUser']}}</h3>
                     </div>
                  </div>
                  </a>
               </div>
   		</div>
   </div>
 </div>

 <style type="text/css">
 	.dashboard-data a{
      display: block;
 	}
 	.dashboard-data .single-data{
 		padding: 20px 15px;
 		text-align: center;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.13);
    margin-bottom: 30px;
 	}
  .dashboard-data .single-data:hover .img i{
    color: #000 !important;
    transform: scale(1.2);
  }
 	.dashboard-data .single-data .img{
 		margin: 0 0 20px;
 	}
 	.dashboard-data .single-data .img i{
 		font-size: 40px;
 		color: #e45a63;
    transition: all 0.5s;
 	}
 	.dashboard-data .single-data .txt{
 		
 	}
 	.dashboard-data .single-data .txt h2{
 		margin: 0px 0px 10px;
    font-size: 18px;
    font-weight: 600;
    color: #000;
 	}
 	.dashboard-data .single-data .txt h3{
 		margin: 0;
    font-size: 20px;
    font-weight: 600;
    color: #e45a63;
 	}
 </style>
@endsection