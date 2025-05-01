<?php

// script que recibe un id de empleado por POST 'emp_id'.
// Si lo borra devuelve un success = true y sino false en un json

// leer JSON con el id de empleado:

$data = json_decode(file_get_contents("php://input"));

if (!$data) {
    echo json_encode([
        'success' => false,
        'message' => "Parámetro ID no establecido",
    ]);
    die();
}

$id = $data->emp_id;

if (!filter_var($id, FILTER_VALIDATE_INT)) {
    echo json_encode([
        'success' => false,
        'message' => "Parámetro ID no válido: $id",
    ]);
    die();
}

try {
    $conexion = new PDO("mysql:host=host.docker.internal;dbname=employees", 
    "alumno", "alumno");    
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "DELETE FROM employees WHERE emp_no = :emp_id";
    
    $stmt = $conexion->prepare($sql);
    $stmt->bindParam("emp_id", $id, PDO::PARAM_INT);
    $stmt->execute();

    if ($stmt->rowCount()>0) {
        $data = json_encode([
            'success' => true,
            'message' => 'Empleado eliminado:' .  $id,
        ]);
    } else {
        $data = json_encode([
            'success' => false,
            'message' => "Empleado no encontrado: $id",
        ]);
    }

} catch (PDOException $e) {
    $data = json_encode([
        'success' => false,
        'message' => "Error sistema: " . $e->getMessage(),
    ]);
} finally {
    $conexion = null;
}

echo $data;

