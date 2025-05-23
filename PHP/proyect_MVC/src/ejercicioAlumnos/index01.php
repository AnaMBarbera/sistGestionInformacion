<?php
    include __DIR__."/controlador/ControladorPrincipal.php";
    session_start();
    //http://localhost:8080/index.php?&action=ver;

    $accion = "inicio";

    if (isset($_GET["accion"])) {
        $accion = $_GET["accion"];
    }    

    $controlador = new ControladorPrincipal();
    $controlador->manejarSolicitud($accion);


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/vista/styles.css">
    <title>Document</title>
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body class="d-flex flex-column min-vh-100">
    <!-- Cabecera -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <ul>
                <li><a href="index.php?accion=inicio">Inicio</a></li>                
                <li><a href="index.php?accion=ver_alumnos">Alumnos</a></li>                
            </ul>
        </nav>
    </header>

    <!-- Cuerpo principal de la página -->
    <main>
        <section id="bienvenida">
            <h1>Bienvenido al Sistema de Gestión de Alumnos</h1>
            <p>Desde esta página, puedes gestionar la base de datos de la escuela con la tabla de alumnos.</p>
            <p>Selecciona una opción del menú para empezar.</p>
        </section>
    </main>

    <!-- Pie de página -->
    <footer>
        <p>&copy; 2025 Sistema de Gestión</p>
    </footer>

</body>
</html>