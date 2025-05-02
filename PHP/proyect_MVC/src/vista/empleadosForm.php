<?php
    // Incluir el controlador
    include __DIR__.'/../controlador/EmpleadoControlador.php';

    // Crear una instancia del controlador
    $controlador = new EmpleadoControlador();

    // Inicializar las variables
    $empleado = null;
    $modo = 'crear';  // Por defecto, estamos en modo 'crear'

    // Verificar si estamos editando un empleado
    if (isset($_GET['id'])) {
        $emp_id = $_GET['id'];  // Obtener el ID del empleado a editar
        $empleado = $controlador->verEmpleado($emp_id);
        $modo = 'editar';  // Establecer el modo a 'editar'
    }

    if (isset($_GET['action']) && $_GET['action'] == 'delete') {
        // Eliminar el empleado
        $modo = 'eliminar';  // Establecer el modo a 'eliminar'
    }

    // Si se recibe un formulario POST, procesar la creación o actualización
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Obtener los datos del formulario
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $fecha_nacimiento = $_POST['fecha_nacimiento'];
        $fecha_contratacion = $_POST['fecha_contratacion'];
        $genero = $_POST['genero'];
        if ($modo == 'editar') {
            // Actualizar el empleado
            $controlador->editarEmpleado($emp_id, $nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero);
        } else if ($modo == 'crear') {
            // Crear un nuevo empleado
            $controlador->agregarEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero);            
        } else {
            $controlador->eliminarEmpleado($emp_id);
        }

        // Redirigir a la lista de empleados
        header('Location: empleados.php');
        exit;
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Formulario Empleado</title>
    </head>
    <body>
        <h1><?= $modo != 'eliminar' ? 'Editar' : 'Eliminar' ?> Empleado</h1>
        <form method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" value="<?= $empleado['first_name'] ?? '' ?>" required><br>

            <label for="apellido">Apellido:</label>
            <input type="text" name="apellido" value="<?= $empleado['last_name'] ?? '' ?>" required><br>

            <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
            <input type="date" name="fecha_nacimiento" value="<?= $empleado['birth_date'] ?? '' ?>" required><br>

            <label for="fecha_contratacion">Fecha de Contratación:</label>
            <input type="date" name="fecha_contratacion" value="<?= $empleado['hire_date'] ?? '' ?>" required><br>

            <label for="genero">Género:</label>
            <select name="genero" required>
                <option value="M" <?= isset($empleado['gender']) && $empleado['gender'] == 'M' ? 'selected' : '' ?>>Masculino</option>
                <option value="F" <?= isset($empleado['gender']) && $empleado['gender'] == 'F' ? 'selected' : '' ?>>Femenino</option>
            </select><br>

            <button type="submit"><?= $modo != 'eliminar' ? 'Guardar' : 'Eliminar' ?></button>
            <a href="empleados.php">Cancelar</a>
        </form>
    </body>
</html>