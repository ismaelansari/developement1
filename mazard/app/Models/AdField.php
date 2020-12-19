<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdField extends Model
{
    public function field(){
    	return $this->hasOne('App\Models\Field','id','field_id');
    }
}
