<?php

/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(Brackets\AdminAuth\Models\AdminUser::class, function (Faker\Generator $faker) {
    return [
        'first_name' => $faker->firstName,
        'last_name' => $faker->lastName,
        'email' => $faker->email,
        'password' => bcrypt($faker->password),
        'remember_token' => null,
        'activated' => true,
        'forbidden' => $faker->boolean(),
        'language' => 'en',
        'deleted_at' => null,
        'created_at' => $faker->dateTime,
        'updated_at' => $faker->dateTime,
        'last_login_at' => $faker->dateTime,
        
    ];
});/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Models\Habitacion::class, static function (Faker\Generator $faker) {
    return [
        'numero' => $faker->sentence,
        'tipo' => $faker->sentence,
        'costo' => $faker->randomNumber(5),
        'estado' => $faker->sentence,
        'created_at' => $faker->dateTime,
        'updated_at' => $faker->dateTime,
        
        
    ];
});
/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Models\Estadohabitacion::class, static function (Faker\Generator $faker) {
    return [
        'estado' => $faker->sentence,
        'created_at' => $faker->dateTime,
        'updated_at' => $faker->dateTime,
        
        
    ];
});
/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Models\Categoriahabitacion::class, static function (Faker\Generator $faker) {
    return [
        'categoria' => $faker->sentence,
        'valor' => $faker->randomNumber(5),
        'created_at' => $faker->dateTime,
        'updated_at' => $faker->dateTime,
        
        
    ];
});
/** @var  \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Models\Reserva::class, static function (Faker\Generator $faker) {
    return [
        'fecha_inicio' => $faker->date(),
        'fecha_fin' => $faker->date(),
        'nombre_cliente' => $faker->sentence,
        'tipo_habitacion' => $faker->sentence,
        'num_habitacion' => $faker->randomNumber(5),
        'dias' => $faker->randomNumber(5),
        'valor_total' => $faker->randomNumber(5),
        'created_at' => $faker->dateTime,
        'updated_at' => $faker->dateTime,
        
        
    ];
});
