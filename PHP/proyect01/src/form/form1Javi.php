<?php
    function mostrar($datos) {
        echo "<pre>" . json_encode($datos, JSON_PRETTY_PRINT) . "</pre>";
    }
    /** 
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        mostrar($_SERVER);
        mostrar($_REQUEST);
        mostrar($_GET);
        mostrar($_POST);  
    }
    */

    if ($_SERVER['REQUEST_METHOD'] == "POST") {

        $nombre = filter_var($_REQUEST["nombre"], FILTER_SANITIZE_SPECIAL_CHARS);
        $apellidos = $_REQUEST["apellidos"];
        $email = filter_var($_REQUEST["email"], FILTER_SANITIZE_EMAIL);

        $apellidos = htmlspecialchars(strip_tags($apellidos), ENT_QUOTES, 'UTF-8');
        
        If (!filter_var($nombre, FILTER_VALIDATE_REGEXP, [
            "options" => ["regexp" => "/^[a-zA-ZnÑáéíóúàè   òÁÉÍÓÚÀÈÒ ]+$/"]
        ])) {
            echo "Nombre no valido<br>";
        }

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo "EMAIL no valido<br>";
        }


        echo "<ul>";
        echo "<li>$nombre</li>";
        echo "<li>$apellidos</li>";
        echo "<li>$email</li>";
        echo "</ul>";
    }


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
    <link rel="stylesheet" href="form.css">
</head>
<body>
    <form action="form1.php" method="post">

        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" minlength="3"><br>
        
        <label for="apellidos">Apellidos:</label>
        <input type="text" name="apellidos" id="apellidos" minlength="3"><br>
        
        <label for="email">Email:</label>
        <input type="text" name="email" id="email" minlength="5"><br>

        <button type="submit">Enviar</button>
    </form>    
</body>
</html>