<?php
    class Autenticacion {

        // Función para validar las credenciales de usuario
        public function validarUsuario($username, $password) {
            // Leer el archivo JSON con los usuarios
            $ruta = __DIR__ . '/usuarios.json';
            if (!file_exists($ruta)) {
                die("Error: No se encontró el archivo de usuarios.");
            }
            $usuarios = json_decode(file_get_contents($ruta), true);

            // Buscar el usuario en el archivo JSON
            foreach ($usuarios['usuarios'] as $usuario) {
                if ($usuario['username'] === $username && $usuario['password'] === $password) {
                    return true;  // Usuario encontrado y contraseña correcta
                }
            }
            return false;  // Credenciales incorrectas
        }
    }
?>