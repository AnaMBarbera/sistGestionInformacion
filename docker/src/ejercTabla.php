<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $numero = $_POST['numero'];
    echo "<h2>Tabla de multiplicar de $numero</h2>";
    echo "<table border='1'>";
    for ($i = 1; $i <= 10; $i++) {
        echo "<tr><td>$numero x $i</td><td>" . ($numero * $i) . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "<form method='POST'>";
    echo "<label for='numero'>Ingresa un número:</label><input type='number' id='numero' name='numero' required><br>";
    echo "<input type='submit' value='Generar tabla'>";
    echo "</form>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla</title>
</head>
<body>
    <?php if (!isset($_GET["number"])): ?>
        <h1>Formularios de datos</h1>
    <?php else: ?>
        <table>
            <tr>
                <th>Multiplicación</th>
                <th>Resultado</th>
            </tr>
            <?php for ($i = 1; $i < 11; $i++): ?>
                <tr>
                <td><?= "{$_GET["number"]} x {$i}" ?></td>
                <td><?= $_GET["number"] * $i ?></td>
                </tr>
            <?php endfor; ?>
        </table>
        <hr>
    <?php endif; ?>

    <form id="formulario" action="simpleformJavi.php" method="GET">
        <label for="number">Número:</label>
        <input type="number" 
            name="number" id="number" 
            min="0" 
            max="100"
            value="<?= $_GET["number"] ?? 0 ?>">
        <input type="submit" value="Enviar">
    </form>
</body>
</html>