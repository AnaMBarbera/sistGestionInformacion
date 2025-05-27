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
  <meta charset="UTF-8" />
  <title><?= $modo != 'editar' ? 'Crear' : 'Editar' ?> Alumno</title>
  <link rel="stylesheet" href="estilos.css" />
</head>
<body>

  <div class="container my-5">
    <h1 class="mb-4"><?= $modo != 'editar' ? 'Crear' : 'Editar' ?> Alumno</h1>

    <form method="POST" action="./index.php?accion=actualizar_alumno&id=<?= $id ?>" class="row">
      <div class="col-md-10">
        <label for="nombre" class="form-label">Nombre:</label>
        <input type="text" name="nombre" value="<?= $alumno['nombre'] ?? '' ?>" class="form-control" required>
      </div>

      <div class="col-md-2">
        <label for="edad" class="form-label">Edad:</label>
        <input type="number" name="edad" value="<?= $alumno['edad'] ?? '' ?>" class="form-control" required>
      </div>

      <div class="col-md-7">
        <label for="curso" class="form-label">Curso:</label>
        <input type="text" name="curso" value="<?= $alumno['curso'] ?? '' ?>" class="form-control" required>
      </div>

      <div class="col-md-5">
        <label for="email" class="form-label">Email:</label>
        <input type="email" name="email" value="<?= $alumno['email'] ?? '' ?>" class="form-control" required>
      </div>

      <div class="col-12 mt-4">
        <button type="submit" class="btn btn-primary"><?= $modo != 'eliminar' ? 'Guardar' : 'Eliminar' ?></button>
        <a href="./index.php?accion=ver_alumnos" class="btn btn-secondary">Cancelar</a>
      </div>
    </form>
  </div>

</body>
</html>
