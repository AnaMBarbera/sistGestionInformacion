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

$id = $data->dept_id;

try {
    $host = getenv('MYSQL_HOST');
    $user = getenv('MYSQL_USER');
    $pass = getenv('MYSQL_PASSWORD');

    $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "DELETE FROM departments WHERE dept_no = :dept_id";
    $stmt = $conexion->prepare($sql);
    $stmt->bindParam(":dept_id", $id, PDO::PARAM_STR);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $data = [
            'success' => true,
            'message' => "Departamento eliminado: $id"
        ];
    } else {
        $data = [
            'success' => false,
            'message' => "Departamento no encontrado: $id"
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
