<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['usuario'];
    $contrasena = $_POST['contrasena'];
    echo "<h2>Bienvenido, $usuario!</h2>";
} else {
    echo "<form method='POST'>";
    echo "<label for='usuario'>Usuario:</label><input type='text' id='usuario' name='usuario' required><br>";
    echo "<label for='contrasena'>Contraseña:</label><input type='password' id='contrasena' name='contrasena' required><br>";
    echo "<input type='submit' value='Ingresar'>";
    echo "</form>";
}
?>