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
        $dept_no = "";

        $conn = conectar();
        if (!$conn){
            die("Error de conexión a la base de datos ...");
        }

        $sql = "SELECT lastDept(:codigo) as dept_no";
        $stmt = $conn -> prepare ($sql);
        $stmt -> bindParam(":codigo", $codigo, PDO::PARAM_INT);
        

        try {
            $resultado = $stmt -> execute();
            $fila = $stmt->fetch(PDO::FETCH_ASSOC);
            $dept_no = $fila['dept_no'];

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
        <title>Modificar Salario</title>
        <link rel="stylesheet" href="./styles/form.css">
    </head>
    <body>
        <h2>Formulario para ver el último departamento</h2>
        <form action="" method="POST">
        <label for="numero">Número de Empleado:</label>
                <input type="number" name="codigo" maxlength="4" minlength="4" required  value = "<?= $codigo ?? ""?>">
                <br>

                <label for="dept_no">Departamento:</label>
                <input type="text" name="dept_no" id="dept_no" readonly  value = "<?= $dept_no ?? ""?>">
                <br>
                <!--<button type="submit">Guardar</button><br> -->
                <button type="submit">Ver último Departamento</button><br>
        </form>
    </body>
</html>