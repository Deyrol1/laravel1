<?php

return [
    'admin-user' => [
        'title' => 'Users',

        'actions' => [
            'index' => 'Users',
            'create' => 'New User',
            'edit' => 'Edit :name',
            'edit_profile' => 'Edit Profile',
            'edit_password' => 'Edit Password',
        ],

        'columns' => [
            'id' => 'ID',
            'last_login_at' => 'Last login',
            'first_name' => 'First name',
            'last_name' => 'Last name',
            'email' => 'Email',
            'password' => 'Password',
            'password_repeat' => 'Password Confirmation',
            'activated' => 'Activated',
            'forbidden' => 'Forbidden',
            'language' => 'Language',
                
            //Belongs to many relations
            'roles' => 'Roles',
                
        ],
    ],

    'habitacion' => [
        'title' => 'Habitacion',

        'actions' => [
            'index' => 'Habitacion',
            'create' => 'New Habitacion',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'numero' => 'Numero',
            'tipo' => 'Tipo',
            'costo' => 'Costo',
            'estado' => 'Estado',
            
        ],
    ],

    'estadohabitacion' => [
        'title' => 'Estadohabitacion',

        'actions' => [
            'index' => 'Estadohabitacion',
            'create' => 'New Estadohabitacion',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'estado' => 'Estado',
            
        ],
    ],

    'categoriahabitacion' => [
        'title' => 'Categoriahabitacion',

        'actions' => [
            'index' => 'Categoriahabitacion',
            'create' => 'New Categoriahabitacion',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'categoria' => 'Categoria',
            'valor' => 'Valor',
            
        ],
    ],

    'reserva' => [
        'title' => 'Reservas',

        'actions' => [
            'index' => 'Reservas',
            'create' => 'New Reserva',
            'edit' => 'Edit :name',
        ],

        'columns' => [
            'id' => 'ID',
            'fecha_inicio' => 'Fecha inicio',
            'fecha_fin' => 'Fecha fin',
            'nombre_cliente' => 'Nombre cliente',
            'tipo_habitacion' => 'Tipo habitacion',
            'num_habitacion' => 'Num habitacion',
            'dias' => 'Dias',
            'valor_total' => 'Valor total',
            
        ],
    ],

    // Do not delete me :) I'm used for auto-generation
];