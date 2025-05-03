<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=h1, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Listado de empleados </h2>


    <?php
    /*
        include 'utils/db.php';
        $con=dbConnection::obtenerConexion();
        echo "Conexion ok";
    */

        include 'modelo/Empleado.php';

        $empleado = new Empleado();
        $lista = $empleado->obtenerEmpleados();

        echo "<ul>";
        foreach ($lista as $empleado){
            echo "<li>".$empleado["emp_no"].": ".$empleado["first_name"]." ".$empleado["last_name"]."</li>";
        }
        echo "</ul>";
    ?>    
</body>
</html>