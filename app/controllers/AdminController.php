<?php
namespace Formacom\controllers;
use Formacom\Core\Controller;
use Formacom\Models\Customer;
use Formacom\Models\Address;

class AdminController extends Controller{
    public function index(...$params){
        $customer=Customer::find(1);
        var_dump($customer->addresses()->first()->street);
        exit();
        $data = ['mensaje' => '¡Bienvenido a la página de inicio!'];
        $this->view('home', $data);
    }
   
}
?>