<?php
    // Crear conexión
    $dsn = "mysql:host=host.docker.internal;dbname=employees;charset=utf8mb4";
    $usuario = getenv('MYSQL_USER');
    $contraseña = getenv('MYSQL_PASSWORD');
    $conexion = new PDO($dsn, $usuario, $contraseña);
    // Configurar el modo de error de PDO
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // Preparar y ejecutar el INSERT    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Obtener datos del formulario
            $dept_no = $_POST['dept_no'];
            $dept_name = $_POST['dept_name'];


        $query = "INSERT INTO departments (dept_no, dept_name) 
                VALUES (:dept_no, :dept_name)";
        $stmt = $conexion->prepare($query);
        $stmt->bindParam(':dept_no', $dept_no, PDO::PARAM_STR);
        $stmt->bindParam(':dept_name', $dept_name, PDO::PARAM_STR);

        $stmt->execute();
        echo "Departamento insertado correctamente";
        $filasAfectadas = $stmt->rowCount();
        echo "<br> Filas afectadas: $filasAfectadas";
        // Cerrar la conexión
        $conexion = null;
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
    <h2>Nuevo Departamento</h2>
    <form action="" method="post">
        <label for="dept_no">Número : </label>
        <input type="text" id="dept_no" name="dept_no" maxlength="4" minlength="4">
        <label for="dept_name">Departamento: </label>
        <input type="text" id="dept_name" name="dept_name">        
        <input type="submit" value="Enviar">        
    </form>
</body>
</html>