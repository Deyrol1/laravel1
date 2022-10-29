<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Estadohabitacion extends Model
{
    protected $table = 'estadohabitacion';

    protected $fillable = [
        'estado',
    
    ];
    
    
    protected $dates = [
        'created_at',
        'updated_at',
    
    ];
    
    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/estadohabitacions/'.$this->getKey());
    }
}
