<?php
    function insertDept($numero, $descripcion) {
        $sql = "INSERT INTO Departments (dept_no, dept_name) 
                VALUES (:numero, :nombre)";
            
        // leemos los parámetros de conexión...
        $host = getenv("MYSQL_HOST");
        $db = getenv("MYSQL_DB");
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");

        $rows = 0;
        $response = [];

        try {
            $conn =  new PDO("mysql:host=$host;dbname=$db", $user, $pass); // conectar con bd
            $stmt = $conn->prepare($sql); // crear statement
            // cargamos los parámetros
            $stmt->bindParam("numero", $numero, PDO::PARAM_STR);
            $stmt->bindParam("nombre", $descripcion, PDO::PARAM_STR);
            // ejecutar
            $stmt->execute();
            $rows = $stmt->rowCount();
            $response = [$rows, "Ok"];

        } catch (PDOException $e) {
            $response = [-1, $e->getMessage()];
        } finally {
            $conn = null;
        }
        return $response;
    }
            

    // Formulario para departamentos
    if ($_SERVER['REQUEST_METHOD'] === "POST") {
        $numero = $_POST["numero"];
        $nombre = $_POST["nombre"];
        $result = insertDept($numero, $nombre);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario departamentos</title>
    <link rel="stylesheet" href="./styles/form.css">
</head>
<body>
        <h1>Formulario departamentos</h1>
        <div id="errores">
            <!-- mostrar errores de la base de datos -->
             <?php
                if (isset($result)) {
                    if ($result[0]<0) {
                        echo "<p style='color:red;'>" . $result[1] . "</p>";
                    } else {
                        echo "<p style='color:green;'>" . $result[1] . "</p>";
                    }
                }
             ?>
        </div>
        <form action="" method="POST">
            <label for="numero">Número:</label>
            <input type="text" name="numero" maxlength="4" minlength="4" required  value = "<?= $numero ?? ""?>">
            <br>

            <label for="Nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" maxlength="40" required value = "<?= $nombre ?? ""?>">
            <br>

            <button type="submit">Guardar</button><br>
        </form>
</body>
</html>