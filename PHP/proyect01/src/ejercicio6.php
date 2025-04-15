<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de contraseña</title>
</head>
<body>
    <?php
        const USER_NAME = "admin";
        const USER_PASS = "123456";
        if ($_SERVER["REQUEST_METHOD"] == "GET"&& isset($_GET['username'], $_GET['oldpass'], $_GET['newpass'], $_GET['repeatpass'])) {
            $username = $_GET['username'];
            $oldpass = $_GET['oldpass'];
            $newpass = $_GET['newpass'];
            $repeatpass = $_GET['repeatpass'];
            if(USER_NAME == $username AND USER_PASS == $oldpass){
                if ($newpass == $repeatpass){
                    echo "<h2>Contraseña cambiada<h2>";
                }
                else {
                    echo "<h2>Las contraseñas nuevas no coinciden</h2>";
                }
            } else {
                echo "<h2>Usuario o contraseña actual incorrectos</h2>";
            }
        }
    ?>

    <form action="ejercicio6.php" method="GET">
        <h2>Formulario cambio de contraseña</h2>

        <label for="username">Usuario:</label>
        <input type="text" name="username" id="username" required value="<?= $username ?? '' ?>"><br>

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