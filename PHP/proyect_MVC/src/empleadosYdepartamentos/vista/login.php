<?php
   // session_start();  // Iniciar sesión
    // Incluir la clase de autenticación
    include __DIR__."/../utils/autenticacion.php";
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Obtener los datos del formulario
        $usuario = $_POST['usuario'];
        $contraseña = $_POST['contraseña'];

        // Crear una instancia de la clase de autenticación
        $autenticacion = new Autenticacion();

        // Validar las credenciales
        if ($autenticacion->validarUsuario($usuario, $contraseña)) {
            // Guardar el usuario en la sesión
            $_SESSION['usuario'] = $usuario;

            // Redirigir al usuario a la página de empleados
            header('Location: index.php');
            exit;
        } else {
            $error = "Credenciales incorrectas. Por favor, intente de nuevo.";
        }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
    <link rel="stylesheet" href="/vista/styles.css">
</head>
<body>

    <h1>Inicio de sesión</h1>

    <?php if (isset($error)): ?>
        <p style="color: red;"><?= $error ?></p>
    <?php endif; ?>

    <form method="POST">
        <label for="usuario">Usuario:</label>
        <input type="text" name="usuario"  value="<?=$usuario ?? ''?>" required><br>

        <label for="contraseña">Contraseña:</label>
        <input type="password" name="contraseña" value="<?=$contraseña ?? ''?>" required><br>
        <br>
        <button type="submit">Iniciar sesión</button>
    </form>

</body>
</html>