<?php
    include __DIR__."/controlador/ControladorPrincipal.php";
    session_start();
    //http://localhost:8080/index.php?&action=ver;

    $accion = "inicio";

    if (isset($_GET["accion"])) {
        $accion = $_GET["accion"];
    }
    $ordenarPor = $_GET["ordenarPor"] ?? 'emp_no';
    $orden = $_GET["orden"] ?? 'asc';
    $busqueda = $_GET["busqueda"] ?? '';

    $controlador = new ControladorPrincipal();
    $controlador->manejarSolicitud($accion, $ordenarPor, $orden, $busqueda);


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/vista/styles.css">
    <title>Document</title>
</head>
<body>
    <!-- Cabecera -->
    <header>
        <nav>
            <ul>
                <li><a href="index.php?accion=inicio">Inicio</a></li>

                <?php if (isset($_SESSION['usuario'])): ?>
                <li><a href="index.php?accion=ver_empleados">Empleados</a></li>
                <!--<li><a href="index.php?accion=ver_departamentos">Departamentos</a></li>-->
                <li><a href="vista\departamentos.php">Departamentos</a></li>
                <?php endif;?>
                
                <li><a href="index.php?accion=contacto">Contacto</a></li>
                
                <!-- Si el usuario no está logueado, mostramos el enlace al login -->
                <?php if (!isset($_SESSION['usuario'])): ?>
                    <li><a href="index.php?accion=login">Login</a></li>
                <?php else: ?>
                    <li><a href="index.php?accion=logout">Cerrar sesión</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>

    <!-- Cuerpo principal de la página -->
    <main>
        <section id="bienvenida">
            <h1>Bienvenido al Sistema de Gestión de Empleados</h1>
            <p>Desde esta página, puedes gestionar empleados, departamentos y más.</p>
            <p>Selecciona una opción del menú para empezar.</p>
        </section>
    </main>

    <!-- Pie de página -->
    <footer>
        <p>&copy; 2025 Sistema de Gestión</p>
    </footer>

</body>
</html>