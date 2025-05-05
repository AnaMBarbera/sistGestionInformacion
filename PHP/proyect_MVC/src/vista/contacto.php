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
                <li><a href="index.php?accion=ver_empleados">Empleados</a></li>
                <li><a href="index.php?accion=ver_departamentos">Departamentos</a></li>
                <li><a href="index.php?accion=contacto">Contacto</a></li>
                <!-- Si el usuario no está logueado, mostramos el enlace al login -->
                <?php if (!isset($_SESSION['usuario'])): ?>
                    <li><a href="login.php">Login</a></li>
                <?php else: ?>
                    <li><a href="logout.php">Cerrar sesión</a></li>
                <?php endif; ?>
            </ul>
        </nav>
    </header>

    <!-- Cuerpo principal de la página -->
    <main>
        <section id="bienvenida">
            <h1>Contacto</h1>
            <p>Página de contacto.</p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa soluta quod quis tempora saepe ad dolores temporibus, inventore officiis odio! Quam, doloremque beatae? Velit doloribus voluptatem temporibus ratione voluptas ut.</p>
        </section>
    </main>

    <!-- Pie de página -->
    <footer>
        <p>&copy; 2025 Sistema de Gestión</p>
    </footer>

</body>
</html>