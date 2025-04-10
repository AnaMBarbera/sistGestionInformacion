<?php
$titulos = ["Nombre", "Apellido1", "Apellido2", "ID", "Departamento"];
$empleados = [
    ["Ana", "Martínez", "Martínez", "101", "Recursos Humanos"],
    ["Juan", "García", "García", "102", "Ventas"],
    ["María", "López", "López", "103", "Marketing"] 
];
echo "<table border='1'>";
echo "<tr>";
foreach ($titulos as $titulo) {
    echo "<th>" . $titulo . "</th>";
}
echo "</tr>";
foreach ($empleados as $empleado) {
    echo "<tr>";
    foreach ($empleado as $campo) {
        echo "<td>" . $campo . "</td>";
    }
    echo "</tr>";
}
echo "</table>";
?>