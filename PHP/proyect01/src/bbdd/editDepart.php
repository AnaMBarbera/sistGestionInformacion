<?php

    function conectar(){
        // Conexión a la base de datos
        $host = getenv("MYSQL_HOST");
        $db = getenv("MYSQL_DB");
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
    
        try {
            // Crear la conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            return $conexion;    
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
            return false;
        } 
    }

    function desconectar($conexion){
        $conexion = null;
        return true;
    }    

    if ($_SERVER['REQUEST_METHOD'] === "POST") {
        $codigo = $_POST["codigo"];
        $nuevo_Dept = $_POST["nuevo_Dept"];

        $conn = conectar();
        if (!$conn){
            die("Error de conexión a la base de datos ...");
        }

        $stmt = $conn->prepare("CALL actualizar_depart(:codigo, :nuevo_Dept)");
        $stmt->bindParam(":codigo", $codigo, PDO::PARAM_INT);
        $stmt->bindParam(":nuevo_Dept", $nuevo_Dept, PDO::PARAM_STR);
        

        try {
            $resultado = $stmt -> execute();

        } catch (PDOException $e){
            echo "<p> Error: " .$e ."</p>";
            $resultado = false;
        }
        desconectar($conn);
        if ($resultado){
            echo "<p> Departamento actualizado correctamente </p>";
        }
    }

    

?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Departamento</title>
        <link rel="stylesheet" href="./styles/form.css">
    </head>
    <body>
        <h2>Formulario para modificar departamento</h2>
        <form action="" method="POST">
        <label for="codigo">Número de Empleado:</label>
                <input type="number" name="codigo" maxlength="4" minlength="4" required  value = "<?= $codigo ?? ""?>">
                <br>

                <label for="nuevo_Dept">Departamento Nuevo:</label>
                <input type="text" name="nuevo_Dept" id="nuevo_Dept" maxlength="40" required value = "<?= $nuevo_Dept ?? ""?>">
                <br>
                <button type="submit">Guardar</button><br>
                <button type="submit" value="lastDepart">Ver último departamento</button><br>
        </form>
    </body>
</html>