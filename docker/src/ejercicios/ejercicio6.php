<?php
    const USER_NAME = "admin";
    const USER_PASS = "123456";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de contraseña</title>
</head>
<body>
    <form action="ejercicio06.php" method="GET">
        <h2>Formulario cambio de contraseña</h2>

        <label for="username">Usuario:</label>
        <input type="text" name="username" id="username" required><br>

        <label for="oldpass">Contraseña actual:</label>
        <input type="password" id="oldpass" name="oldpass" required minlength="6"><br>

        <label for="newpass">Contraseña nueva:</label>
        <input type="password" id="newpass" name="newpass" required maxlength="8" minlength="6"><br>
    
        <label for="repeatpass">Repita contraseña:</label>
        <input type="password" name="repeatpass" id="repeatpass"><br>

        <button type="submit">Modificar Contraseña</button>
    
    </form>
</body>
</html>