<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Categoriahabitacion extends Model
{
    protected $table = 'categoriahabitacion';

    protected $fillable = [
        'categoria',
        'valor',
    
    ];
    
    
    protected $dates = [
        'created_at',
        'updated_at',
    
    ];
    
    protected $appends = ['resource_url'];

    /* ************************ ACCESSOR ************************* */

    public function getResourceUrlAttribute()
    {
        return url('/admin/categoriahabitacions/'.$this->getKey());
    }
}
