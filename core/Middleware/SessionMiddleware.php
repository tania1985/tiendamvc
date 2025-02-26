<?php

namespace Formacom\Core\Middleware;

class SessionMiddleware {
    protected $exemptControllers;

    public function __construct(array $exemptControllers = []) {
        $this->exemptControllers = $exemptControllers;
    }

    public function handle($request, $next) {
        // Lógica para manejar la sesión
        // Si el controlador actual está en la lista de exentos, no hacemos nada
        if (isset($request->controller)) {
            $controller = get_class($request->controller);
            if (in_array($controller, $this->exemptControllers)) {
                return $next($request);
            }
        }

        // Aquí puedes agregar la lógica para verificar la sesión
        // Por ejemplo, redirigir al login si no hay sesión activa

        return $next($request);
    }
}
?>
