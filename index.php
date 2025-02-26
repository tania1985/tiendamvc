<?php
require_once __DIR__ . "/config/database.php";
require_once __DIR__ . "/core/helpers.php";
use Formacom\Core\App;
use Formacom\Core\Middleware\SessionMiddleware;

$app = new App();

// Agregamos el middleware de sesión, especificando que controladores no requieren sesión.
// Por ejemplo, si tienes un LoginController y RegisterController, los exentas:
$app->addMiddleware(new SessionMiddleware([
    'Formacom\Controllers\LoginController'
]));

$app->run();
?>