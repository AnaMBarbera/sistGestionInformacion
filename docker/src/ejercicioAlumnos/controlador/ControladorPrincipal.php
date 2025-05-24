<?php

include  __DIR__ . "/AlumnoControlador.php";

class ControladorPrincipal
{
    private $acciones = []; // inicialmente todas la acciones están permitidas


    public function manejarSolicitud($accion)
    {

        switch ($accion) {
            case 'ver_alumnos':
                $controlador = new AlumnoControlador();
                $controlador->verAlumnos();
                exit();
            case 'editar_alumnos':
                $controlador = new AlumnoControlador();
                $id = $_GET['id'];
                $controlador->verAlumno($id);
                exit();
            case 'actualizar_alumno':
                $controlador = new AlumnoControlador();
                $id = $_GET['id'];
                $controlador->editarAlumno($id);
                exit();
            case 'nuevo_alumno':
                $controlador = new AlumnoControlador();
                $controlador->nuevoAlumno();
                exit();
            case 'eliminar_alumno':
                $controlador = new AlumnoControlador();
                $id = $_GET['id'];
                $controlador->eliminarAlumno($id);
                exit();

            default:
                break;
        }
    }
}
