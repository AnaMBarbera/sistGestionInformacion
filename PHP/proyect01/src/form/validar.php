

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