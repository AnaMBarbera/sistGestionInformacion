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
  <meta charset="UTF-8" />
  <title>Gestión Alumnos</title>
  <link rel="stylesheet" href="estilos.css" />
</head>
<body>

  <!-- Cabecera -->
  <header>
    <nav class="navbar">
      <div class="container">
        <a class="navbar-brand" href="#">Gestión Alumnos</a>
        <div>
          <ul class="navbar-nav">
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
  <main class="flex-grow-1 container">
    <div class="text-center">
      <h1 class="display-4">Bienvenido al Sistema de Gestión de Alumnos</h1>
      <p class="lead">Desde esta página, puedes gestionar la base de datos de la escuela con la tabla de alumnos.</p>
      <p>Selecciona una opción del menú para empezar.</p>
    </div>
  </main>

  <!-- Pie de página -->
  <footer>
    <p class="mb-0">&copy; 2025 Sistema de Gestión</p>
  </footer>

</body>
</html>
