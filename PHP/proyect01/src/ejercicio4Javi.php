<?php
    const MIN_NUMBER = 1;
    const MAX_NUMBER = 100;
    function generaArrayRand(int $length = 0): array {
        $data = [];
        for ($i = 0; $i < $length; $i++) {
            $data[] = random_int(MIN_NUMBER, MAX_NUMBER);
        }
        return $data;
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aleatorios</title>
</head>
<body>
    <h1>Números Aleatorios</h1>
    <?php
        if (!isset($_GET["number"])) {
            echo "<h2>Escriba el número de datos aleatorios que desea:</h2>";
        } else
        {
            echo "<h2>Los valores generados son: </h2>";
            //var_dump(generaArrayRand($_GET["number"]));
            echo "Numeros: ";
            foreach(generaArrayRand($_GET["number"]) as $number) {  
                echo $number . ", ";
            }
            echo "<br><hr>";
        }
    ?>
    <form id="formulario" action="ejercicio04.php" method="GET">
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