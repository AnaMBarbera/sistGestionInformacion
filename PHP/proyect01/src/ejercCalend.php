<?php
    $mes = date('m'); // Mes actual
    $año = date('Y'); // Año actual
    $primer_dia = strtotime("$año-$mes-01"); // Primer día del mes (formato timestamp)
    $ultimo_dia = strtotime("$año-$mes-" . date('t', $primer_dia)); // Último día del mes (formato timestamp)
    /*
        date('t', $primer_dia) devuelve cuántos días tiene el mes (28, 30, 31).
        strtotime() convierte una fecha en una marca de tiempo (timestamp) que PHP puede manejar fácilmente.
    */
    echo "<table border='1'>";
    echo "<tr><th>Lunes</th><th>Martes</th><th>Miércoles</th><th>Jueves</th><th>Viernes</th><th>Sábado</th><th>Domingo</th></tr>";

    $dia = 1;
    // Se asume un máximo de 5 semanas por mes
    for ($i = 0; $i < 5; $i++) {
        echo "<tr>";
        // 7 días por semana
        // Si estamos en la primera semana y antes del primer día del mes
        for ($j = 0; $j < 7; $j++) {
            if ($i == 0 && $j < date('N', $primer_dia) - 1) {
                echo "<td></td>"; // Celda vacía
            } else if ($dia <= date('t', $primer_dia)) {
                echo "<td>$dia</td>";
                $dia++;
            }
        }
        echo "</tr>";
    }
    echo "</table>";
?>