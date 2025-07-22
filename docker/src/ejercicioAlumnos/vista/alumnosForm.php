<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
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
    <link rel="stylesheet" href="estilos.css">
    
</head>

<body class="container my-5">
    <nav class="navbar">
        <div class="container">
            <a class="navbar-brand" href="#">Gestión Alumnos</a>
            <div>
            <p class="navbar-nav">            
                <a class="nav-link" href="index.php?accion=inicio">Inicio</a>                       
                <a class="nav-link" href="index.php?accion=ver_alumnos">Alumnos</a>            
            </p>
            </div>
        </div>
        </nav>
    <h1 class="mb-4"><?= $modo != 'editar' ? 'Crear' : 'Editar' ?> Alumno</h1>
    <form method="POST" action="./index.php?accion=actualizar_alumno&id=<?= $id ?>" class="row g-3 col-md-10 col-lg-8">
        <div class="col-md-10">
            <label for="nombre" class="form-label">Nombre:</label>
            <input type="text" class="form-control" name="nombre" value="<?= $alumno['nombre'] ?? '' ?>" required><br>
        </div>
        <div class="col-md-2">
            <label for="edad" class="form-label">Edad:</label>
            <input type="number" class="form-control" name="edad" value="<?= $alumno['edad'] ?? '' ?>" required><br>
        </div>
        
        <div class="col-md-7">
            <label for="curso" class="form-label">Curso:</label>
            <input type="text" class="form-control" name="curso" value="<?= $alumno['curso'] ?? '' ?>" required><br><br>
        </div>
        <div class="col-md-5">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" name="email" value="<?= $alumno['email'] ?? '' ?>" required><br><br>
        </div>

        <div class="col-12 mt-4">
            <button type="submit" class="btn btn-primary"><?= $modo != 'eliminar' ? 'Guardar' : 'Eliminar' ?></button>
            <a href="./index.php?accion=ver_alumnos" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</body>

</html>