<?php
    //include __DIR__."/../utils/verificarAcceso.php";
    include __DIR__."/../modelo/Departamento.php";

class DepartamentoControlador{
    private $modelo;

    public function __construct(){
        $this->modelo = new Departamento();
    }

    public function verDepartamentos($pagina=1){
        $departamentosPorPagina = 10;
        $departamentos = $this->modelo->obtenerDepartamentos($pagina, $departamentosPorPagina);
        $totalDepartamentos = $this->modelo->obtenerTotalDepartamentos();
        //ceil redondea hacia arriba
        $totalPaginas = ceil($totalDepartamentos/$departamentosPorPagina);
        include __DIR__."/../vista/departamentos.php";

    }

    public function agregarDepartamento($nombre){
        return $this->modelo->crearDepartamento($nombre);
    }

    public function verDepartamento($id, $pagina):void{
        $departamento = $this->modelo->obtenerDepartamento($id);
        $dept_id= $id;
        $modo = 'editar';
        include __DIR__."/../vista/departamentosForm.php";
    }

    public function editarDepartamento($dept_id, $nombre, $pagina){
        $this->modelo->actualizarDepartamento($dept_id, $nombre); 
    }else {
        $this->modelo->crearDepartamento(                
            $nombre);
        }

    header("location: /index.php?accion=ver_departamentos&pagina=$pagina");

    public function nuevoDepartamento($pagina) {
        $departamento=[];
        $dept_id=-1;
        $modo = 'crear';
        include __DIR__."/../vista/departamentosForm.php";
    }
    // Eliminar un departamento
    public function eliminarDepartamento($dept_id, $pagina) {
        $this->modelo->eliminarDepartamento($dept_id);
        header("location: /index.php?accion=ver_departamentos&pagina=$pagina");
    }
}
?>