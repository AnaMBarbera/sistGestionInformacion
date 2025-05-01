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
        $salario = $_POST["salario"];

        $conn = conectar();
        if (!$conn){
            die("Error de conexión a la base de datos ...");
        }

        $sql = "CALL actualizar_salario(:codigo, :salario)";
        $stmt = $conn -> prepare ($sql);
        $stmt -> bindParam("codigo", $codigo, PDO::PARAM_INT);
        $stmt -> bindParam("salario", $salario, PDO::PARAM_STR);

        try {
            $resultado = $stmt -> execute();

        } catch (PDOException $e){
            echo "<p> Error: " .$e ."</p>";
            $resultado = false;
        }
        desconectar($conn);
        if ($resultado){
            echo "<p> Salario actualizado correctamente </p>";
        }
    }

?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modificar Salario</title>
        <link rel="stylesheet" href="./styles/form.css">
    </head>
    <body>
        <h2>Formulario para modificar salario</h2>
        <form action="" method="POST">
        <label for="numero">Número de Empleado:</label>
                <input type="number" name="codigo" maxlength="4" minlength="4" required  value = "<?= $codigo ?? ""?>">
                <br>

                <label for="salario">Salario Nuevo:</label>
                <input type="number" name="salario" id="salario" maxlength="40" required value = "<?= $salario ?? ""?>">
                <br>
                <button type="submit">Guardar</button><br>
                <button type="submit" value="lastSalary">Ver último salario</button><br>
        </form>
    </body>
</html>