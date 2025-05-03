
<?php
    // Incluir el controlador
    include __DIR__.'/../controlador/DepartamentoControlador.php';

    // Crear una instancia del controlador
    $controlador = new DepartamentoControlador();

    // Inicializar las variables
    $departamento = null;
    $modo = 'crear';  // Por defecto, estamos en modo 'crear'

    // Verificar si estamos editando un departamento
    if (isset($_GET['id'])) {
        $dept_id = $_GET['id'];  // Obtener el ID del departamento a editar
        $departamento = $controlador->verDepartamento($dept_id);
        $modo = 'editar';  // Establecer el modo a 'editar'
    }

    if (isset($_GET['action']) && $_GET['action'] == 'delete') {
        // Eliminar el departamento
        $modo = 'eliminar';  // Establecer el modo a 'eliminar'
    }

    // Si se recibe un formulario POST, procesar la creación o actualización
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Obtener los datos del formulario
        $nombre = $_POST['nombre'];
        
        if ($modo == 'editar') {
            // Actualizar el departamento
            $controlador->editarDepartamento($dept_id, $nombre);
        } else if ($modo == 'crear') {
            // Crear un nuevo departamento
            $controlador->agregarDepartamento($nombre);            
        } else {
            $controlador->eliminarDepartamento($dept_id);
        }

        // Redirigir a la lista de empleados
        header('Location: departamentos.php');
        exit;
    }
?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Formulario Departamento</title>
    </head>
    <body>
        <h1><?= $modo != 'eliminar' ? 'Editar' : 'Eliminar' ?> Departamento</h1>
        <form method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" name="nombre" value="<?= $departamento['dept_name'] ?? '' ?>" required><br>
            

            <button type="submit"><?= $modo != 'eliminar' ? 'Guardar' : 'Eliminar' ?></button>
            <a href="departamentos.php">Cancelar</a>
        </form>
    </body>
</html>