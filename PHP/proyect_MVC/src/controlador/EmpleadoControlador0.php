<?php
include __DIR__."/../utils/verificarAcceso.php";
include __DIR__."/../modelo/Empleado.php";

class EmpleadoControlador{
    private $modelo;

    public function __construct(){
        $this->modelo = new Empleado();
    }

    public function verEmpleados($pagina=1){
       // return $this->modelo->obtenerEmpleados($pagina);
       //para el controlador principal
       $empleados = $this->modelo->obtenerEmpleados($pagina);
        include__DIR__."/../vista/empleados.php";
    }

    public function agregarEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero){
        return $this->modelo->crearEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero);
    }

    public function verEmpleado($id){
       // return $this->modelo->obtenerEmpleado($id);
       $empleados = $this->modelo->obtenerEmpleado($id);
       $emp_id = $id;
       $modo = 'editar';
       include__DIR__."/../vista/empleadosForm.php";

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