<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;
    protected $fillable = ['name','code','subcategory_id','user_id','description','price','discount','photo'];
    public function subcategory(){
        return $this->belongsTo(Subcategory::class);
    }
    public function user(){
        return $this->belongsTo(User::class);
    }
}
