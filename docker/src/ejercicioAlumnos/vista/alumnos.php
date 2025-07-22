

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Alumnos</title>
  <link rel="stylesheet" href="estilos.css" />
</head>
<body>

  <!-- Cabecera -->
  <header>
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
  </header>

  <div class="container my-5">
    <h1 class="mb-4">Lista de Alumnos</h1>

    <table class="table table-striped table-bordered">
      <thead class="table-dark">
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
        <tr>
          <td><?= $alumno['id'] ?></td>
          <td><?= $alumno['nombre'] ?></td>
          <td><?= $alumno['edad'] ?></td>
          <td><?= $alumno['curso'] ?></td>
          <td><?= $alumno['email'] ?></td>                
          <td>
            <a href="./index.php?accion=editar_alumnos&id=<?= $alumno['id'] ?>" class="btn btn-warning btn-sm">Editar</a>
            <button onclick="eliminarAlumno(<?= $alumno['id']?>);" class="btn btn-danger btn-sm">Eliminar</button>
          </td>
        </tr>
        <?php endforeach; ?>
      </tbody>
    </table>

    <div class="text-center mt-4">
      <a href="./index.php?accion=nuevo_alumno" class="btn btn-success">Agregar Nuevo Alumno</a>
    </div>
  </div>

  <script>
    function eliminarAlumno(id) {
      if (confirm('¿Estás seguro de que deseas eliminar este alumno?')) {
        window.location.href = `./index.php?accion=eliminar_alumno&id=${id}`;
      }
    }
  </script>

  <footer>
    <p class="mb-0">&copy; 2025 Sistema de Gestión</p>
  </footer>

</body>
</html>
