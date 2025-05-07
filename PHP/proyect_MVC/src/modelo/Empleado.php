<?php

include __DIR__."/../utils/db.php";

class Empleado {
    private $conexion;

    public function __construct() {
        $this->conexion = dbConnection::obtenerConexion();
    }

    public function obtenerTotalEmpleados($busqueda):int{
        $where = "";
        if ($busqueda !== "")
        $where = " AND (emp_no like :busqueda 
                    OR first_name like :busqueda
                    OR last_name like :busqueda)" ;

        $query = "SELECT count(*) as total 
                    FROM employees
                    WHERE 1 $where";

        $busqueda = "%$busqueda%";
        $stmt = $this->conexion->prepare($query);
        if ($where !="") $stmt->bindParam("busqueda", $busqueda, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC)['total'];          

    }

public function obtenerEmpleados(
    $pagina = 1,
    $elementos = 10,
    $ordenarPor = 'emp_no',
    $orden = 'asc',
    $busqueda=''
    ): array {
    
    $offset = ($pagina - 1) * $elementos;
    $where = "";
    if ($busqueda !== "")
    $where = " AND (emp_no like :busqueda 
                OR first_name like :busqueda
                OR last_name like :busqueda)" ;

    // ⚠ Construcción directa del ORDER BY (sin bindParam)
    $query = "SELECT * 
              FROM employees 
              WHERE 1 $where
              ORDER BY $ordenarPor $orden
              LIMIT :limit
              OFFSET :offset";

    $busqueda = "%$busqueda%";

    $stmt = $this->conexion->prepare($query);
    $stmt->bindParam("limit", $elementos, PDO::PARAM_INT);
    $stmt->bindParam("offset", $offset, PDO::PARAM_INT);
    if ($where !="") $stmt->bindParam("busqueda", $busqueda, PDO::PARAM_STR);
    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


    public function getNewId(): int{
        $query = "SELECT max(emp_no) as max FROM employees";
        $stmt = $this->conexion->prepare($query);
        $stmt->execute();
        $max = $stmt->fetch(PDO::FETCH_ASSOC)['max'];
        return $max ? $max + 1 : 1;
    }

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

    public function obtenerEmpleado($id): array {
        $query = 'SELECT * FROM employees WHERE emp_no = :id';
        $stmt = $this->conexion->prepare($query);
        $stmt->bindParam('id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);   
    }

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

    public function eliminarEmpleado($id){
        $query = 'DELETE FROM employees WHERE emp_no = :id';
        $stmt = $this->conexion->prepare($query);
        $stmt->bindParam('id', $id, PDO::PARAM_INT);
        return $stmt->execute();
    }

}