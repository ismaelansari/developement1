<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AdImage extends Model
{
      use SoftDeletes;

      public function ad(){
       return $this->hasOne('App\Models\Ad','id','ad_id');
      }

}
