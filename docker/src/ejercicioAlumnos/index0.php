<?php
    include __DIR__."/controlador/ControladorPrincipal.php";
    session_start();

    $accion = "inicio";
    if (isset($_GET["accion"])) {
        $accion = $_GET["accion"];
    }    
    $controlador = new ControladorPrincipal();
    $controlador->manejarSolicitud($accion);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión de Alumnos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Cabecera -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Gestión Alumnos</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?accion=inicio">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?accion=ver_alumnos">Alumnos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!-- Contenido principal -->
    <main class="flex-grow-1 container py-4">
        <div class="text-center">
            <h1 class="display-4">Bienvenido al Sistema de Gestión de Alumnos</h1>
            <p class="lead">Desde esta página, puedes gestionar la base de datos de la escuela con la tabla de alumnos.</p>
            <p>Selecciona una opción del menú para empezar.</p>
        </div>
    </main>

    <!-- Pie de página -->
    <footer class="bg-dark text-white text-center py-3 mt-auto">
        <p class="mb-0">&copy; 2025 Sistema de Gestión</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
