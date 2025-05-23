<?php
include __DIR__.'/../modelo/Alumno.php';
    
class AlumnoControlador {
    private $modelo;

    public function __construct() {
        $this->modelo = new Alumno();
    }

    public function verAlumnos() {        
        $alumnos = $this->modelo->obtenerAlumnos();
        
        include __DIR__."/../vista/alumnos.php";
    }

    public function agregarAlumno($nombre, $edad, $curso, $email) {
        return $this->modelo->crearAlumno($nombre, $edad, $curso, $email);
    }

    public function verAlumno($id): void {
        
        $alumno =  $this->modelo->obtenerAlumno($id);
        $id= $id;
        $modo = 'editar';
        include __DIR__."/../vista/AlumnosForm.php";
    }   

    public function editarAlumno($id) {
        $nombre = $_POST['nombre'];
        $edad = $_POST['edad'];
        $curso = $_POST['curso'];
        $email = $_POST['email'];
        
        if($id!=-1){
        $this->modelo->actualizarAlumno(
            $id, 
            $nombre, 
            $edad, 
            $curso, 
            $email);
        } else {
            $this->modelo->crearAlumno(                
                $nombre, 
                $edad, 
                $curso, 
                $email);
            }
        header("location: ./index.php?accion=ver_alumnos");
    }

    public function nuevoAlumno() {
        $alumno=[];
        $id=-1;
        $modo = 'crear';
        include __DIR__."/../vista/alumnosForm.php";
    }

    public function eliminarAlumno($id) {
        $this->modelo->eliminarAlumno($id);
        header("location: ./index.php?accion=ver_alumnos");
    }
}