<?php
$mes = date('m'); // Mes actual
$año = date('Y'); // Año actual
$primer_dia = strtotime("$año-$mes-01"); // Primer día del mes
$ultimo_dia = strtotime("$año-$mes-" . date('t', $primer_dia)); // Último día del mes

echo "<table border='1'>";
echo "<tr><th>Lunes</th><th>Martes</th><th>Miércoles</th><th>Jueves</th><th>Viernes</th><th>Sábado</th><th>Domingo</th></tr>";

$dia = 1;
for ($i = 0; $i < 5; $i++) {
    echo "<tr>";
    for ($j = 0; $j < 7; $j++) {
        if ($i == 0 && $j < date('N', $primer_dia) - 1) {
            echo "<td></td>";
        } else if ($dia <= date('t', $primer_dia)) {
            echo "<td>$dia</td>";
            $dia++;
        }
    }
    echo "</tr>";
}

echo "</table>";
?>