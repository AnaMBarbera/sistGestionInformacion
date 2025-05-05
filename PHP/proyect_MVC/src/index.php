<?php
include __DIR__."/controlador/ControladorPrincipal.php";

//http://localhost:8080/index.php?&action=ver;

$accion = "inicio";

if (isset($_GET["accion"])) {
    $accion = $_GET["accion"];
}

$controlador = new ControladorPrincipal();
$controlador->manejarSolicitud($accion);


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Hello world!!</h1>

</body>
</html>