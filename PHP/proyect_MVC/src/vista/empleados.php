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
                    <a href="/index.php?accion=editar_empleado&id=<?= $empleado['emp_no'] ?>">Editar</a>
                    <button onclick="eliminarEmpleado(<?= $empleado['emp_no']?>);" >Eliminar</button>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <a href="./index.php?accion=nuevo_empleado">Agregar Nuevo Empleado</a>
    <script>
        function eliminarEmpleado(emp_no) {
            if (confirm('¿Estás seguro de que deseas eliminar este empleado?')) {
                window.location.href = `/index.php?accion=eliminar_empleado&id=${emp_no}`;
            }
        }
    </script>
</body>
</html>