<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
     use SoftDeletes;

     public function ads(){
       return $this->hasMany('App\Models\Ad','category_id','id');
     }

     public function subCategories(){
       return $this->hasMany('App\Models\Category','parent_id','id');
     }

     public function fields(){
       return $this->hasMany('App\Models\Field','category_id','id');
     }

     public function getImageAttribute($image){
       if($image)
       	    return asset('images/category/'.$image);
       else
            return false;
     }

     public function getTitleAttribute($title){
          if(app()->getLocale() == 'bn')
             return $this->title_bn;
          return $title;
     }
}
