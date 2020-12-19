<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/************************* Admin Route's *************************************/

// Authentication Routes...
Route::get('admin', 'Backend\Auth\LoginController@showLoginForm')->name('admin.login');
Route::get('admin/login', 'Backend\Auth\LoginController@showLoginForm')->name('admin.login');
Route::post('admin/login', 'Backend\Auth\LoginController@login')->name('admin.login');
Route::post('admin/logout', 'Backend\Auth\LoginController@logout')->name('admin.logout');

// Password Reset Routes...
Route::get('admin/password/request', 'Backend\Auth\ForgotPasswordController@showLinkRequestForm')->name('admin.password.request');
Route::post('admin/password/email', 'Backend\Auth\ForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
Route::get('admin/password/reset/{token}', 'Backend\Auth\ResetPasswordController@showResetForm');
Route::post('admin/password/reset', 'Backend\Auth\ResetPasswordController@reset')->name('admin.password.reset');

Route::get('/', 'Backend\HomeController@home')->name('admin');
Route::get('admin', 'Backend\HomeController@home')->name('admin');
Route::get('admin/home', 'Backend\HomeController@home')->name('admin.home');
Route::get('admin/profile', 'Backend\HomeController@profile')->name('admin.profile');
Route::put('admin/profile/update', 'Backend\HomeController@updateProfile')->name('admin.profile.update');
Route::put('admin/change/password', 'Backend\HomeController@changePassword')->name('admin.change.password');
Route::get('admin/users', 'Backend\HomeController@users')->name('admin.users');
Route::get('admin/user/details/{id}', 'Backend\HomeController@userDetails')->name('admin.user.details');
Route::put('admin/user/change/status/{id}', 'Backend\HomeController@userChangeStatus')->name('admin.user.change.status');

Route::get('admin/products', 'Backend\HomeController@products')->name('admin.products');
Route::get('admin/product/details/{id}', 'Backend\HomeController@productDetails')->name('admin.product.details');

Route::get('admin/categories','Backend\HomeController@categories')->name('admin.categories');
Route::get('admin/category/details/{id}','Backend\HomeController@categoryDetail')->name('admin.category.details');
Route::put('admin/category/update/{id}','Backend\HomeController@categoryUpdate')->name('admin.category.update');
Route::get('admin/category/add','Backend\HomeController@addCategory')->name('admin.add.category');
Route::post('admin/category/store','Backend\HomeController@storeCategory')->name('admin.store.category');
Route::delete('admin/category/remove','Backend\HomeController@removeCategory')->name('admin.category.remove');

Route::post('admin/subcategory/add','Backend\HomeController@addSubcategory')->name('admin.subcategory.add');
Route::put('admin/subcategory/update','Backend\HomeController@updateSubcategory')->name('admin.subcategory.update');
Route::delete('admin/subcategory/remove/{id}','Backend\HomeController@removeSubcategory')->name('admin.subcategory.remove');
Route::get('admin/ajax/subcategory/list/{id}','Backend\HomeController@addSubcategoryAjax')->name('admin.subcategory.list');

/**
* City area's
*/
Route::post('admin/area/add','Backend\HomeController@addArea')->name('admin.area.add');
Route::put('admin/area/update','Backend\HomeController@updateArea')->name('admin.area.update');
Route::delete('admin/area/remove/{id}','Backend\HomeController@removeArea')->name('admin.area.remove');
Route::get('admin/ajax/area/list/{id}','Backend\HomeController@ajaxAreaAjax')->name('admin.area.list');

Route::get('admin/config','Backend\HomeController@config')->name('admin.config');
Route::get('admin/get/config/{id}','Backend\HomeController@getConfig')->name('admin.get.config');
Route::put('admin/update/config/{id}','Backend\HomeController@updateConfig')->name('admin.update.config');

Route::get('admin/cities','Backend\HomeController@cities')->name('admin.cities');
Route::get('admin/city/add','Backend\HomeController@addCity')->name('admin.city.add');
Route::post('admin/city/store','Backend\HomeController@storeCity')->name('admin.city.store');
Route::get('admin/city/edit/{id}','Backend\HomeController@editCity')->name('admin.city.edit');
Route::put('admin/city/update/{id}','Backend\HomeController@updateCity')->name('admin.city.update');
Route::delete('admin/city/remove','Backend\HomeController@removeCity')->name('admin.city.remove');
;

Route::post('admin/city/localarea/add','Backend\HomeController@adCityLocalarea')->name('admin.city.localarea.add');
Route::put('admin/city/localarea/update/{id}','Backend\HomeController@updateCityLocalarea')->name('admin.city.localarea.update');
Route::delete('admin/city/localarea/remove/{id}','Backend\HomeController@removeCityLocalarea')->name('admin.city.localarea.remove');

Route::post('admin/create/field','Backend\HomeController@createField')->name('admin.create.field');
Route::put('admin/update/field','Backend\HomeController@updateField')->name('admin.update.field');
Route::delete('admin/delete/field/{id?}','Backend\HomeController@deleteField')->name('admin.delete.field');

/**
* Backend ajax Route's
**/
Route::get('admin/get/field/{id?}', 'AjaxController@field')->name('admin.ajax.field');

/************************* End Admin Route's **********************************/

Auth::routes();

/**
* Frontend ajax Route's
**/
Route::get('ajax/sub/category/{id}', 'AjaxController@subCategory')->name('ajax.sub.category');
Route::get('ajax/city/area/{id}', 'AjaxController@cityArea')->name('ajax.city.area');
Route::get('ajax/fields/{id}', 'AjaxController@fields')->name('ajax.fields');

Route::get('/api/get/form','Api\AuthController@form');
Route::post('/api/submit/form','Api\AuthController@submitForm');
Route::get('/api/ad/create/response','Api\AuthController@adCreateResponse');
Route::get('/api/submit/form','Api\AuthController@submitForm');
Route::get('/api/submit/form/success','Api\AuthController@submitForm');
Route::get('/api/get/ad','Api\AuthController@getAd');




