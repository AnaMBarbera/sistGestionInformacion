<?php

interface IDibujable {
    public function dibujar();
}
abstract class Figura implements IDibujable{
    public $color = null;
    protected $nombre;
    public function __construct($color) {
        // 
        $this->color = $color;
        echo "Se ha creado una Figura <br>";

    }

    abstract public function perimetro(): float;
}


class Cuadrado extends Figura {
    public $lado;
    public function __construct($lado, $color) {
        parent::__construct($color);
        $this->lado = $lado;
        echo "Se ha creado un cuadrado <br>";
        $this->nombre = "Luis";
    }
    public function perimetro(): float {
        return 0;
    }

    public function dibujar(){
        echo "<p>pintando cuadrado $this->nombre</p>";
    }
}

function pintar(Idibujable $object): void{
    $object->dibujar();
}

$p = new Cuadrado(3, "rojo");
echo "p " . $p->perimetro();
echo "c ". $p->color;
$p->dibujar();
pintar($p);
