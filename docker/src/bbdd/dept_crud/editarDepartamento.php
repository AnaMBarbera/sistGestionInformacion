<?php
    try {
        // Conexión a la base de datos con PDO
        $host = getenv('MYSQL_HOST');
        $user = getenv('MYSQL_USER');
        $pass = getenv('MYSQL_PASSWORD');

        $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Recibir los datos JSON enviados por AJAX
        $data = json_decode(file_get_contents("php://input"));

        if ($data) {
            // Recibir los datos del formulario
            $dept_id = $data->dept_id;
            $nombre = $data->nombre;

            // Consulta para actualizar los datos
            $query = "UPDATE departments 
                    SET dept_name = :nombre                        
                    WHERE dept_no = :dept_id";

            // Ejecutar la consulta
            $stmt = $conexion->prepare($query);
            $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);            
            $stmt->bindParam(':dept_id', $dept_id, PDO::PARAM_STR);
            $stmt->execute();

            // Devolver éxito y los datos actualizados
            $departamento = [
                'dept_no' => $dept_id,
                'dept_name' => $nombre
            ];

            echo json_encode(['success' => true, 'departamento' => $departamento]);

        }
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    }

    $conexion = null;
?>