<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {
    $nombre = $_POST['nombre'];
    $edad = $_POST['edad'];
    $curso = $_POST['curso'];
    $email = $_POST['email'];    

    if ($modo == 'crear') {
        $controlador->agregarAlumno($nombre, $edad, $curso, $email);
    } else if ($modo == 'editar') {
        $controlador->editarAlumno($id, $nombre, $edad, $curso, $email);
    } else if ($modo == 'eliminar') {
        $controlador->eliminarAlumno($id);
    }
    
    header('location: alumnos.php');
    exit;
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario Alumno</title>
    <link rel="stylesheet" href="/vista/styles.css">
</head>
<body>
    <h1><?= $modo != 'editar' ? 'Crear' : 'Editar' ?> Alumno</h1>
    <form method="POST" action="./index.php?accion=actualizar_alumno&id=<?=$id?>">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="<?= $alumno['nombre'] ?? '' ?>" required><br>

        <label for="edad">Edad:</label>
        <input type="number" name="edad" value="<?= $alumno['edad'] ?? '' ?>" required><br>

        <label for="curso">Curso:</label>
        <input type="text" name="curso" value="<?= $alumno['curso'] ?? '' ?>" required><br><br>

        <label for="email">Email:</label>
        <input type="email" name="email" value="<?= $alumno['email'] ?? '' ?>" required><br><br>

        

        <button type="submit"><?= $modo != 'eliminar' ? 'Guardar' : 'Eliminar' ?></button>
        <a href="./index.php?accion=ver_alumnos">Cancelar</a>
    </form>
</body>
</html>