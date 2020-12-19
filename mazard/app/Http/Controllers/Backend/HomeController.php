<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Models\Category;
use App\Models\CityArea;
use App\Models\Config;
use App\Models\City;
use App\Models\Field;
use App\Models\FieldOption;
use App\Models\CategoryField;
use DB;
use Image;
use auth;

class HomeController extends Controller
{

     /**
     * Create a new controller instance.
     *
     * @return void
     */
     public function __construct()
     {
        $this->middleware('admin');
     }

     public function home(Request $request){
       $data['totalUser']    = User::where('id','!=',1)->count();
       return view('backend.home',compact('data'));
     }

     public function profile(Request $request){
      $data['user']  = User::find(auth::id());
      return view('backend.profile',compact('data'));
     }

     public function updateProfile(Request $request){
        $input = $request->all();
        $id    = auth::id();
        $rules = array(
            'name'       => 'required|string|max:255',
            'email'      => 'required|string|email|max:255|unique:users,email,'.$id.',id,deleted_at,NULL',
            'phone'      => 'required|unique:users,phone,'.$id.',id,deleted_at,NULL',
        );

        // Validate 
        $validator = \Validator::make($request->all(), $rules);
        if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to update profile', '' , 'errors' => $validator->errors());
        }

        $fileName = null;
        if ($request->hasFile('profile_image')) {
            $fileName = str_random('10').'.'.time().'.'.request()->profile_image->getClientOriginalExtension();
            request()->profile_image->move(public_path('images/profile'), $fileName);
        }
        
        $User = User::find($id);
        $User->name      = $input['name'];
        $User->email     = $input['email'];
        $User->phone     = $input['phone']   ?? '';
        if($fileName){
          $User->profile_image = $fileName;
        }
        if($User->update()){
        	return ['status'=>'success','message'=>'Successully updated profile'];
        }else{
        	return ['status'=>'failed','message'=>'Failed to update profile'];
        }
     }

     public function users(Request $request){
        $users = User::where(function($query) use ($request){
                           if($request->search){
                              $query->whereRaw('LOWER(name) like ?', '%'.strtolower($request->search).'%');
                              $query->orWhereRaw('LOWER(email) like ?', '%'.strtolower($request->search).'%');
                              $query->orWhereRaw('LOWER(phone) like ?', '%'.strtolower($request->search).'%');
                           }
                      })
                      ->orderBy('id','desc')
                      ->where('role_id','2')
                      ->paginate(10);
        $data = array('users'=>$users);
        return view('backend.user',compact('data'));
     }

     public function userDetails($id){
       $user = User::find($id);
       $data = array('user'=>$user);
       return view('backend.user-details',compact('data'));
     }

     public function userChangeStatus($id){
        $user   = User::find($id);
        $status = $user->is_active;
        $user->is_active = $status == '1' ? '0' : '1';
        if($status == '1')
             $text = 'inactive';
        else
             $text = 'active';
        if($user->update())
             return ['status'=>'success','message'=>'Successully ' . $text .' user'];
         else
             return ['status'=>'failed','message'=>'Failed to ' . $text .' user'];
     }

     public function products(Request $request){
       $products = Product::select('product.*')
                      ->join('users','product.created_by','=','users.id')
                      ->leftJoin('category','product.category_id','=','category.id')
                      ->leftJoin('subcategory','product.sub_category_id','=','subcategory.id')
                      ->where(function($query) use ($request){
                           if($request->search){
                              $query->whereRaw('LOWER(title) like ?', '%'.strtolower($request->search).'%');
                              $query->orWhereRaw('LOWER(email) like ?', '%'.strtolower($request->search).'%');
                              $query->orWhereRaw('LOWER(mobile) like ?', '%'.strtolower($request->search).'%');
                              $query->orWhereRaw('LOWER(category_name) like ?', '%'.strtolower($request->search).'%');
                              $query->orWhereRaw('LOWER(sub_category_name) like ?', '%'.strtolower($request->search).'%');
                           }
                      })
                      ->orderBy('product.id','desc')
                      ->get();
        $data = array('products'=>$products);
        return view('backend.product',compact('data'));
     }

     public function productDetails($id){
      $data['product'] = Product::find($id);
      $data['user']    = User::find($data['product']->created_by);
      return view('backend.product-details',compact('data'));
     }

     public function changePassword(Request $request){
        $input    = $request->all();
        $rules = [
                 'old_password'      => 'required',
                 'new_password'      => 'min:6|required_with:confirm_password|same:confirm_password',
                 'confirm_password'  => 'required|min:6',
                ];

           // Validate 
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
            return ['status' => 'error' , 'msg' => __('failed to update apartment'), '' , 'errors' => $validator->errors()];
         }

         if (!(Hash::check($request->old_password, auth()->user()->password))) {
             return ['status' => 'failed' , 'message' => __('Your old password does not matches with the current password  , Please try again')];
         }
         elseif(strcmp($request->old_password, $request->new_password) == 0){
             return ['status' => 'failed' , 'message' => __('New password cannot be same as your current password,Please choose a different new password')];
         }

         $User  = User::find(auth::id());
         $User->password = Hash::make($input['new_password']);
         if($User->update()){
           return ['status' => 'success' , 'message' => __('Successfully updated password')];
         }
           return ['status' => 'failed' , 'message' => __('Failed to update password')];
     }

     public function categories(Request $request){
       $categories = Category::select('categories.*')->where(function($query) use ($request){
                           if($request->search){
                              $query->whereRaw('LOWER(title) like ?', '%'.strtolower($request->search).'%');
                           }
                      })->whereNull('parent_id')->orderBy('categories.title','asc')->get();
       $data['categories'] = $categories;
       return view('backend.categories',compact('data'));
     }

     public function addCategory(Request $request){
        $data['categories']  = Category::whereNull('parent_id')->orderBy('title','asc')->get();
        return view('backend.add-category',compact('data'));
     }

     public function storeCategory(Request $request){

        $input = $request->all();
        $rules = [
           'title' => 'required',
           'image'    => 'mimes:jpeg,jpg,png|max:10000'
        ];
        $request->validate($rules);

        $category = new Category;
        $category->title         = $input['title'];

        $fileName = null;
        if ($request->hasFile('image')) {
            $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(public_path('images/category'), $fileName);
        }

        if($fileName)
             $category->image = $fileName;
  
        if($category->save())
          return redirect()->route('admin.categories')->with('status',true)->with('message','Successfully added category');
        else
          return redirect()->route('admin.categories')->with('stautus',false)->with('message','Failed to added category');
     }

     public function categoryDetail($id){
        $data['categories']  = Category::whereNull('parent_id')->orderBy('title','asc')->get();
        $data['category']    = Category::find($id);
        if($data['categories']->toArray()){
             foreach($data['categories'] as $key => $category){
                 if($category->id == $data['category']->parent_id)
                  $data['categories'][$key]->is_selected = true;
                 else
                  $data['categories'][$key]->is_selected = false;
             }
        }
        return view('backend.category-details',compact('data'));
     }

     public function categoryUpdate(Request $request,$id){
       $categoryId = $id;
       $input = $request->all();
       $rules = [
           'title' => 'required',
           'image'         => 'mimes:jpeg,jpg,png|max:10000'
        ];
        $request->validate($rules);

        $category = Category::find($categoryId);
        $category->title         = $input['title'];

        $fileName = null;
        if ($request->hasFile('image')) {
            $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
            request()->image->move(public_path('images/category'), $fileName);
        }

        if($fileName)
             $category->image = $fileName;
  
        if($category->update())
          return redirect()->route('admin.categories')->with('status',true)->with('message',__('Successfully updated category'));
        else
          return redirect()->route('admin.categories')->with('stautus',false)->with('message',__('Failed to update category'));

     }

      public function removeCategory(Request $request){
       $input = $request->all();
       $rules = [
           'parent_category' => 'required',
           'sub_category'    => 'required',
        ];
        $request->validate($rules);

        $category = Category::where('parent_id',$input['parent_category'])->where('id',$input['sub_category'])->update(['deleted_at'=>date('Y-m-d H:i:s')])->first();
  
        if($category->update())
            return redirect()->route('admin.categories')->with('status',true)->with('message',__('Successfully deleted category'));
          else
            return redirect()->route('admin.categories')->with('status',false)->with('message',__('Failed to delete category'));
     }

     public function addSubcategory(Request $request){
       $input = $request->all();
       $rules = [
           'parent_category_id' => 'required',
           'english_title'      => 'required',
           'bangla_title'       => 'required'
        ];
          // Validate 
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to add product', '' , 'errors' => $validator->errors());
         }

        $category = new Category;
        $category->parent_id     = $input['parent_category_id'];
        $category->title         = $input['english_title'];
        $category->title_bn      = $input['bangla_title'];
  
        if($category->save())
            return ['status'=>'success','message'=>__('Successfully added sub category')];
          else
            return ['status'=>'success','message'=>__('Failed to add sub category')];
     }

     public function updateSubcategory(Request $request){
       $input = $request->all();
       $rules = [
           'parent_category_id' => 'required',
           'category_id'        => 'required',
           'english_title'      => 'required',
           'bangla_title'       => 'required'
        ];
          // Validate 
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to update product', '' , 'errors' => $validator->errors());
         }

        $category = Category::find($input['category_id']);
        $category->parent_id     = $input['parent_category_id'];
        $category->title         = $input['english_title'];
        $category->title_bn      = $input['bangla_title'];
  
        if($category->update())
            return ['status'=>'success','message'=>__('Successfully updated sub category')];
          else
            return ['status'=>'success','message'=>__('Failed to update sub category')];
     }

    public function removeSubcategory(Request $request,$id){
       $input = $request->all();
       $category = Category::where('parent_id',$input['parent_category_id'])->where('id',$id)->first();
       $category->deleted_at = date('Y-m-d H:i:s');
        if($category->update())
            return ['status'=>'success','message'=>__('Successfully deleted sub category')];
          else
            return ['status'=>'failed','message'=>__('Failed to delete sub category')];
     }

     public function createField(Request $request){
       $input = $request->all();
       $rules = [
           'category_id'  => 'required',
           'title'        => 'required',
        ];

          // Validate 
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to add field', '' , 'errors' => $validator->errors());
         }

         DB::beginTransaction();
         
         try {
         $fieldId = DB::table('fields')->insertGetId([
                     'category_id'   => $input['category_id'],
                     'title'         => $input['title'],
                     'type'          => $input['type'] ?? 'text',
                     'default'       => $input['default'] ?? NULL,
                     'help'          => $input['default'] ?? NULL,
                     'is_required'   => $input['is_required'] ?? '0',
                     'field_options' => isset($input['option']) ? serialize(explode(',',$input['option'])) : serialize(array())
                    ]);
                    DB::commit();
            return ['status'=>'success','message'=> 'Successfully added field'];
         } catch (\Exception $e) {
            DB::rollback();
           return ['status'=>'failed','message'=> $e->getMessage()];
         }
     }

     public function updateField(Request $request){
       $input = $request->all();
       $rules = [
           'id'           => 'required',
           'category_id'  => 'required',
           'title'        => 'required'
        ];
          // Validate 
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
            return array('status' => 'error' , 'msg' => 'failed to update field', '' , 'errors' => $validator->errors());
         }
         
         DB::beginTransaction();
         
         try {
             DB::table('fields')->where('id',$input['id'])->update([
                    'category_id'   => $input['category_id'],
                     'title'         => $input['title'],
                     'type'          => $input['type'] ?? 'text',
                     'default'       => $input['default'] ?? NULL,
                     'help'          => $input['default'] ?? NULL,
                     'is_required'   => $input['is_required'] ?? '0',
                     'field_options' => isset($input['option']) ? serialize(explode(',',$input['option'])) : serialize(array())
                    ]);
             DB::commit();
            return ['status'=>'success','message'=> 'Successfully updated field'];
         } catch (\Exception $e) {
            DB::rollback();
           return ['status'=>'failed','message'=> $e->getMessage()];
         }
     }

     public function deleteField($id){
        if(DB::table('fields')->where('id',$id)->update(['deleted_at'=>date('Y-m-d H:i:s')])){
            return ['status'=>'success','message'=>'Successfully deleted field'];
        }else{
            return ['status'=>'failed','message'=>'Failed to delete field'];
        }
     }

     public function addSubcategoryAjax($id){
         $data['category'] = Category::find($id);
         return view('backend.sub-category-list',compact('data'));
     }

     public function config(Request $request){
        $data['config'] = Config::where(function($query) use ($request){
              if($request->key)
                  $query->where('key',$request->key);
        })->orderBy('key','asc')->get();
        return view('backend.config',compact('data'));
     }

     public function getConfig($id){
        $data['config'] = Config::find($id);
        return view('backend.editConfig',compact('data'));
     }

     public function updateConfig(Request $request,$id){
        $input = $request->all();
        $rules = array(
            'key'       => 'required',
            'value'      => 'required',
        );
        $request->validate($rules);
        $config = Config::find($id);
        $config->value = $input['value'];
        if($config->update())
            return redirect()->route('admin.config')->with('status',true)->with('message','Successfully updated');
        else
            return redirect()->route('admin.config')->with('status',false)->with('message','Failed to update config');
     }

     public function  cities(Request $request){
        $data['cities'] = City::orderBy('id','desc')->get();
        return view('backend.cities',compact('data'));
     }

     public function addCity(){
        return view('backend.add-city');
     }

     public function editCity($id){
        $data['city'] = City::find($id);
        return view('backend.city-details',compact('data'));
     }

     public function storeCity(Request $request){
        $input = $request->all();
        $rules = [
           'english_title' => 'required',
           'bangla_title'  => 'required',
           'type'          => 'required',
        ];
        $request->validate($rules);
        $city = new City;
        $city->title         = $input['english_title'];
        $city->title_bn      = $input['bangla_title'];
        $city->type          = $input['type'];
        if($city->save())
          return redirect()->route('admin.cities')->with('status',true)->with('message',__('Successfully added city'));
        else
          return redirect()->route('admin.cities')->with('stautus',false)->with('message',__('Failed to added city'));
     }

     public function updateCity(Request $request,$id){
        $input = $request->all();
        $rules = [
           'english_title' => 'required',
           'bangla_title'  => 'required',
           'type'          => 'required',
        ];
        $request->validate($rules);

        $city = City::find($id);
        $city->title         = $input['english_title'];
        $city->title_bn      = $input['bangla_title'];
        $city->type          = $input['type'];
        if($city->update())
          return redirect()->route('admin.cities')->with('status',true)->with('message',__('Successfully updated city'));
        else
          return redirect()->route('admin.cities')->with('stautus',false)->with('message',__('Failed to update city'));
     }
     
     public function updateCityLocalarea(Request $request,$id){
      
        $input = $request->all();
        $rules = [
           'english_title' => 'required',
           'bangla_title'  => 'required',
        ];
        $request->validate($rules);
        $CityArea = CityArea::find($id);
        $CityArea->title         = $input['english_title'];
        $CityArea->title_bn      = $input['bangla_title'];
        if($CityArea->update())
           return ['status'=>'success','message'=>__('Successfully updated city area')];
        else
           return ['status'=>'failed','message'=>__('Failed to update city area')];
     }



    public function addArea(Request $request){
       $input = $request->all();
       $rules = [
           'city_id'            => 'required',
           'english_title'      => 'required',
           'bangla_title'       => 'required'
        ];
          // Validate 
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
            return array('status' => 'error' , 'msg' => __('failed to add area'), '' , 'errors' => $validator->errors());
         }

        $CityArea = new CityArea;
        $CityArea->city_id       = $input['city_id'];
        $CityArea->title         = $input['english_title'];
        $CityArea->title_bn      = $input['bangla_title'];
  
        if($CityArea->save())
            return ['status'=>'success','message'=>__('Successfully added area')];
          else
            return ['status'=>'failed','message'=>__('Failed to add area')];
    }

    public function updateArea(Request $request){
      $input = $request->all();
       $rules = [
           'area_id'            => 'required',
           'english_title'      => 'required',
           'bangla_title'       => 'required'
        ];
          // Validate 
         $validator = \Validator::make($request->all(), $rules);
         if($validator->fails()){
            return array('status' => 'error' , 'msg' => __('failed to update area'), '' , 'errors' => $validator->errors());
         }

        $CityArea = CityArea::find($input['area_id']);
        $CityArea->title         = $input['english_title'];
        $CityArea->title_bn      = $input['bangla_title'];

        if($CityArea->update())
            return ['status'=>'success','message'=>__('Successfully updated area')];
          else
            return ['status'=>'failed','message'=>__('Failed to update  area')];
    }

    public function removeArea(Request $request,$id){
       $input = $request->all();
       $CityArea = CityArea::where('city_id',$input['city_id'])->where('id',$id)->first();
       $CityArea->deleted_at = date('Y-m-d H:i:s');
        if($CityArea->update())
            return ['status'=>'success','message'=>__('Successfully deleted area')];
          else
            return ['status'=>'failed','message'=>__('Failed to delete sub area')];
    }

    public function ajaxAreaAjax($id){
       $data['city'] = City::find($id);
       return view('backend.city-area-list',compact('data'));
    }

}