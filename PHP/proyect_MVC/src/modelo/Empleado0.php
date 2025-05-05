<?php
include __DIR__."/../utils/verificarAcceso.php";
//para no perder la ruta se escribe __DIR__
include __DIR__."/../utils/db.php";

    class Empleado{
        private $conexion;
        public function __construct(){
            $this -> conexion = dbConnection::obtenerConexion();
        }
        //utilizamos 2 parámetros para la paginación
        public function obtenerEmpleados($pagina = 1, $elementos = 15): array {
            $offset=($pagina-1)*$elementos;

            $query = "SELECT * FROM employees ORDER BY emp_no DESC LIMIT :limit OFFSET :offset";
            $stmt = $this ->conexion->prepare($query);
            $stmt -> bindParam("offset", $offset, PDO::PARAM_INT);
            $stmt -> bindParam("limit", $elementos, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt ->fetchAll(PDO::FETCH_ASSOC);
        }

        //calcular el id
        public function getNewId(){
            $query = "SELECT max(emp_no) as max FROM employees";
            $stmt = $this->conexion->prepare($query);
            $stmt -> execute();
            $max = $stmt -> fetch(PDO::FETCH_ASSOC)['max'];
            return $max ? $max + 1 : 1;
        }

         // Crear un nuevo empleado
        public function crearEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero) {
            $query = "INSERT INTO employees (emp_no, first_name, last_name, birth_date, hire_date, gender) 
                VALUES (:id, :nombre, :apellido, :fecha_nacimiento, :fecha_contratacion, :genero)";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue(':id', $this->getnewId(), PDO::PARAM_INT);
            $stmt->bindValue(':nombre', $nombre, PDO::PARAM_STR);
            $stmt->bindValue(':apellido', $apellido, PDO::PARAM_STR);
            $stmt->bindValue(':fecha_nacimiento', $fecha_nacimiento, PDO::PARAM_STR);
            $stmt->bindValue(':fecha_contratacion', $fecha_contratacion, PDO::PARAM_STR);
            $stmt->bindValue(':genero', $genero, PDO::PARAM_STR);
            return $stmt->execute();
        }

        public function obtenerEmpleado($id){
            $query = "SELECT * FROM employees WHERE emp_no = :id";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue('id', $id, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }

        // Actualizar un empleado
        public function actualizarEmpleado($emp_id, $nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero) {
            $query = "UPDATE employees 
                    SET first_name = :nombre, last_name = :apellido, birth_date = :fecha_nacimiento, 
                        hire_date = :fecha_contratacion, gender = :genero
                    WHERE emp_no = :emp_no";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue(':emp_no', $emp_id, PDO::PARAM_INT);
            $stmt->bindValue(':nombre', $nombre, PDO::PARAM_STR);
            $stmt->bindValue(':apellido', $apellido, PDO::PARAM_STR);
            $stmt->bindValue(':fecha_nacimiento', $fecha_nacimiento, PDO::PARAM_STR);
            $stmt->bindValue(':fecha_contratacion', $fecha_contratacion, PDO::PARAM_STR);
            $stmt->bindValue(':genero', $genero, PDO::PARAM_STR);
            return $stmt->execute();
        }

        // Eliminar un empleado
        public function eliminarEmpleado($emp_id) {
            $query = "DELETE FROM employees WHERE emp_no = :emp_id";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue(':emp_id', $emp_id, PDO::PARAM_INT);
            return $stmt->execute();
        }
    }
?>