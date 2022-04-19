<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\BuilderController;
use App\Http\Controllers\FormController;
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
Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::get('/create-dynamic-form',  [App\Http\Controllers\BuilderController::class, 'create'])->name('create-dynamic-form');
    Route::get('/view-form',  [App\Http\Controllers\FormController::class, 'create'])->name('view-form');
    Route::post('/create-dynamic-save',  [App\Http\Controllers\BuilderController::class, 'store'])->name('form-builder.store');
    Route::post('/form-submission',  [App\Http\Controllers\FormController::class, 'store'])->name('form.store');
    Route::get('/form-record',  [App\Http\Controllers\FormController::class, 'show'])->name('form.show');
});
Route::prefix('dynamic-forms')->name('dynamic-forms.')->group(function () {
    // Dummy route so we can use the route() helper to give formiojs the base path for this group
    Route::get('/')->name('index');

    Route::post('storage/s3', [Controllers\DynamicFormsStorageController::class, 'storeS3'])
        ->withoutMiddleware([\App\Http\Middleware\VerifyCsrfToken::class]);

    Route::get('storage/s3', [Controllers\DynamicFormsStorageController::class, 'showS3'])->name('S3-file-download');
    Route::get('storage/s3/{fileKey}', [Controllers\DynamicFormsStorageController::class, 'showS3'])->name('S3-file-redirect');

    Route::post('storage/url', [Controllers\DynamicFormsStorageController::class, 'storeURL'])
        ->withoutMiddleware([\App\Http\Middleware\VerifyCsrfToken::class]);

    Route::get('storage/url', [Controllers\DynamicFormsStorageController::class, 'showURL'])->name('url-file-download');
    Route::delete('storage/url', [Controllers\DynamicFormsStorageController::class, 'deleteURL']);
});
