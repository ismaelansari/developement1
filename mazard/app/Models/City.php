<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
	public function areas(){
		return $this->hasMany('App\Models\CityArea','city_id','id')->where('city_areas.deleted_at');
	}
}
