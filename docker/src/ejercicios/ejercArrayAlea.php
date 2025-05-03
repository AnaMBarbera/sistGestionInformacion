<?php
function generarAleatorios($cantidad) {
    $numeros = [];
    for ($i = 0; $i < $cantidad; $i++) {
        $numeros[] = rand(1, 100); // Números aleatorios entre 1 y 100
    }
    return $numeros;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cantidad = $_POST['cantidad'];
    $numeros = generarAleatorios($cantidad);
    echo "<ul>";
    foreach ($numeros as $numero) {
        echo "<li>$numero</li>";
    }
    echo "</ul>";
} else {
    echo "<form method='POST'>";
    echo "<label for='cantidad'>¿Cuántos números aleatorios generar?</label><input type='number' id='cantidad' name='cantidad' required><br>";
    echo "<input type='submit' value='Generar números'>";
    echo "</form>";
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Array Aleatorio</title>
</head>
<body>
    <?php if (!isset($_GET["cantidad"])): ?>
        <h1>Generar Aleatorios</h1>
    <?php else: ?>
        <?php $numeros = generarAleatorios($cantidad);?>
        <ul>
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