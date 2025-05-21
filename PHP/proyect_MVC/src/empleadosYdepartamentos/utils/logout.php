<?php
    session_start();  // leo los datos de la sesión

    // Destruir la sesión
    session_destroy();

    // Redirigir al usuario a la página de inicio
    header("Location: index.php?accion=inicio");
    exit;
?>