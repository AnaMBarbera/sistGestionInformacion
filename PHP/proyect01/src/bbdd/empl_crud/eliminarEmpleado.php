<?php
header('Content-Type: application/json');

// Recibir los datos JSON enviados por AJAX
$data = json_decode(file_get_contents("php://input"));

if (!$data) {
    echo json_encode([
        'success' => false,
        'message' => "Parámetro ID no establecido",
    ]);
    exit;
}

$id = $data->emp_id;

if (!filter_var($id, FILTER_VALIDATE_INT)) {
    echo json_encode([
        'success' => false,
        'message' => "Parámetro ID no válido: $id",
    ]);
    exit;
}

try {
    $host = getenv('MYSQL_HOST');
    $user = getenv('MYSQL_USER');
    $pass = getenv('MYSQL_PASSWORD');

    $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "DELETE FROM employees WHERE emp_no = :emp_id";
    $stmt = $conexion->prepare($sql);
    $stmt->bindParam(":emp_id", $id, PDO::PARAM_INT);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $data = [
            'success' => true,
            'message' => "Empleado eliminado: $id"
        ];
    } else {
        $data = [
            'success' => false,
            'message' => "Empleado no encontrado: $id"
        ];
    }

} catch (PDOException $e) {
    $data = [
        'success' => false,
        'message' => $e->getMessage()
    ];
} finally {
    $conexion = null;
}

echo json_encode($data);
?>
