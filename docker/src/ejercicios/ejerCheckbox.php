<?php
$categorias = ["Tecnología", "Salud", "Deportes", "Cultura"];

echo "<form method='POST'>";
foreach ($categorias as $categoria) {
    echo "<input type='checkbox' name='categorias[]' value='$categoria'>$categoria<br>";
}
echo "<input type='submit' value='Seleccionar categorías'>";
echo "</form>";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $seleccionadas = $_POST['categorias'];
    echo "<h3>Categorías seleccionadas:</h3><ul>";
    foreach ($seleccionadas as $categoria) {
        echo "<li>$categoria</li>";
    }
    echo "</ul>";
}
?>