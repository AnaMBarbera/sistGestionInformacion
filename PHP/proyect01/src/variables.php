<?php
$nombre = "Ana";
$edad = 25;
$precio = 10.5;
$activo = true;
$vacio = null;
$nombres = ["Ana", "Luis", "Carlos"];

echo "tipo nombre " . gettype($nombre) . "<br>";
echo "tipo edad " . gettype($edad) . "<br>";
echo "tipo precio " . gettype($precio) . "<br>";
echo "tipo activo " . gettype($activo) . "<br>";
echo "tipo vacio " . gettype($vacio) . "<br>";
echo "tipo nombres " . gettype($nombres) . "<br>";

echo "tipo y valor de nombre: " . var_dump ($nombre) . "<br>";
echo "tipo y valor de edad: " . var_dump ($edad) . "<br>";
echo "tipo y valor de precio: " . var_dump ($precio) . "<br>";
echo "tipo y valor de activo: " . var_dump ($activo) . "<br>";
echo "tipo y valor de vacio: " . var_dump ($vacio) . "<br>";
echo "tipo y valor de nombres: " . var_dump ($nombres) . "<br>";

echo "variable definida nombre " . isset($nombre) . "<br>";
echo "variable definida no existe " .isset($no_existe) . "<br>";

echo "variable vacia (empty) de nombre: " . empty($nombre) . "<br>";
echo empty($vacio) . "<br>";
?>