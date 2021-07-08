<?php

use Illuminate\Support\Facades\Route;
use App\Jobs\WelcomeEmailJob;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::post('checkemail', 'user\UserController@CheckmailIsRegistered');
Route::middleware(['auth'])->group(function () {
    Route::resource('post','PostController');
    Route::post('post/{slug}', 'PostController@GetPost');
    Route::get('all-post', 'PostController@listAllPOsts');
    Route::post('setlike', 'PostController@setlike');
    Route::post('post-comment', 'PostController@PostComment')->name('post-comment');
});