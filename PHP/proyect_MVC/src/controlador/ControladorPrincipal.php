<?php

include  __DIR__."/EmpleadoControlador.php";
//include  __DIR__."/DepartamentoControlador.php";


class ControladorPrincipal {
    private $acciones = []; // inicialmente todas la acciones están permitidas

    public function __construct() {

        // Ver si está logueado
        if (!isset($_SESSION['usuario'])) {
            //Si no está logado permitimos las acciones
            $this->acciones = ['login', 'contacto', 'inicio'];
        };        

    }

    private function accionPermitida($accion){
        // Verificar si la acción está permitida
        if (sizeof($this->acciones) == 0) return true;
        if (in_array($accion, $this->acciones)) return true;
        return false;
    }

    public function manejarSolicitud($accion, $ordenarPor, $orden) {

        // ver_empleados -> mostrará la página principal de empleados
        // agragar_empleado -> mostrará formulario
        // editar_empleado -> mostrará formulario con el empleado
        // eliminar_empleado -> eliminar el empleado
        // inicio --> página home
        // inicio --> página contacto
        // inicio --> página login
        // inicio --> página logout
        // cuallquier otra cosa ->  página home

        //si la accion no está permitida redirigimos a inicio
        if(!$this->accionPermitida($accion)) $accion='inicio';

        switch ($accion) {
            case 'ver_empleados':
                $controlador = new EmpleadoControlador();
                $pagina = isset($_GET['pagina']) ? $_GET['pagina'] : 1;                
                $controlador->verEmpleados($pagina, $ordenarPor, $orden);
                exit();
            case 'editar_empleado':
                $controlador = new EmpleadoControlador();
                $pagina = isset($_GET['pagina']) ? $_GET['pagina'] : 1;
                $id = $_GET['id'];
                $controlador->verEmpleado($id, $pagina);
                exit();
            case 'actualizar_empleado':
                $controlador = new EmpleadoControlador();
                $pagina = isset($_GET['pagina']) ? $_GET['pagina'] : 1;
                $id = $_GET['id'];                
                $controlador->editarEmpleado($id, $pagina);
                exit();
            case 'nuevo_empleado':
                $controlador = new EmpleadoControlador();
                $pagina = isset($_GET['pagina']) ? $_GET['pagina'] : 1;                
                $controlador->nuevoEmpleado($pagina);
                exit();
            case 'eliminar_empleado':
                $controlador = new EmpleadoControlador();
                $pagina = isset($_GET['pagina']) ? $_GET['pagina'] : 1;
                $id = $_GET['id'];               
                $controlador->eliminarEmpleado($id, $pagina);
                exit();
            /*  case 'ver_departamentos':
                $controlador = new DepartamentoControlador();
                $controlador->verDepartamentos();
                exit();
            */
            case 'contacto':
                include  __DIR__."/../vista/contacto.php";
                exit();
            case 'login':
                include  __DIR__."/../vista/login.php";
                exit();
            case 'logout':
                include  __DIR__."/../utils/logout.php";
                exit();
            default: 
                break;
        }

    }

}