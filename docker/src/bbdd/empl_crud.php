<?php
    function insertDept($numero, $descripcion) {
        $sql = "INSERT INTO departments (dept_no, dept_name) 
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
        $db = "employees";
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
    
    function deletDept($numero, $descripcion){
        // Conexión a la base de datos
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
    
        try {
            // Crear la conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Para manejar excepciones correctamente
    
            // Consulta SQL
            $query = "DELETE FROM departments WHERE dept_no = :dept_no";
            $stmt = $conexion->prepare($query);
    
            // Asociar los parámetros
            $stmt->bindParam(':dept_no', $numero, PDO::PARAM_STR);
            //esta línea no hace falta aquí         
            //$stmt->bindParam(':dept_name', $descripcion, PDO::PARAM_STR);
    
            // Ejecutar la consulta
            $stmt->execute();
    
            // Mostrar mensaje y número de filas afectadas
            echo "Departamento eliminado correctamente";
            $filasAfectadas = $stmt->rowCount();
            echo "<br> Filas afectadas: $filasAfectadas";
    
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        } finally {
            // Cerrar la conexión
            $conexion = null;
        }
    }  
    
    function listarDepartamentos() {
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
    
        try {
            $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
            $stmt = $conn->query("SELECT dept_no, dept_name FROM departments ORDER BY dept_no");
            $departamentos = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $departamentos;
        } catch (PDOException $e) {
            return [];
        }
    }

    function buscarDepartamento($numero) {
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
    
        try {
            $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
            $stmt = $conn->prepare("SELECT dept_name FROM departments WHERE dept_no = :numero");
            $stmt->bindParam(":numero", $numero, PDO::PARAM_STR);
            $stmt->execute();
    
            if ($fila = $stmt->fetch(PDO::FETCH_ASSOC)) {
                return $fila["dept_name"];
            } else {
                return "";
            }
        } catch (PDOException $e) {
            return "";
        }
    } 
    // Código para detectar accion del botón
    if ($_SERVER['REQUEST_METHOD'] === "POST") {
        $numero = $_POST["numero"];
        $nombre = $_POST["nombre"];
        $accion = $_POST["accion"] ?? "";
    
        switch ($accion) {
            case "guardar":
                $result = insertDept($numero, $nombre);
                break;
            case "editar":
                $result = editDept($numero, $nombre);
                break;
            case "eliminar":
                $result = deletDept($numero, $nombre);
                break;
            case "buscar":
                // Solo intentamos autocompletar el nombre
                $nombre = buscarDepartamento($numero);
                $result = [1, "Nombre de departamento cargado"];
                break;
            default:
                $result = [-1, "Acción no reconocida"];
        }
    }
    $numero = $_POST["numero"] ?? "";
    $nombre = $_POST["nombre"] ?? "";

    // Si hay un número pero no nombre, buscamos el nombre automáticamente
    if ($numero && !$nombre) {
        $nombre = buscarDepartamento($numero);
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
                <input type="text" name="nombre" id="nombre" maxlength="40" value = "<?= $nombre ?? ""?>">
                <br>
                <input type="submit" name="accion" value="buscar">
                <input type="submit" name="accion" value="guardar">
                <input type="submit" name="accion" value="editar">
                <input type="submit" name="accion" value="eliminar"><br>
            </form>
            <ul id="depts">
                <h2>Listado de departamentos</h2>
                <?php
                    $departamentos = listarDepartamentos();
                    foreach ($departamentos as $dept) {
                        echo "<li><strong>{$dept['dept_no']}</strong>: {$dept['dept_name']}</li>";
                    }
                ?>
            </ul>  
    </body>
</html>