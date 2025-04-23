<?php
    // Crear conexión
    $dsn = "mysql:host=host.docker.internal;dbname=employees;charset=utf8mb4";
    $usuario = getenv('MYSQL_USER');
    $contraseña = getenv('MYSQL_PASSWORD');
    $conexion = new PDO($dsn, $usuario, $contraseña);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $dept_no = '';
    $dept_name = '';
    $mensaje = '';
    $filasAfectadas = 0;

    // Cuando se envía el formulario
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $dept_no = $_POST['dept_no'];

        // Si se ha ingresado un nombre nuevo, actualizar
        if (!empty($_POST['dept_name'])) {
            $dept_name = $_POST['dept_name'];
            $query = "UPDATE departments SET dept_name = :dept_name WHERE dept_no = :dept_no";
            $stmt = $conexion->prepare($query);
            $stmt->bindParam(':dept_no', $dept_no, PDO::PARAM_STR);
            $stmt->bindParam(':dept_name', $dept_name, PDO::PARAM_STR);
            $stmt->execute();
            $filasAfectadas = $stmt->rowCount();
            $mensaje = "Departamento actualizado correctamente. <br> Filas afectadas: $filasAfectadas";
        } else {
            // Si solo se está buscando el nombre actual del departamento
            $stmt = $conexion->prepare("SELECT dept_name FROM departments WHERE dept_no = :dept_no");
            $stmt->bindParam(':dept_no', $dept_no);
            $stmt->execute();
            $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($resultado) {
                $dept_name = $resultado['dept_name'];
            } else {
                $mensaje = "Departamento no encontrado.";
            }
        }
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de contacto</title>
    <style>
         h2{
            text-align: center;
         }
         /* Estilos generales para el formulario */
        form {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);            
        }

        /* Estilos para las etiquetas */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        /* Estilos para los inputs */
        input[type="text"],
        input[type="number"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #bbb;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;            
        }

        /* Estilos para el botón */
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>  
    <h2>Editar Departamento</h2>
    <?php if ($mensaje): ?>
        <p><?= htmlspecialchars($mensaje) ?></p>
    <?php endif; ?>
    <form action="" method="post">
        <label for="dept_no">Número de departamento : </label>
        <input type="text" id="dept_no" name="dept_no" maxlength="4" minlength="4" value="<?= htmlspecialchars($dept_no) ?>">
        
        <label for="dept_name">Nuevo nombre departamento: </label>
        <input type="text" id="dept_name" name="dept_name" value="<?= htmlspecialchars($dept_name) ?>">        
        <input type="submit" value="Enviar">        
    </form>
</body>
</html>