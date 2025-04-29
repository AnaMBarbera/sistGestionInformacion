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
        
        // Validar si se ha proporcionado el ID del departamento
        if (!isset($_GET['id'])) {
            echo json_encode(['error' => 'ID de departamento no proporcionado']);
            exit;
        }
        
        //validar que el ID del departamento es un char(4)
        if (!filter_var($_GET['id'], FILTER_VALIDATE_REGEXP, ['options' => ['regexp' => '/^[a-z][0-9]{3}$/']])) {
        echo json_encode(['error' => 'ID de departamento no válido']);
        exit;
        }



        // Obtener el ID del departamento
        $dept_id = $_GET['id'];

        // Consulta para obtener el departamento
        $query = "SELECT dept_no, dept_name FROM departments WHERE dept_no = :dept_id";
        $stmt = $conexion->prepare($query);

        // Vincular el parámetro
        $stmt->bindParam(':dept_id', $dept_id, PDO::PARAM_STR);

        // Ejecutar la consulta
        $stmt->execute();

        // Verificar si se encontró un resultado
        if ($stmt->rowCount() > 0) {
            $departamento = $stmt->fetch(PDO::FETCH_ASSOC);
            echo json_encode($departamento); // Devolver los datos en formato JSON
        } else {
            echo json_encode(['error' => 'Departamento no encontrado']);
        }
    } catch (PDOException $e) {
        echo "Conexión fallida: " . $e->getMessage();
    }
?>