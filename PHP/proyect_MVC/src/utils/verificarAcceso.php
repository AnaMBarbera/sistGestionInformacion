<?php
// Verificar si la solicitud proviene directamente de un archivo PHP (es decir, no a través del controlador frontal)

if (basename($_SERVER['PHP_SELF']) != 'index.php') {
    header('Location: /index.php');  // Redirigir a la página de inicio
    exit;
}
?>
