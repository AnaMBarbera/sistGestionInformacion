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
            $emp_id = $data->emp_id;
            $nombre = $data->nombre;
            $apellido = $data->apellido;
            $fecha_nacimiento = $data->fecha_nacimiento;
            $fecha_contratacion = $data->fecha_contratacion;
            $genero = $data->genero;

            // Validación de fechas
            $fecha_nacimiento_obj = new DateTime($fecha_nacimiento);
            $fecha_contratacion_obj = new DateTime($fecha_contratacion);
            $fecha_actual = new DateTime();

            // Validar que la fecha de nacimiento sea al menos 18 años antes de la fecha de contratación
            $fecha_minima_nacimiento = $fecha_contratacion_obj->sub(new DateInterval('P18Y'));
            if ($fecha_nacimiento_obj > $fecha_minima_nacimiento) {
                echo json_encode(['success' => false, 'error' => "La fecha de nacimiento debe ser al menos 18 años antes de la fecha de contratación."]);
                exit;
            }

            // Validar que la fecha de contratación no sea mayor que la fecha actual
            if ($fecha_contratacion_obj > $fecha_actual) {
                echo json_encode(['success' => false, 'error' => "La fecha de contratación no puede ser posterior a la fecha actual."]);
                exit;
            }

            // Consulta para actualizar los datos
            $query = "UPDATE employees 
                    SET first_name = :nombre, 
                        last_name = :apellido, 
                        birth_date = :fecha_nacimiento, 
                        hire_date = :fecha_contratacion, 
                        gender = :genero 
                    WHERE emp_no = :emp_id";

            // Ejecutar la consulta
            $stmt = $conexion->prepare($query);
            $stmt->bindParam(':nombre', $nombre, PDO::PARAM_STR);
            $stmt->bindParam(':apellido', $apellido, PDO::PARAM_STR);
            $stmt->bindParam(':fecha_nacimiento', $fecha_nacimiento, PDO::PARAM_STR);
            $stmt->bindParam(':fecha_contratacion', $fecha_contratacion, PDO::PARAM_STR);
            $stmt->bindParam(':genero', $genero, PDO::PARAM_STR);
            $stmt->bindParam(':emp_id', $emp_id, PDO::PARAM_INT);
            $stmt->execute();

            // Devolver éxito y los datos actualizados
            $empleado = [
                'emp_no' => $emp_id,
                'first_name' => $nombre,
                'last_name' => $apellido,
                'birth_date' => $fecha_nacimiento,
                'hire_date' => $fecha_contratacion,
                'gender' => $genero
            ];

            echo json_encode(['success' => true, 'empleado' => $empleado]);

        }
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'error' => $e->getMessage()]);
    }

    $conexion = null;
?>