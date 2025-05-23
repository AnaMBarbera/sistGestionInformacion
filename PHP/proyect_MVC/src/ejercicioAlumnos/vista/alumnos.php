
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Alumnos</title>
    <link rel="stylesheet" href="/vista/styles.css">
</head>
<body>  

    <h1>Lista de Alumnos</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th>Curso</th>
                <th>Email</th>                
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($alumnos as $alumno): ?>
            <tr><td><?= $alumno['id'] ?></td>
                <td><?= $alumno['nombre'] ?></td>
                <td><?= $alumno['edad'] ?></td>
                <td><?= $alumno['curso'] ?></td>
                <td><?= $alumno['email'] ?></td>                
                <td>
                    <a href="index.php?accion=editar_alumnos&id=<?= $alumno['id'] ?>">Editar</a>
                    <button onclick="eliminarAlumno(<?= $alumno['id']?>);" >Eliminar</button>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
    <div style="max-width: 800px; margin: 0 auto;">
        <a href="./index.php?accion=nuevo_alumno">Agregar Nuevo Alumno</a>
    </div>   

    <script>
        function eliminarAlumno(id) {
            if (confirm('¿Estás seguro de que deseas eliminar este alumno?')) {
                window.location.href = `./index.php?accion=eliminar_alumno&id=${id}`;
            }
        }
    </script>
</body>
</html>