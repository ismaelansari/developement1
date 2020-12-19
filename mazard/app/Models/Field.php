<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Field extends Model
{

	 public function getTitleAttribute($title){
	 	return ucfirst($title);
	 }
     public function getInputNameAttribute(){
        return str_replace(' ', '_',strtolower($this->title));
     }
}
