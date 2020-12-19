<?php

namespace App\Http\Controllers\Api;

use Hash;
use App\User;
use Validator;
use Illuminate\Http\Request;
use App\Helpers\CommonHelper;
use App\Helpers\ImageHelper;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Response;
use DB;
use App\Mail\NotifyMail;
use Mail;
use App\Models\Ad;
use App\Models\Field;
use App\Models\AdBid;

class AuthController extends Controller
{
    protected $guard = 'web';
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
     public function __construct(){
     }

     /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
 
     public function sendOtp(Request $request){
           $input = $request->all();
           $rules = [
             'mobile' => 'required'
           ];
           $validator = Validator::make($request->all(), $rules );
            if ($validator->fails()) {
               $errors =  $validator->errors()->all();
               return response(['status' => false , 'message' => $errors[0]]);              
            }

            $user = User::where('phone',$input['mobile'])->first();
            if($user){
              return ['status' => true , 'message' => __('Otp sent successfully')];
            }else{
              return ['status' => true , 'message' => __('This mobile number does not exist')];
            }
     }

     public function reSendOtp(Request $request){
           $input = $request->all();
           $rules = [
             'mobile' =>'required'
           ];
           $validator = Validator::make($request->all(), $rules );
            if ($validator->fails()) {
               $errors =  $validator->errors()->all();
               return response(['status' => false , 'message' => $errors[0]]);              
            }
            $user = User::where('phone',$input['mobile'])->first();
            if($user){
              return ['status' => true , 'message' => __('Otp re-sent successfully')];
            }else{
              return ['status' => true , 'message' => __('This mobile number does not exist')];
            }
     }

     public function verifyOtp(Request $request){
           $input = $request->all();
           $rules = [
             'mobile' => 'required',
             'otp'    => 'required',
             'device_token' => 'required'
           ];
           $validator = Validator::make($request->all(), $rules );
            if ($validator->fails()) {
               $errors =  $validator->errors()->all();
               return response(['status' => false , 'message' => $errors[0]]);              
            }
            
            $user = User::where('phone',$input['mobile'])->first();

            if($user && $user->otp == $input['otp']){
              return ['status' => true , 'message' => __('Successfully loggedin') , 'data' => $user ];
            }else{
              return ['status' => false   , 'message' => __('Failed to verify otp')];
            }
     }

     public function getProfile(Request $request) {
           $input = $request->all();
           $rules = [
             'user_id' => 'required'
           ];
           $validator = Validator::make($request->all(), $rules );
            if ($validator->fails()) {
               $errors =  $validator->errors()->all();
               return response(['status' => false , 'message' => $errors[0]]);              
            }
            $user = User::find($input['user_id']);
            if($user){
              return ['status' => true , 'message' => __('Record found') , 'data' => $user ];
            }else{
              return ['status' => false   , 'message' => __('Something went wrong')];
            }
     }

     public function updateProfile(Request $request) {
        
       
         $input = $request->all();
         $id    = $input['user_id'] ?? null;
         $rules = [
            'user_id'            => 'required',
            'first_name'         => 'required',
            'last_name'          => 'required',
            'email'              => 'required|unique:users,email,'.$id.',id,deleted_at,NULL',
            'profile_image'      => 'image|mimes:jpeg,png,jpg,gif,svg',
         ];
         
         $validator = Validator::make($request->all(), $rules);

         if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]]);              
         }

            $fileName = null;
              if ($request->hasFile('profile_image')) {
                $fileName = str_random('10').'.'.time().'.'.request()->profile_image->getClientOriginalExtension();
                request()->profile_image->move(public_path('images/profile/'), $fileName);
              }

            $User = User::find($id);
            
            $User->email        = $input['email'];
            $User->name         = $input['first_name'] .' '.$input['last_name'];
            $User->first_name   = $input['first_name'];
            $User->last_name    = $input['last_name'];
            $User->ibn_no       = $input['ibn_no'] ?? NULL;
            $User->national_id  = $input['national_id'] ?? NULL;

            if($fileName){
               $User->profile_image = $fileName;
            }

            if($User->update()){
              return ['status' => true,'message'=> __('Updated successfully')];
            }
            else{
              return ['status' => true,'message'=> __('Failed to update')];
            }

     }

     public function register(Request $request) {

         $input = $request->all();
       
         $rules = [
            'user_name'          => 'required',
            'email'              => 'required|unique:users,email,null,id,deleted_at,NULL',
            'phone'              => 'required|min:5|max:18|unique:users,phone,null,id,deleted_at,NULL',
            'profile_image'      => 'image|mimes:jpeg,png,jpg,gif,svg',
         ];

         $validator = Validator::make($request->all(), $rules);

           if ($validator->fails()) {
             $errors =  $validator->errors()->all();
             return response(['status' => false , 'message' => $errors[0]]);              
           }
           
           $fileName = array();
           if(isset($input['profile_image']) && !empty($input['profile_image'])){
             $fileName = ImageHelper::upload(ImageHelper::$userImage,$input['profile_image']);
           }

            $User = new User;
            
            $User->email        = $input['email'];
            $User->phone        = $input['phone'];
            $User->name         = $input['user_name'];
            $User->device_token = $input['device_token'] ?? NULL;
        //    $User->password     = Hash::make($input['password']);
            $User->role_id      = '2';
            if($fileName){
               $User->profile_image = $fileName;
            }
            if($User->save()){
            return response(['status' => true , 'message' => __('Registered successfully') , 'data' => $User]);
           }else{
             return response(['status' => false , 'message' => __('Failed to register please try again') ]);
           }
     }

     public function changePassword(Request $request){
      
         $input    = $request->all();

         $rules = [
                   'user_id'           => 'required',
                   'old_password'      => 'required',
                   'new_password'      => 'min:6|required_with:confirm_password|same:confirm_password',
                   'confirm_password'  => 'required|min:6',
                  ];

         $validator = Validator::make($request->all(), $rules);

         if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
         }

         $User = User::find($input['user_id']);

          if (!(Hash::check($request->old_password,  $User->password))) {
               return response(['status' => false , 'message' => 'Your old password does not matches with the current password  , Please try again'] , 200);
          }

          elseif(strcmp($request->old_password, $request->new_password) == 0){
               return response(['status' => false , 'message' => 'New password cannot be same as your current password,Please choose a different new password'] , 200);
          }

           $User  = User::find($input['user_id']);
           $User->password = Hash::make($input['new_password']);
           if($User->update()){
            return response(['status' => true , 'message' => 'Successfully updated password'] , 200);
           }
           return response(['status' => false , 'message' => 'Failed to update password'] , 200);
     }

     public function forgatePassword(Request $request){
        
         $input    = $request->all();

         $rules = [
                   'email'  => 'required|email',
                  ];

         $validator = Validator::make($request->all(), $rules);

         if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
         }

         $User = User::where('email',$input['email'])->first();

         if(empty($User) || is_null($User)){
            return ['status' => false , 'message' => 'This email does not exist'];
         }

           return ['status' => true , 'message' => 'Email sent to your email register email address'];

     }

     public function getCategories(){
       $categories = Category::whereNull('parent_id')->whereNull('deleted_at')->get();
       return ['status' => true,'message'=> __('Recoud found'),'data'=>$categories];
     }
     
     public function form(Request $request){
         $input    = $request->all();

         $rules = [
                   'category_id'  => 'required',
                   'user_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

         if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
         }
        $data['fields'] = Field::where('category_id',$input['category_id'])->whereNull('deleted_at')->get();
        return view('api.form',compact('data'));        

     }

     public function submitForm(Request $request){
        
        $inputs         = $request->all();
        $insertAdData   = array();
        $inserFieldData = array();

        $rules = [
                   'category_id'  => 'required',
                   'user_id'      => 'required',
                   'title'        => 'required',
                   'description'  => 'required',
                   'price'        => 'required',
                   'city'         => 'required',
                  ];

        $fields = Field::where('category_id',$inputs['category_id'])->get();

        $fieldIds = array();

        if($fields->toArray()){
           foreach ($fields as $key => $value) {
            $fieldIds[$value->input_name] = $value->id;
            if($value->is_required)
                $rules[$value->input_name] = 'required';
           }
        }

        $request->validate($rules);

        $insertData = [
                 'user_id'      => $inputs['user_id'],
                 'title'        => $inputs['title'],
                 'description'  => $inputs['description'],
                 'price'        => $inputs['price'],
                 'category_id'  => $inputs['category_id'],
                 'city'         => $inputs['city'] ?? NULL,
           ];
       
       $adId = DB::table('ads')->insertGetId($insertData);
       unset($inputs['user_id']);
       unset($inputs['category_id']);
       unset($inputs['title']);
       unset($inputs['description']);
       unset($inputs['price']);
       unset($inputs['city']);
       
       if(isset($inputs['_token'])){
           unset($inputs['_token']);
       }
       
         $imageData = array();
         if($request->hasFile('image')){
            foreach ($request->image as $key => $image) {
                $imageName = str_random('10').'.'.time().'.'.$image->getClientOriginalExtension();
                $image->move(public_path('images/ad/'), $imageName);
                array_push($imageData,['ad_id'=>$adId,'name'=>$imageName]);
            }
         }

       foreach ($inputs as $key => $value) {
          if($key != 'image')
              array_push($inserFieldData,['ad_id'=>$adId,'field_id'=>$fieldIds[$key],'value'=>$value]);
       }
       DB::table('ad_images')->insert($imageData);
       DB::table('ad_fields')->insert($inserFieldData);
       return redirect('api/ad/create/response?status=success');
     }

     public function adCreateResponse(Request $request){
       return view('api.form_submit_response');
     }

     public function getAd(Request $request){
       $inputs         = $request->all();

        $rules = [
                   'ad_id'  => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }

       $data['ad']     = Ad::find($inputs['ad_id']);
       $data['fields'] = Field::where('category_id',$data['ad']->category_id)->whereNull('deleted_at')->get();
       return view('api.ad',compact('data'));
     }
      
    public function getAds(Request $request){
        $inputs         = $request->all();

        $rules = [
                   'user_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }

       $ads = Ad::select('ads.*')->join('users','ads.user_id','=','users.id')
                  ->where(function($query) use ($request){
                    if($request){
                     if(isset($request->category_id) && $request->category_id){
                       $query->where('ads.category_id',$request->category_id);
                     }
                     if(isset($request->status) && $request->status){
                       $query->where('ads.status',$request->status);
                     }
                    }
                 }) 
                ->where('ads.is_active','1')
                ->where('ads.is_publish','1')
                ->where('users.is_active','1')
                ->whereNull('ads.deleted_at')
                ->whereNull('users.deleted_at')
                ->get();
       $data = array();
       if($ads->toArray()){
         foreach ($ads as $key => $value) {
            $temp = array();
            $temp['ad_id']   = $value->id; 
            $temp['title']  = $value->description;
            $temp['price']  = $value->price;
            $temp['time']   = date('Y-m-d h:i A',strtotime($value->created_at));
            $temp['city']   = 'Indore';
            $temp['total_bids'] = DB::table('ad_bids')->where('ad_id',$value->id)->count();
            $temp['image']  = $value->image;
            array_push($data, $temp);
         }
         return ['status' => true,'message'=>'Record not found','data'=>$data];
       }else{
         return ['status' => false  ,'message'=>'Record not found'];
       } 

    }

    public function makeBid(Request $request){
        $inputs         = $request->all();
        $rules = [
                   'user_id'      => 'required',
                   'ad_id'        => 'required',
                   'bid'          => 'required', 
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }
    
       $id = DB::table('ad_bids')->insertGetId($inputs);

       if($id){
          return ['status' => true,'message'=>'Success'];
       }else{
         return ['status' => false  ,'message'=>'Failed'];
       } 

    }

    public function getBid(Request $request){
        $inputs         = $request->all();
        $rules = [
                   'ad_id'        => 'required',
                   'user_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }

       $ads = AdBid::where('ad_id',$inputs['ad_id'])->whereNull('deleted_at')->get();
       $data = array();
       if($ads->toArray()){
         foreach($ads as $key => $value){
              $temp = [];
              $temp['user_id']   = $value->user_id;
              $temp['ad_id']     = $value->ad_id;
              $temp['name']      = $value->user->name;
              $temp['bid']       = $value->bid;
              array_push($data,$temp);
         }
       }
       if($ads){
          return ['status' => true,'message'=>'Bid found' , 'data' => $data];
       }else{
         return ['status' => false  ,'message'=>'Not found'];
       }
    }

    public function acceptBid(Request $request){
        $inputs         = $request->all();
        $rules = [
                   'user_id'       => 'required',
                   'ad_id'         => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }
         DB::beginTransaction();
        try {
          DB::table('ad_bids')->where('user_id',$inputs['user_id'])->where('ad_id',$inputs['ad_id'])->update(['bid_status'=>'1']);
          DB::table('ads')->where('id',$inputs['ad_id'])->update(['is_active'=>'2']);
          DB::commit();       
          return ['status' => true,'message'=>'Success'];      
        } catch ( \Exception $e) {
          DB::rollback();
          return ['status' => false  ,'message'=>$e->getMessage()];
        }
   }

   public function rejectBid(Request $request){
       $inputs         = $request->all();
        $rules = [
                   'ad_id'       => 'required',
                   'user_id'     => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }
         DB::beginTransaction();
        try {
          DB::table('ad_bids')->where('ad_id',$inputs['ad_id'])->where('user_id',$inputs['user_id'])->update(['bid_status'=>'2']);
          DB::commit();       
          return ['status' => true,'message'=>'Success'];      
        } catch ( \Exception $e) {
          DB::rollback();
          return ['status' => false  ,'message'=>$e->getMessage()];
        }
   }

   public function myBids(Request $request){
        $inputs         = $request->all();
        $rules = [
                   'user_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }

       $ads = AdBid::where('user_id',$inputs['user_id'])->whereNull('deleted_at')->get();

       $data = array();
       if($ads->toArray()){
         foreach($ads as $key => $value){
              $temp = [];
              $temp['bid_id']    = $value->id;
              $temp['ad_id']     = $value->ad_id;
              $temp['title']     = $value->ad->title;
              $temp['bid']       = $value->bid;
              $temp['time']      = date('Y M d h:i A',strtotime($value->created_at));
              $temp['total_bid'] = DB::table('ad_bids')->where('ad_id',$value->bid_id)->where('user_id','!=',$inputs['user_id'])->count();
              array_push($data,$temp);
         }
       }
       if($ads){
          return ['status' => true,'message'=>'Bid found' , 'data' => $data];
       }else{
         return ['status' => false  ,'message'=>'Not found'];
       }
   }

   public function doFavourite(Request $request){
      
        $inputs         = $request->all();

        $rules = [
                   'user_id'      => 'required',
                   'ad_id'        => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }     
      
       $isFavourite = DB::table('favouriate_ads')->where(['user_id'=>$inputs['user_id'],'ad_id'=>$inputs['ad_id']])->first();

       if($isFavourite){
        if(DB::table('favouriate_ads')->where(['user_id'=>$inputs['user_id'],'ad_id'=>$inputs['ad_id']])->delete()){
           return ['status' => true,'message'=> __('success')];
         }else{
           return ['status' => false  ,'message'=> __('failed')];
         }
       }else{
         if(DB::table('favouriate_ads')->insertGetId(['user_id'=>$inputs['user_id'],'ad_id'=>$inputs['ad_id']])){
           return ['status' => true,'message'=> __('success')];
         }else{
           return ['status'=>true,'message'=>__('failed')];
         }
       }
   }

   public function getFavourite(){

        $inputs         = $request->all();

        $rules = [
                   'user_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }       

      $ads = DB::table('favouriate_ads')
                ->join('ads','favouriate_ads.ad_id','=','ads.id')
                ->join('users','favouriate_ads.user_id','=','users.id')
                ->where('ads.is_active','1')
                ->where('ads.is_publish','1')
                ->where('users.is_active')
                ->whereNull('ads.deleted_at')
                ->whereNull('users.deleted_at')
                ->where('ads.user_id',$inputs['user_id'])
                ->get();
      $data = array();
       if($ads->toArray()){
         foreach ($ads as $key => $value) {
            $temp = array();
            $temp['ad_id']   = $value->id; 
            $temp['title']  = $value->description;
            $temp['price']  = $value->price;
            $temp['time']   = date('Y-m-d h:i A',strtotime($value->created_at));
            $temp['city']   = 'Indore';
            $temp['total_bids'] = DB::table('ad_bids')->where('ad_id',$value->id)->count();
            $temp['image']  = $value->image;
            array_push($data, $temp);
         }
         return ['status' => true,'message'=>'Record not found','data'=>$data];
       }else{
         return ['status' => false  ,'message'=>'Record not found'];
       }
   }

   public function getFavouriteAds(Request $request){
       
        $inputs         = $request->all();

        $rules = [
                   'user_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }

        $ads = Ad::select('ads.*')
                  ->join('favouriate_ads','ads.id','=','favouriate_ads.ad_id')
                  ->join('users','ads.user_id','=','users.id')
                  ->where(function($query) use ($request){
                    if($request){
                     if(isset($request->status) && $request->category_id){
                       $query->where('ads.category_id',$request->category_id);
                     }
                     if(isset($request->status) && $request->status){
                       $query->where('ads.status',$request->status);
                     }
                    }
                 }) 
                ->where('ads.is_active','1')
                ->where('ads.is_publish','1')
                ->where('users.is_active','1')
                ->whereNull('ads.deleted_at')
                ->whereNull('users.deleted_at')
                ->get();
       
         $data = array();
       if($ads->toArray()){
         foreach ($ads as $key => $value) {
            $temp = array();
            $temp['ad_id']   = $value->id; 
            $temp['title']  = $value->description;
            $temp['price']  = $value->price;
            $temp['time']   = date('Y-m-d h:i A',strtotime($value->created_at));
            $temp['city']   = 'Indore';
            $temp['total_bids'] = DB::table('ad_bids')->where('ad_id',$value->id)->count();
            $temp['image']  = $value->image;
            array_push($data, $temp);
         }
         return ['status' => true,'message'=>'Record not found','data'=>$data];
       }else{
         return ['status' => false  ,'message'=>'Record not found'];
       } 
   }

   public function getAdImage(Request $request){
       $inputs         = $request->all();

        $rules = [
                   'ad_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }

       $ad = Ad::find($inputs['ad_id']);
       if($ad){
         return ['status' => true,'message'=>'Record found','data'=>$ad->image]; 
       }
         return ['status' => false  ,'message'=>'Record not found'];
   }

   public function getAdImages(Request $request){
       $inputs         = $request->all();

        $rules = [
                   'ad_id'      => 'required',
                  ];

         $validator = Validator::make($request->all(), $rules);

       if ($validator->fails()) {
           $errors =  $validator->errors()->all();
           return response(['status' => false , 'message' => $errors[0]] , 200);              
       }

       $ad = Ad::find($inputs['ad_id']);
       if($ad){
         return ['status' => true,'message'=>'Record found','data'=>$ad->images]; 
       }
         return ['status' => false  ,'message'=>'Record not found'];
   }
}