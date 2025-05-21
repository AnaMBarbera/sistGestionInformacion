<?php
    include __DIR__."/../utils/verificarAcceso.php";
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Empleados</title>
    <link rel="stylesheet" href="/vista/styles.css">
</head>
<body>
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
    <!-- Busqueda -->
    <div id="busqueda">
        <h2>Buscar empleados</h2>
        <form method="GET" action="index.php" > 
            <input name="busqueda" type="text" placeholder="buscar por nombre o apellido" value="<?= $busqueda?>"/>
            <input type="text" name="accion" value="ver_empleados" hidden >            
            <button type="submit">Buscar</button>
        </form>
    </div>

    <h1>Lista de Empleados</h1>
    <table>
        <thead>
            <tr>
                <th>
                    <a href="/index.php?accion=ver_empleados&ordenarPor=emp_no&orden=asc">+</a>
                    ID
                    <a href="/index.php?accion=ver_empleados&ordenarPor=emp_no&orden=desc">-</a>
                </th>
                <th>
                    <a href="/index.php?accion=ver_empleados&ordenarPor=first_name&orden=asc">+</a>
                    Nombre
                    <a href="/index.php?accion=ver_empleados&ordenarPor=first_name&orden=desc">+</a>
                </th>
                <th>
                    <a href="/index.php?accion=ver_empleados&ordenarPor=last_name&orden=asc">+</a>
                    Apellido
                    <a href="/index.php?accion=ver_empleados&ordenarPor=last_name&orden=desc">+</a>
                </th>
                <th>Fecha de Nacimiento</th>
                <th>Fecha de Contratación</th>
                <th>Género</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($empleados as $empleado): ?>
            <tr>
                <td><?= $empleado['emp_no'] ?></td>
                <td><?= $empleado['first_name'] ?></td>
                <td><?= $empleado['last_name'] ?></td>
                <td><?= $empleado['birth_date'] ?></td>
                <td><?= $empleado['hire_date'] ?></td>
                <td><?= $empleado['gender'] ?></td>
                <td>
                    <a href="/index.php?accion=editar_empleado&id=<?= $empleado['emp_no'] ?>&pagina=<?= $pagina ?>">Editar</a>
                    <button onclick="eliminarEmpleado(<?= $empleado['emp_no']?>);" >Eliminar</button>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div style="max-width: 800px; margin: 0 auto;">
        <a href="./index.php?accion=nuevo_empleado&pagina=<?=($pagina)?>">Agregar Nuevo Empleado</a>
    </div>
    <!--Paginacion -->
    <div id="paginacion">
        <a href="/index.php?accion=ver_empleados&pagina=1">Pag.1</a>
        <a href="/index.php?accion=ver_empleados&pagina=<?=($pagina>1) ? $pagina -1 : 1 ?>">Anterior</a>
        <span><?= $pagina ?> de <?= $totalPaginas ?></span>
        <a href="/index.php?accion=ver_empleados&pagina=<?=($pagina<$totalPaginas) ? $pagina +1 : $totalPaginas ?>">Siguiente</a>
        <a href="/index.php?accion=ver_empleados&pagina=<?=$totalPaginas ?> ">última</a>
    </div>

    <script>
        function eliminarEmpleado(emp_no) {
            if (confirm('¿Estás seguro de que deseas eliminar este empleado?')) {
                window.location.href = `/index.php?accion=eliminar_empleado&id=${emp_no}&pagina=<?=($pagina)?>`;
            }
        }
    </script>
</body>
</html>