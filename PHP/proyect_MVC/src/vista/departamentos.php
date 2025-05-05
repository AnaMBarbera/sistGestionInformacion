<?php
    include __DIR__."/../utils/verificarAcceso.php";
    include __DIR__."/../controlador/DepartamentoControlador.php";

    $controlador = new DepartamentoControlador();
    $departamentos = $controlador->verDepartamentos();

?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Departamentos</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <h1>Lista de Departamentos</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>                   
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($departamentos as $departamento): ?>
                <tr>
                    <td><?= $departamento['dept_no'] ?></td>
                    <td><?= $departamento['dept_name'] ?></td>                    
                    <td>
                        <a href="departamentosForm.php?id=<?= $departamento['dept_no'] ?>">Editar</a>

                        <!-- tenemos que encerrar el parámetro en '' para que el script lo recoja correctamente al no ser numérico -->
                        <button onclick="eliminarDepartamento('<?= $departamento['dept_no']?>');" >Eliminar</button>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <a href="departamentosForm.php">Agregar Nuevo Departamento</a>
        <script>
            function eliminarDepartamento(dept_no) {
                if (confirm('¿Estás seguro de que deseas eliminar este departamento?')) {
                    window.location.href = `departamentosForm.php?id=${dept_no}&action=delete`;
                }
            }
        </script>
    </body>
</html>