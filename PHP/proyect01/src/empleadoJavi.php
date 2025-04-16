<?php
class Empleado {
    public $nombre;
    private $salario;

    public function __construct($nombre, $salario) {
        $this->nombre = $nombre;
        $this->salario = $salario;
    }

    function modificarSalario($newSalario) {
        $this->salario = $newSalario;
    }

    public function mostrarSalario() {
        echo "El salario de $this->nombre es $this->salario.";
    }
}

$empleado1 = new Empleado("Carlos", 3000);
$empleado1->mostrarSalario(); // El salario de Carlos es 3000.
echo $empleado1->nombre . "<br>";
$empleado1->modificarSalario(3500);
$empleado1->mostrarSalario(); // El salario de Carlos es 3000.

?>