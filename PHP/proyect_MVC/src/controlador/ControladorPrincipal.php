<?php

include  __DIR__."/EmpleadoControlador.php";

class ControladorPrincipal {
    public function __construct() {
        // todo
    }

    public function manejarSolicitud($accion) {

        // ver_empleados -> mostrará la página principal de empleados
        // agragar_empleado -> mostrará formulario
        // editar_empleado -> mostrará formulario con el empleado
        // eliminar_empleado -> eliminar el empleado
        // inicio --> página home
        // cuallquier otra cosa ->  página home
        switch ($accion) {
            case 'ver_empleados':
                $controlador = new EmpleadoControlador();
                $controlador->verEmpleados();
                exit();
            case 'editar_empleado':
                $controlador = new EmpleadoControlador();
                $id = $_GET['id'];
                $controlador->verEmpleado($id);
                exit();
            case 'actualizar_empleado':
                $controlador = new EmpleadoControlador();
                $id = $_GET['id'];                
                $controlador->editarEmpleado($id);
                exit();
            case 'nuevo_empleado':
                $controlador = new EmpleadoControlador();                
                $controlador->nuevoEmpleado();
                exit();
            case 'eliminar_empleado':
                $controlador = new EmpleadoControlador();
                $id = $_GET['id'];               
                $controlador->eliminarEmpleado($id);
                exit();
            default: 
                break;
        }

    }

}