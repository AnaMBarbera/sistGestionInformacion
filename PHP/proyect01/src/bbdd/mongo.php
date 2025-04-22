<?php
// Parámetros de conexión
$host = getenv('MONGODB_HOST');  // docker_mongo
$puerto = getenv('MONGODB_PORT'); // 27017

try {
    // Crear conexión
    $conexion = new MongoDB\Driver\Manager("mongodb://$host:$puerto");
    echo "Conexión exitosa a MongoDB!";
} catch (MongoDB\Driver\Exception\Exception $e) {
    echo "Conexión fallida: " . $e->getMessage();
}
?>