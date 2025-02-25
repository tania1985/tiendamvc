<?php
namespace Formacom\controllers;
use Formacom\Core\Controller;
use Formacom\Models\Customer;
use Formacom\Models\Address;

class CustomerController extends Controller{
    public function index(...$params){
         $customers=Customer::all();
        $this->view('home', $customers);//dentro de la vista el array se sigue llamando $data que fue definida en el controlador
    }
    public function show(...$params){
        if(isset($params[0])) {
        $customer=Customer::find($params[0]);
        if($customer){
            $this->view('detail', $customer);
            exit();
    }
    header("Location:".base_url()."customer");
    }
    }
}
?>