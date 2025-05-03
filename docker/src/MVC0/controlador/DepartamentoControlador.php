<?php
include __DIR__."/../modelo/Departamento.php";

class DepartamentoControlador{
    private $modelo;

    public function __construct(){
        $this->modelo = new Departamento();
    }

    public function verDepartamentos($pagina=1){
        return $this->modelo->obtenerDepartamentos($pagina);
    }

    public function agregarDepartamento($nombre){
        return $this->modelo->crearDepartamento($nombre);
    }

    public function verDepartamento($id){
        return $this->modelo->obtenerDepartamento($id);
    }

    public function editarDepartamento($dept_id, $nombre){
        return $this->modelo->actualizarDepartamento($dept_id, $nombre); 
    }

    // Eliminar un departamento
    public function eliminarDepartamento($dept_id) {
        return $this->modelo->eliminarDepartamento($dept_id);
    }

}
?>