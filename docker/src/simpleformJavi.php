<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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