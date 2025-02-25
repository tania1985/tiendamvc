<?php
namespace Formacom\controllers;
use Formacom\Core\Controller;
use Formacom\Models\User;

class LoginController extends Controller{
    public function index(...$params){
        $this->view("login");
    }

    public function login(...$params){
        if(isset($_POST["username"])){
            $user = User::where("username", $_POST["username"]);
            var_dump($user);
            exit();
        } else {
            header("Location:".base_url()."login"); 
        }
    }

    public function register(...$params){
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            // Recibir y validar los datos del formulario
            $username = $_POST['username'] ?? null;
            $password = $_POST['password'] ?? null;
            $password_repeat = $_POST['password_repeat'] ?? null;

            if ($username && $password && $password_repeat) {
                if ($password === $password_repeat) {
                    // Crear un nuevo usuario
                    $user = new User();
                    $user->username = $username;
                    $user->password = password_hash($password, PASSWORD_BCRYPT); // Encriptar la contraseña
                    $user->save();

                    // Redirigir al usuario a la página de login
                    header("Location:".base_url()."login");
                } else {
                    // Mostrar un mensaje de error si las contraseñas no coinciden
                    echo "Las contraseñas no coinciden.";
                }
            } else {
                // Mostrar un mensaje de error si faltan datos
                echo "Por favor, complete todos los campos.";
            }
        } else {
            // Mostrar la vista de registro
            $this->view("register");
        }
    }

    public function json(){
        $actores = User::where("first_name", "like", "P%")->get();
        $datos = [
            "mensaje" => "Listado actores empiezan P",
            "listado" => $actores
        ];
        $json = json_encode($datos);
        header('Content-Type: application/json');
        echo $json;
        exit();
    }
}
?>