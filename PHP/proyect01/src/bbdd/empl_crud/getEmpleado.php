<?php
    // Parámetros de conexión
    $host = getenv('MYSQL_HOST');  // IP o dominio del host
    $base_de_datos   = 'employees';    // Base de datos que utilizamos por defecto
    $usuario = getenv('MYSQL_USER');  // Usuario
    $contrasena = getenv('MYSQL_PASSWORD'); 

    try {
        // Crear conexión
        $conexion = new PDO("mysql:host=$host;dbname=$base_de_datos", $usuario, $contrasena);
        // Establecer el modo de error de PDO
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        // Validar si se ha proporcionado el ID del empleado
        if (!isset($_GET['id'])) {
            echo json_encode(['error' => 'ID de empleado no proporcionado']);
            exit;
        }
        // Validar que el ID del empleado es un número entero
        if (!filter_var($_GET['id'], FILTER_VALIDATE_INT)) {
            echo json_encode(['error' => 'ID de empleado inválido']);
            exit;
        }

        // Obtener el ID del empleado
        $emp_id = $_GET['id'];

        // Consulta para obtener el empleado
        $query = "SELECT emp_no, first_name, last_name, birth_date, hire_date, gender FROM employees WHERE emp_no = :emp_id";
        $stmt = $conexion->prepare($query);

        // Vincular el parámetro
        $stmt->bindParam(':emp_id', $emp_id, PDO::PARAM_INT);

        // Ejecutar la consulta
        $stmt->execute();

        // Verificar si se encontró un resultado
        if ($stmt->rowCount() > 0) {
            $empleado = $stmt->fetch(PDO::FETCH_ASSOC);
            echo json_encode($empleado); // Devolver los datos en formato JSON
        } else {
            echo json_encode(['error' => 'Empleado no encontrado']);
        }
    } catch (PDOException $e) {
        echo "Conexión fallida: " . $e->getMessage();
    }
?>