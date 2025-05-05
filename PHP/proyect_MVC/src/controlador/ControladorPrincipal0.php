<?php
include __DIR__."/../utils/verificarAcceso.php";
// Incluir los controladores específicos
include __DIR__'/EmpleadoControlador.php';

// Controlador principal que dirige las solicitudes
class ControladorPrincipal {

    public function __construct(){

    }

    // Maneja las solicitudes
    public function manejarSolicitud($accion) {
        switch ($accion) {
            case 'ver_empleados':
                // Mostrar empleados
                $controlador = new EmpleadoControlador();
                $controlador->verEmpleados();
                exit();
            case 'editar_empleado':
                // Editar empleado
               // if (isset($_GET['id'])) {
                    $emp_id = $_GET['id'];
                    $controlador = new EmpleadoControlador();
                    $controlador->verEmpleado($emp_id);
                //}
                die();
                break;
            case 'agregar_empleado':
                // Agregar empleado
                $controlador = new EmpleadoControlador();
                $controlador->verEmpleado(-1);
                die();
                break;
            case 'eliminar_empleado':
                // Eliminar empleado
                if (isset($_GET['id'])) {
                    $emp_id = $_GET['id'];
                    $controlador = new EmpleadoControlador();
                    $controlador->eliminarEmpleado($emp_id);
                }
                header('Location: index.php?accion=ver_empleados');
                die();
                break;
            case 'inicio':
                break;
            default:
                // Redirigir a la página de inicio si no se encuentra la acción
                header('Location: index.php');
                die();
                exit;
        }
    }
}
?>