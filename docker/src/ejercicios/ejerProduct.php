<?php
$productos = [
    ["Producto 1", 15, "Este es el producto 1, muy popular."],
    ["Producto 2", 10, "Producto 2, ideal para uso diario."],
    ["Producto 3", 20, "Producto 3, calidad superior."]
];

echo "<ul>";
foreach ($productos as $producto) {
    echo "<li><strong>" . $producto[0] . "</strong> - $" . $producto[1] . "<br>" . $producto[2] . "</li>";
}
echo "</ul>";
?>