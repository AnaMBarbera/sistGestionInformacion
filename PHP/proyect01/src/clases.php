<?php 
class Persona {
    public $nombre;
    public $edad;

    public function saludar() {
        echo "Hola, soy $this->nombre y tengo $this->edad años.";
    }
}
?>
<h3>Creando persona ...</h3>
<?php
$persona1 = new Persona();
$persona1->nombre = "Ana";
$persona1->edad = 25;
$persona1->saludar(); // Hola, soy Ana y tengo 25 años.
?>

<h3>Crear clase con constructor</h3>
<?php
class Personas {
    public $nombre;
    public $edad;

    public function __construct($nombre, $edad) {
        $this->nombre = $nombre;
        $this->edad = $edad;
    }

    public function __destruct() {
        echo "<br><h4>function __destruct()</h4>";
        echo "El objeto ha sido destruido.<br>";
    }

    public function __toString() {
        echo "<br><h4>function __toString()</h4>";
        return "Nombre: $this->nombre, Edad: $this->edad <br>";
    }
}
?>
<?php
$persona1 = new Personas("Juan", 30);
echo $persona1->nombre; // Juan
$persona1->edad = 35;
echo $persona1->edad; // 35
echo $persona1; // Nombre: Juan, Edad: 35
unset($persona1); // El objeto ha sido destruido.
 // También sirve
$persona1 = null;
?>

<h3> Clases abstractas, interface (y herencia) </h3>
<?php
abstract class Figura {
    abstract public function area();
    abstract public function perimetro():float;
    public function __construct() {
        echo "Se ha creado una figura <br>";
    }
}

interface Dibujable {
    public function dibujar();
}   

class Cuadrado extends Figura implements Dibujable {
    public $lado;

    public function __construct($lado) {
        parent::__construct();       
        $this->lado = $lado;
    }

    public function area() {
        return $this->lado * $this->lado;
    }

    public function perimetro():float {
        return 4 * $this->lado;
    }

    public function dibujar() {
        echo "Dibujando un cuadrado. <br>";
    }
}

function pintar(Dibujable $object){
    $object ->dibujar();
}
?>
<?php
$cuadrado = new Cuadrado(5,00);
echo "Área del cuadrado: " . $cuadrado->area() . "<br>";
echo "Perímetro del cuadrado: " . $cuadrado->perimetro() . "<br>";
$cuadrado->dibujar(); // Dibujando un cuadrado.
pintar($cuadrado);
?>