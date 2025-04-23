<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener datos del formulario
        $usuario = $_POST['usuario'];
        $contrasena = $_POST['contrasena'];
        $tipo_conexion = $_POST['tipo_conexion'];
        $servidor = getenv('MYSQL_HOST');
        $basededatos = getenv('MYSQL_DB');
        $conexion = null;
        // Realizar la conexión según el tipo seleccionado  
        switch ($tipo_conexion) {
            case 'mysqli_proc':
                $conexion = mysqli_connect($servidor, $usuario, $contrasena, $basededatos);
                if (!$conexion) {
                    die("Conexión fallida: " . mysqli_connect_error());
                }
                echo "Conexión exitosa a la base de datos MySQL (Procedimental)!";
                mysqli_close($conexion);
                break;
            case 'mysqli_oo':
                $conexion = new mysqli($servidor, $usuario, $contrasena, $basededatos);
                if ($conexion->connect_error) {
                    die("Conexión fallida: " . $conexion->connect_error);
                }
                echo "Conexión exitosa a la base de datos MySQL (Orientado a objetos)!";
                $conexion->close();
                break;
            case 'pdo':
                try {
                    $conexion = new PDO("mysql:host=$servidor;dbname=$basededatos", $usuario, $contrasena);
                    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    echo "Conexión exitosa a la base de datos MySQL (PDO)!";
                    $conexion = null; // Cerrar conexión
                } catch (PDOException $e) {
                    echo "Conexión fallida: " . $e->getMessage();
                }
                break;
            default:
                echo "Tipo de conexión no válido.";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conexión a la base de datos</title>
    <link rel="stylesheet" href="./styles/form.css">
</head>
<body>
    <h1>Conexión a la base de datos</h1>
    <form action="ejercConexion.php" method="post">
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" required><br><br>

        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required><br><br>

        <label for="tipo_conexion">Tipo de conexión:</label>
        <select id="tipo_conexion" name="tipo_conexion">
            <option value="mysqli_proc">MySQLi (Procedimental)</option>
            <option value="mysqli_oo">MySQLi (Orientado a objetos)</option>
            <option value="pdo">PDO</option>
        </select><br><br>

        <input type="submit" value="Conectar">
    </form>
</body>
</html>