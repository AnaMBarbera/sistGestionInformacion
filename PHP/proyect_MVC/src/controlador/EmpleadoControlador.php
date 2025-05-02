<?php
include __DIR__."/../modelo/Empleado.php";

class EmpleadoControlador{
    private $modelo;

    public function __construct(){
        $this->modelo = new Empleado();
    }

    public function verEmpleados($pagina=1){
        return $this->modelo->obtenerEmpleados($pagina);
    }

    public function agregarEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero){
        return $this->modelo->crearEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero);
    }

    public function verEmpleado($id){
        return $this->modelo->obtenerEmpleado($id);
    }

    public function editarEmpleado($emp_id, $nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero){
        return $this->modelo->actualizarEmpleado($emp_id, $nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero); 
    }

    // Eliminar un empleado
    public function eliminarEmpleado($emp_id) {
        return $this->modelo->eliminarEmpleado($emp_id);
    }

}
?>