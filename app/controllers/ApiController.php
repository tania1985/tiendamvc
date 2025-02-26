<?php
namespace Formacom\controllers;
use Formacom\Core\Controller;
use Formacom\Models\Customer;
use Formacom\Models\Address;
use Formacom\Models\Category;

class ApiController extends Controller{
    public function index(...$params){
        
    }

    public function categories() {
        $categories=Category::all();
        $json=json_encode($categories);
        header('Content-Type: application/json');
        echo $json;
        exit();
    }
    public function providers() {
        $providers=Provider::all();
        $json=json_encode($providers);
        header('Content-Type: application/json');
        echo $json;
        exit();
    }
   
}

?>