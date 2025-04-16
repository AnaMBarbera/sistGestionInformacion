<!--
    Crea una clase Coche con las propiedades marca y modelo, y un método detalles() que muestre los detalles del coche. Instancia un objeto de esa clase y muestra los detalles.
-->
<?php
class Coche {
    public $marca;
    public $modelo;

    public function __construct($marca, $modelo) {
        $this->marca = $marca;
        $this->modelo = $modelo;
    }

    public function detalles() {
        echo "Marca: $this->marca, Modelo: $this->modelo<br>" ;
    }
}

$coche1 = new Coche("Dacia", "Sandero");
$coche1->detalles();
?>
<!--
    Crea una clase CuentaBancaria con las propiedades titular y saldo. La clase debe tener un método para ingresar dinero y otro para retirar. Crea una instancia de la clase, ingresa dinero, retíralo y muestra el saldo.
-->
<?php
class CuentaBancaria {

    public $titular;
    public $saldo;

    public function __construct($titular, $saldo) {
        $this->titular = $titular;
        $this->saldo = $saldo;
    }
    public function retirar($cantidad) {
        $this->saldo=$this->saldo-$cantidad;
        echo "<span style='color:red'>El cliente: $this->titular ha retirado $cantidad euros </span><br>";
    }
    public function ingresar($cantidad) {
        $this->saldo=$this->saldo+$cantidad;
        echo "<span style='color:green'>El cliente: $this->titular ha ingresado $cantidad euros</span><br>";
    }
    public function mostrar() {
        echo "El cliente: $this->titular, Tiene un saldo de: $this->saldo euros<br>";
    }
}
$titular1 = new CuentaBancaria ("Pepe Tous", 2000);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Cuenta Bancaria</title>
    <style>
           body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 40px;
        }

        h3 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: #ecf0f1;
            margin-bottom: 10px;
            padding: 10px 15px;
            border-left: 5px solid #3498db;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: background-color 0.3s ease;
        }

        li:hover {
            background-color: #d6eaf8;
        }
    </style>
</head>
<body>
    <h3>Operaciones realizadas</h3>
    <ul>
        <li><?php $titular1->mostrar(); ?></li>
        <li><?php $titular1->ingresar(1000); ?></li>
        <li><?php $titular1->mostrar(); ?></li>
        <li><?php $titular1->retirar(500); ?></li>
        <li><?php $titular1->mostrar(); ?></li>
    </ul>
</body>
</html>
