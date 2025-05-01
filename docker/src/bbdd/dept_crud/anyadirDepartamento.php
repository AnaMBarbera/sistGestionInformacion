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

        if (!$data) {
            echo json_encode([
                'success' => false,
                'message' => "Faltan parámetros",
            ]);
            die();
        } else {
            // Recibir los datos del formulario
            //$emp_id = $data->emp_id;
            $nombre = $data->nombre;

            // **Calcular el siguiente ID del departamento** hay que extraer la parte numérica, convertirla a entero, obtener el valor máximo y luego volver a formatear el ID.

            $sql= "SELECT MAX(CAST(SUBSTRING(dept_no, 2) AS UNSIGNED)) AS max_dept_num FROM departments";

            $stmt = $conexion->prepare($sql);
            $stmt->execute();
            $count= $stmt->fetchColumn();
            //aquí sumamos 1 a la parte númerica
            $nextNum = $count ? $count + 1 : 1;
            //aquí añadimos la parte númerica al carácter "d"
            $id = 'd' . str_pad($nextNum, 3, '0', STR_PAD_LEFT);

            // Insertar el nuevo departamento en la base de datos
            $sql = "INSERT INTO departments (dept_no, dept_name)
            VALUES (:dept_id, :nombre)";
            $stmt = $conexion->prepare($sql);
            $stmt->bindParam(':dept_id', $id, PDO::PARAM_STR);  // Usar el ID calculado
            $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);            
            $stmt->execute();

            // Devolver el nuevo Departamento con su ID generado
            $departamento = [
            'dept_no' => $id,  // Pasamos el ID calculado
            'dept_name' => $nombre         
            ];

            echo json_encode(['success' => true, 'departamento' => $departamento]);
        }

    }catch (PDOException $e) {
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    } finally {
        $conexion = null; 
    }    
?>