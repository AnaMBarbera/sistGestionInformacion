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
    <h1>Lista de Empleados</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
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