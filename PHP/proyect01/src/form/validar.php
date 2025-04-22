<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Sanitización de los campos antes de validarlos
        $nombre = filter_var($_POST["nombre"], FILTER_SANITIZE_STRING);
        $email = filter_var($_POST["email"], FILTER_SANITIZE_EMAIL);
        $email_confirmacion = filter_var($_POST["email_confirmacion"], FILTER_SANITIZE_EMAIL);
        $dni = filter_var($_POST["dni"], FILTER_SANITIZE_STRING);
        $telefono = filter_var($_POST["telefono"], FILTER_SANITIZE_NUMBER_INT);
        $password = $_POST["password"];
        $password_confirmacion = $_POST["password_confirmacion"];

        // Validación de campos
        if (strlen($nombre) < 4 || strlen($nombre) > 50) {
            $errores[] = "El nombre debe tener entre 4 y 50 caracteres.";
        }

        // Validación de correo electrónico
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $errores[] = "El correo electrónico no es válido.";
        }

        // Validación de confirmación de correo electrónico
        if ($email != $email_confirmacion) {
            $errores[] = "Los correos electrónicos no coinciden.";
        }

        // Validación de DNI (asumimos formato español)
        if (!preg_match("/^\d{8}[A-Za-z]$/", $dni)) {
            $errores[] = "El DNI no tiene el formato correcto.";
        }

        // Validación de teléfono
        if (!preg_match("/^\d{9}$/", $telefono)) {
            $errores[] = "El teléfono debe tener 9 dígitos.";
        }

        // Validación de contraseña
        if (strlen($password) < 6 || strlen($password) > 8 || !preg_match("/[a-z]/", $password) || !preg_match("/[A-Z]/", $password) || !preg_match("/[0-9]/", $password)) {
            $errores[] = "La contraseña debe tener entre 6 y 8 caracteres, con al menos una mayúscula, una minúscula y un número.";
        }

        // Validación de confirmación de contraseña
        if ($password != $password_confirmacion) {
            $errores[] = "Las contraseñas no coinciden.";
        }

        // Si no hay errores, mostramos mensaje de éxito
        if (empty($errores)) {
            echo "<div class='exito'>Datos recibidos correctamente, gracias.</div>";
        }
    }
?>

<!-- Mostrar errores en un div rojo -->
<?php if (!empty($errores)) { ?>
    <div class="errores">
        <ul>
            <?php foreach ($errores as $error) { ?>
                <li style="color:red;"><?php echo $error; ?></li>
            <?php } ?>
        </ul>
    </div>
<?php } ?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="form.css">
</head>
<body>
    <form action="validar.php" method="POST">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br>

        <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
        <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required><br>

        <label for="email">Correo electrónico:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="email_confirmacion">Confirmar correo electrónico:</label>
        <input type="email" id="email_confirmacion" name="email_confirmacion" required><br>

        <label for="dni">DNI:</label>
        <input type="text" id="dni" name="dni" required><br>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" required><br>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="password_confirmacion">Confirmar Contraseña:</label>
        <input type="password" id="password_confirmacion" name="password_confirmacion" required><br>

        <input type="submit" value="Enviar">
    </form>
</body>
</html>