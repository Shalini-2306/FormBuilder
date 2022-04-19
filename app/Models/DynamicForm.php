<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class DynamicForm extends Model
{
    use HasFactory;
    protected $casts = [
        'form_definition' => 'array'
    ];
    protected $fillable = [
        'user_id',
        'form_definition'
    ];
    public function user(){
        return $this->hasOne(User::class, 'id', 'user_id');
    }
}
