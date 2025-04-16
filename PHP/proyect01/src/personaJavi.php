<?php 
 class Persona {
    private $nombre;
    private $edad;

    public function __construct($nom, $edat){
            $this->nombre = $nom;
            $this->edad = $edat;
    }

    public function __destruct() {
        echo "He muerto rip<br>";
    }

    public function __toString(){
        return "<p>[Clase Persona] nombre: $this->nombre, edad: $this->edad<p><br>";
    }

    public function saludar() {
        echo "Hola, soy $this->nombre y tengo $this->edad años.";
    }
}
echo "Creando persona...<br>";
$persona1 = new Persona("Ana", 25);
//$persona1->nombre = "Anabel";
//$persona1->edad = 25;
$persona1->saludar(); // Hola, soy Ana y tengo 25 años.
echo $persona1;
$persona1 = null;
$p2 = new Persona("Pepe", 40);


