<?php
include __DIR__.'/../modelo/Empleado.php';

class EmpleadoControlador {
    private $modelo;

    public function __construct() {
        $this->modelo = new Empleado();
    }

    public function verEmpleados($pagina = 1) {
        $empleadosPorPagina = 10;
        $empleados = $this->modelo->obtenerEmpleados($pagina, $empleadosPorPagina);
        $totalEmpleados = $this->modelo->obtenerTotalEmpleados();
        //ceil redondea hacia arriba
        $totalPaginas = ceil($totalEmpleados/$empleadosPorPagina);
        include __DIR__."/../vista/empleados.php";
    }

    public function agregarEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero) {
        return $this->modelo->crearEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero);
    }

    public function verEmpleado($id, $pagina): void {
        
        $empleado =  $this->modelo->obtenerEmpleado($id);
        $emp_id= $id;
        $modo = 'editar';
        include __DIR__."/../vista/empleadosForm.php";
    }   

    public function editarEmpleado($id, $pagina) {
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $fecha_contratacion = $_POST['fecha_contratacion'];
        $fecha_nacimiento = $_POST['fecha_nacimiento'];
        $genero = $_POST['genero'];
        if($id!=-1){
        $this->modelo->actualizarEmpleado(
            $id, 
            $nombre, 
            $apellido, 
            $fecha_nacimiento, 
            $fecha_contratacion, 
            $genero);
        } else {
            $this->modelo->crearEmpleado(                
                $nombre, 
                $apellido, 
                $fecha_nacimiento, 
                $fecha_contratacion, 
                $genero);
            }
        header("location: /index.php?accion=ver_empleados&pagina=$pagina");
    }

    public function nuevoEmpleado($pagina) {
        $empleado=[];
        $emp_id=-1;
        $modo = 'crear';
        include __DIR__."/../vista/empleadosForm.php";
    }

    public function eliminarEmpleado($id, $pagina) {
        $this->modelo->eliminarEmpleado($id);
        header("location: /index.php?accion=ver_empleados&pagina=$pagina");
    }
}