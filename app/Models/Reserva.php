<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reserva extends Model
{
    protected $fillable = [
        'fecha_inicio',
        'fecha_fin',
        'nombre_cliente',
        'tipo_habitacion',
        'num_habitacion',
        'dias',
        'valor_total',
    
    ];
    
    
    protected $dates = [
        'fecha_inicio',
        'fecha_fin',
        'created_at',
        'updated_at',
    
    ];
    
    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/reservas/'.$this->getKey());
    }
}
