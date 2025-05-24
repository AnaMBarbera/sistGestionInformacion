<?php

include __DIR__ . "/../utils/db.php";

class Alumno
{
    private $conexion;

    public function __construct()
    {
        $this->conexion = dbConnection::obtenerConexion();
    }


    public function obtenerAlumnos(        
    ): array {        

        // ⚠ Construcción directa del ORDER BY (sin bindParam)
        $query = "SELECT * 
              FROM alumnos" ;
        $stmt = $this->conexion->prepare($query);        
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function getNewId(): int
    {
        $query = "SELECT max(id) as max FROM alumnos";
        $stmt = $this->conexion->prepare($query);
        $stmt->execute();
        $max = $stmt->fetch(PDO::FETCH_ASSOC)['max'];
        return $max ? $max + 1 : 1;
    }

    public function crearAlumno($nombre, $edad, $curso, $email)
    {
        $query = "INSERT INTO alumnos (id, nombre, edad, curso, email) 
            VALUES (:id, :nombre, :edad, :curso, :email)";
        $stmt = $this->conexion->prepare($query);
        $stmt->bindValue(':id', $this->getnewId(), PDO::PARAM_INT);
        $stmt->bindValue(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->bindValue(':edad', $edad, PDO::PARAM_INT);
        $stmt->bindValue(':curso', $curso, PDO::PARAM_STR);
        $stmt->bindValue(':email', $email, PDO::PARAM_STR);        
        return $stmt->execute();
    }

    public function obtenerAlumno($id): array
    {
        $query = 'SELECT * FROM alumnos WHERE id = :id';
        $stmt = $this->conexion->prepare($query);
        $stmt->bindParam('id', $id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function actualizarAlumno($id, $nombre, $edad, $curso, $email)
    {
        $query = "UPDATE alumnos 
                SET nombre = :nombre, edad = :edad, curso = :curso, 
                    email = :email
                WHERE id = :id";
        $stmt = $this->conexion->prepare($query);
        $stmt->bindValue(':id', $id, PDO::PARAM_INT);
        $stmt->bindValue(':nombre', $nombre, PDO::PARAM_STR);
        $stmt->bindValue(':edad', $edad, PDO::PARAM_INT);
        $stmt->bindValue(':curso', $curso, PDO::PARAM_STR);
        $stmt->bindValue(':email', $email, PDO::PARAM_STR);
       
        return $stmt->execute();
    }

    public function eliminarAlumno($id)
    {
        $query = 'DELETE FROM alumnos WHERE id = :id';
        $stmt = $this->conexion->prepare($query);
        $stmt->bindParam('id', $id, PDO::PARAM_INT);
        return $stmt->execute();
    }
}
