<?php
    function insertDept($numero, $descripcion) {
        $sql = "INSERT INTO Departments (dept_no, dept_name) 
                VALUES (:numero, :nombre)";
            
        // leemos los parámetros de conexión...
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");

        $rows = 0;
        $response = [];

        try {
            $conn =  new PDO("mysql:host=$host;dbname=employees", $user, $pass); // conectar con bd
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

    function editDept($numero, $descripcion){
        // Conexión a la base de datos
        $host = getenv("MYSQL_HOST");
        $db = getenv("MYSQL_DB");
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
    
        try {
            // Crear la conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Para manejar excepciones correctamente
    
            // Consulta SQL
            $query = "UPDATE departments SET dept_name = :dept_name WHERE dept_no = :dept_no";
            $stmt = $conexion->prepare($query);
    
            // Asociar los parámetros
            $stmt->bindParam(':dept_no', $numero, PDO::PARAM_STR);
            $stmt->bindParam(':dept_name', $descripcion, PDO::PARAM_STR);
    
            // Ejecutar la consulta
            $stmt->execute();
    
            // Mostrar mensaje y número de filas afectadas
            echo "Departamento modificado correctamente";
            $filasAfectadas = $stmt->rowCount();
            echo "<br> Filas afectadas: $filasAfectadas";
    
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        } finally {
            // Cerrar la conexión
            $conexion = null;
        }
    }
    
            

    // Formulario para editar departamentos
    if (isset($_GET["number"])){
        if ($_SERVER['REQUEST_METHOD'] === "POST") {
            $numero = $_POST["numero"];
            $nombre = $_POST["nombre"];
        $result = editDept($numero, $nombre);
        }
    } 
    // Formulario para insertar departamentos
    if (!isset($_GET["number"])){
        if ($_SERVER['REQUEST_METHOD'] === "POST") {
            $numero = $_POST["numero"];
            $nombre = $_POST["nombre"];
            
            $result = insertDept($numero, $nombre);
        }
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