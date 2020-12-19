<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class Ad extends Model
{
      use SoftDeletes;

      public function user(){
       return $this->hasOne('App\User','id','user_id');
      }

      public function adFields(){
       return $this->hasMany('App\Models\AdField','ad_id','id');
      }

      public function getImageAttribute(){
            $imageData = DB::table('ad_images')->where('ad_id',$this->id)->first();
            if($imageData)
               return asset('pulic/images/ad/'.$imageData->name);
            return '';
      }

      public function getImagesAttribute(){
            $imageData = DB::table('ad_images')->where('ad_id',$this->id)->get();
            $images    = array();
            if($imageData->toArray()){
                  foreach($imageData as $image){
                     array_push($images,asset('pulic/images/ad/'.$image->name));
                  }
            }
            return $images;
      }

      public function category(){
       return $this->hasOne('App\Models\Category','id','category_id');
      }

      public function subCategory(){
       return $this->hasOne('App\Models\Category','parent_id','category_id');
      }

}
