<?php
namespace Formacom\Models;
use Illuminate\Database\Eloquent\Model;
class Provider extends Model{
    protected $table="provider";
    protected $primaryKey = 'provider_id';
    // Definir los campos que se pueden llenar masivamente
    protected $fillable = ['name', 'address', 'phone', 'email'];
    public function addresses(){
        return $this->hasMany(Address::class,"provider_id");
    }
    public function phones(){
        return $this->hasMany(Phone::class,"provider_id");
    }
}

?>