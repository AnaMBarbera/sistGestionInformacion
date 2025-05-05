<?php
include __DIR__."/../utils/verificarAcceso.php";


if ($_SERVER['REQUEST_METHOD']=='POST') {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $fecha_contratacion = $_POST['fecha_contratacion'];
    $fecha_nacimiento = $_POST['fecha_nacimiento'];
    $genero = $_POST['genero'];

    if ($modo == 'crear') {
        $controlador->agregarEmpleado($nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero);
    } else if ($modo == 'editar') {
        $controlador->editarEmpleado($emp_id, $nombre, $apellido, $fecha_nacimiento, $fecha_contratacion, $genero);
    } else if ($modo == 'eliminar') {
        $controlador->eliminarEmpleado($emp_id);
    }
    
    header('location: empleados.php');
    exit;
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario Empleado</title>
    <link rel="stylesheet" href="/vista/styles.css">
</head>
<body>
    <h1><?= $modo != 'editar' ? 'Crear' : 'Editar' ?> Empleado</h1>
    <form method="POST" action="/index.php?accion=actualizar_empleado&id=<?=$emp_id?>">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="<?= $empleado['first_name'] ?? '' ?>" required><br>

        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" value="<?= $empleado['last_name'] ?? '' ?>" required><br>

        <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
        <input type="date" name="fecha_nacimiento" value="<?= $empleado['birth_date'] ?? '' ?>" required><br><br>

        <label for="fecha_contratacion">Fecha de Contratación:</label>
        <input type="date" name="fecha_contratacion" value="<?= $empleado['hire_date'] ?? '' ?>" required><br><br>

        <label for="genero">Género:</label>
        <select name="genero" required>
            <option value="M" <?= isset($empleado['gender']) && $empleado['gender'] == 'M' ? 'selected' : '' ?>>Masculino</option>
            <option value="F" <?= isset($empleado['gender']) && $empleado['gender'] == 'F' ? 'selected' : '' ?>>Femenino</option>
        </select><br><br>

        <button type="submit"><?= $modo != 'eliminar' ? 'Guardar' : 'Eliminar' ?></button>
        <a href="/index.php?accion=ver_empleados">Cancelar</a>
    </form>
</body>
</html>