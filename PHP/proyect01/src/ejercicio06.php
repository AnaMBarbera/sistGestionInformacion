<?php
    const USER_NAME = "admin";
    const USER_PASS = "123456";

    function validarUsuario( $usuario, $pass): bool {
        return $usuario == USER_NAME && $pass == USER_PASS;
    }

    function validarNewPass($pass1, $pass2): bool {
        return $pass1 == $pass2;
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de contraseña</title>
    <style>
        .error {
            color: red;
        }
        .acierto {
            color: green;
        }
    </style>
</head>
<body>
    <div id="errores">
        <?php
            if (!isset($_GET["username"])) {
            } else {
                $username = $_GET["username"];
                $password = $_GET["oldpass"];
                $newPass  = $_GET["newpass"];
                $repeatPass = $_GET["repeatpass"];
                if (!validarUsuario($username, $password)) {
                    echo "<p class='error'>Usuario y contraseña no váidlos</p>";
                } else if (!validarNewPass($newPass, $repeatPass)) {
                    echo "<p class='error'> Las nuevas contraseñas no son iguales</p>";
                } else {
                    echo "<p class='acierto'> Cambio realizado correctamente </p>";
                }
            }
        ?>
    </div>
    <form action="ejercicio06.php" method="GET">
        <h2>Formulario cambio de contraseña</h2>

        <label for="username">Usuario:</label>
        <input type="text" 
            name="username"
             id="username" 
             required
             value="<?= $username ?? ""?>"><br>

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