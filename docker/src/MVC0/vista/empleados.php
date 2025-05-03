<?php
    include __DIR__."/../controlador/EmpleadoControlador.php";

    $controlador = new EmpleadoControlador();
    $empleados = $controlador->verEmpleados();

?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Empleados</title>
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
                        <a href="empleadosForm.php?id=<?= $empleado['emp_no'] ?>">Editar</a>
                        <button onclick="eliminarEmpleado(<?= $empleado['emp_no']?>);" >Eliminar</button>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <a href="empleadosForm.php">Agregar Nuevo Empleado</a>
        <script>
            function eliminarEmpleado(emp_no) {
                if (confirm('¿Estás seguro de que deseas eliminar este empleado?')) {
                    window.location.href = `empleadosForm.php?id=${emp_no}&action=delete`;
                }
            }
        </script>
    </body>
</html>