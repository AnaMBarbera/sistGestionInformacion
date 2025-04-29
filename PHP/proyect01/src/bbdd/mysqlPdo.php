<?php

// Parámetros de conexión
$host = getenv('MYSQL_HOST');  // IP o dominio del host
$base_de_datos   = getenv('MYSQL_DB');    // Base de datos que utilizamos por defecto
$usuario = getenv('MYSQL_USER');  // Usuario
$contrasena = getenv('MYSQL_PASSWORD'); 

try {
    // Crear conexión
    $conexion = new PDO("mysql:host=$host;dbname=$base_de_datos", $usuario, $contrasena);
    // Establecer el modo de error de PDO
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexión exitosa a la base de datos MySQL usando PDO!";
} catch (PDOException $e) {
    echo "Conexión fallida: " . $e->getMessage();
}
?>