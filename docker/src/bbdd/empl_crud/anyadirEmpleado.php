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
            $apellido = $data->apellido;
            $fecha_nacimiento = $data->fecha_nacimiento;
            $fecha_contratacion = $data->fecha_contratacion;
            $genero = $data->genero;

            // Convertir las fechas a formato string (Y-m-d)
            $fecha_nac_str = date('Y-m-d', strtotime($fecha_nacimiento)); // Convertir la fecha de nacimiento
            $fecha_cont_str = date('Y-m-d', strtotime($fecha_contratacion)); // Convertir la fecha de contratación

            // **Calcular el siguiente ID del empleado** (MAX(emp_no) + 1)
            $sql = "SELECT MAX(emp_no) FROM employees";
            $stmt = $conexion->prepare($sql);
            $stmt->execute();
            $count= $stmt->fetchColumn();
            $id = $count ? $count + 1 : 1;

            // Insertar el nuevo empleado en la base de datos
            $sql = "INSERT INTO employees (emp_no, first_name, last_name, birth_date, hire_date, gender)
            VALUES (:emp_id, :nombre, :apellido, :fecha_nac, :fecha_cont, :genero)";
            $stmt = $conexion->prepare($sql);
            $stmt->bindParam(':emp_id', $id, PDO::PARAM_INT);  // Usar el ID calculado
            $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
            $stmt->bindParam(':apellido', $apellido, PDO::PARAM_STR);
            $stmt->bindParam(':fecha_nac', $fecha_nac_str, PDO::PARAM_STR);
            $stmt->bindParam(':fecha_cont', $fecha_cont_str, PDO::PARAM_STR);  // Usamos la fecha de contratación
            $stmt->bindParam(':genero', $genero, PDO::PARAM_STR);
            $stmt->execute();

            // Devolver el nuevo empleado con su ID generado
            $empleado = [
            'emp_no' => $id,  // Pasamos el ID calculado
            'first_name' => $nombre,
            'last_name' => $apellido,
            'birth_date' => $fecha_nac_str,
            'hire_date' => $fecha_cont_str,
            'gender' => $genero
            ];

            echo json_encode(['success' => true, 'empleado' => $empleado]);
        }

    }catch (PDOException $e) {
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    } finally {
        $conexion = null; 
    }    
?>