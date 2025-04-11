<?php
$fecha = date("d/m/Y");
echo "<h2>Hoy es $fecha </h2>";
echo "<br>";

$nombre = "Ana";
$edad = 25;
$precio = 10.5;
$activo = true;
$vacio = null;
$nombres = ["Ana", "Luis", "Carlos"];

echo "Declara una variable con una edad y muestra si la persona es mayor o menor de edad. <br>";
if ($edad >= 18) {
    echo "Eres mayor de edad";
} else {
    echo "Eres menor de edad";
}
echo "<br><br>";
echo "Funciones útiles con variables <br>";
echo "tipo (gettype) nombre: " . gettype($nombre) . "<br>";
echo "tipo (gettype) edad: " . gettype($edad) . "<br>";
echo "tipo (gettype) precio: " . gettype($precio) . "<br>";
echo "tipo (gettype) activo: " . gettype($activo) . "<br>";
echo "tipo (gettype) vacio: " . gettype($vacio) . "<br>";
echo "tipo (gettype) nombres: " . gettype($nombres) . "<br>";

echo "tipo y valor (var_dump) de nombre: " . var_dump ($nombre) . "<br>";
echo "tipo y valor (var_dump) de edad: " . var_dump ($edad) . "<br>";
echo "tipo y valor (var_dump) de precio: " . var_dump ($precio) . "<br>";
echo "tipo y valor (var_dump) de activo: " . var_dump ($activo) . "<br>";
echo "tipo y valor (var_dump) de vacio: " . var_dump ($vacio) . "<br>";
echo "tipo y valor (var_dump) de nombres: " . var_dump ($nombres) . "<br>";

echo "variable definida (isset) nombre " . isset($nombre) . "<br>";
echo "variable definida (isset) no existe " .isset($no_existe) . "<br>";

echo "variable vacia (empty) de nombre: " . empty($nombre) . "<br>";
echo "variable vacia (empty) de vacio: " .empty($vacio) . "<br><br>";

echo "Imprime los números del 1 al 10 en pantalla usando un bucle for.";
echo "<br>";
for ($i = 1; $i <= 10; $i++) {
    echo $i . " - ";
}
echo "<br><br>";

echo "Escribe una función cuadrado() que reciba un número y devuelva su cuadrado. Prueba la función con el valor 5. <br>";
function cuadrado($n) {
    return $n * $n;
}
echo cuadrado(5);
echo "<br><br>";

echo "Crea un array con 3 frutas y muestra cada uno con un bucle foreach. <br>";
$nombres = ["Banana", "Manzana", "Naranja"];
foreach ($nombres as $nombre) {
    echo $nombre . "<br>";
}
?>

