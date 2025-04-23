<?php
// Parámetros de conexión
$host = "mysql";
$usuario = "alumno";  // Cambia esto si usas otro usuario
$contrasena = "alumno";   // Cambia esto si usas otra contraseña
$base_de_datos = "pruebas";  // Asegúrate de tener esta base de datos creada

// Crear conexión
$conexion = new mysqli($host, $usuario, $contrasena, $base_de_datos);

// Comprobar la conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
} else {
    echo "Conexión exitosa a la base de datos MySQLI!";
}

// Cerrar conexión
$conexion->close();
?>