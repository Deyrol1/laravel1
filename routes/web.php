<?php

use Illuminate\Support\Facades\Route;

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


/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('admin-users')->name('admin-users/')->group(static function() {
            Route::get('/',                                             'AdminUsersController@index')->name('index');
            Route::get('/create',                                       'AdminUsersController@create')->name('create');
            Route::post('/',                                            'AdminUsersController@store')->name('store');
            Route::get('/{adminUser}/impersonal-login',                 'AdminUsersController@impersonalLogin')->name('impersonal-login');
            Route::get('/{adminUser}/edit',                             'AdminUsersController@edit')->name('edit');
            Route::post('/{adminUser}',                                 'AdminUsersController@update')->name('update');
            Route::delete('/{adminUser}',                               'AdminUsersController@destroy')->name('destroy');
            Route::get('/{adminUser}/resend-activation',                'AdminUsersController@resendActivationEmail')->name('resendActivationEmail');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::get('/profile',                                      'ProfileController@editProfile')->name('edit-profile');
        Route::post('/profile',                                     'ProfileController@updateProfile')->name('update-profile');
        Route::get('/password',                                     'ProfileController@editPassword')->name('edit-password');
        Route::post('/password',                                    'ProfileController@updatePassword')->name('update-password');
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('habitacions')->name('habitacions/')->group(static function() {
            Route::get('/',                                             'HabitacionController@index')->name('index');
            Route::get('/create',                                       'HabitacionController@create')->name('create');
            Route::post('/',                                            'HabitacionController@store')->name('store');
            Route::get('/{habitacion}/edit',                            'HabitacionController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'HabitacionController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{habitacion}',                                'HabitacionController@update')->name('update');
            Route::delete('/{habitacion}',                              'HabitacionController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('estadohabitacions')->name('estadohabitacions/')->group(static function() {
            Route::get('/',                                             'EstadohabitacionController@index')->name('index');
            Route::get('/create',                                       'EstadohabitacionController@create')->name('create');
            Route::post('/',                                            'EstadohabitacionController@store')->name('store');
            Route::get('/{estadohabitacion}/edit',                      'EstadohabitacionController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'EstadohabitacionController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{estadohabitacion}',                          'EstadohabitacionController@update')->name('update');
            Route::delete('/{estadohabitacion}',                        'EstadohabitacionController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('categoriahabitacions')->name('categoriahabitacions/')->group(static function() {
            Route::get('/',                                             'CategoriahabitacionController@index')->name('index');
            Route::get('/create',                                       'CategoriahabitacionController@create')->name('create');
            Route::post('/',                                            'CategoriahabitacionController@store')->name('store');
            Route::get('/{categoriahabitacion}/edit',                   'CategoriahabitacionController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'CategoriahabitacionController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{categoriahabitacion}',                       'CategoriahabitacionController@update')->name('update');
            Route::delete('/{categoriahabitacion}',                     'CategoriahabitacionController@destroy')->name('destroy');
        });
    });
});

/* Auto-generated admin routes */
Route::middleware(['auth:' . config('admin-auth.defaults.guard'), 'admin'])->group(static function () {
    Route::prefix('admin')->namespace('App\Http\Controllers\Admin')->name('admin/')->group(static function() {
        Route::prefix('reservas')->name('reservas/')->group(static function() {
            Route::get('/',                                             'ReservasController@index')->name('index');
            Route::get('/create',                                       'ReservasController@create')->name('create');
            Route::post('/',                                            'ReservasController@store')->name('store');
            Route::get('/{reserva}/edit',                               'ReservasController@edit')->name('edit');
            Route::post('/bulk-destroy',                                'ReservasController@bulkDestroy')->name('bulk-destroy');
            Route::post('/{reserva}',                                   'ReservasController@update')->name('update');
            Route::delete('/{reserva}',                                 'ReservasController@destroy')->name('destroy');
        });
    });
});