<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $actual = $_POST['actual'];
    $nueva = $_POST['nueva'];
    echo "<h2>Contraseña cambiada con éxito</h2>";
} else {
    echo "<form method='POST'>";
    echo "<label for='actual'>Contraseña actual:</label><input type='password' id='actual' name='actual' required><br>";
    echo "<label for='nueva'>Nueva contraseña:</label><input type='password' id='nueva' name='nueva' required minlength='6'><br>";
    echo "<input type='submit' value='Cambiar contraseña'>";
    echo "</form>";
}
?>