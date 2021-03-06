<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next,$guard = null)
    {
        if (!Auth::guard($guard)->check()) {
            return redirect('/admin/login');
        }

        if(Auth::user()->role_id == '2'){
            return redirect('/');
        }

        return $next($request);
    }
}
