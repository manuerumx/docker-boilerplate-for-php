<?php

namespace Learning\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class CacheableController extends Controller {

    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(Request $request): View {
        $value = Cache::remember('users', 2000, static function () {
            return DB::table('users')->get();
        });

        return view('welcome');
    }
}
