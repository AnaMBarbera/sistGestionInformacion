<?php

    function conectar() {
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");

        try {
            $conn =  new PDO("mysql:host=$host;dbname=$db", $user, $pass);
        } catch (PDOException $e) {
            // aquí habría que añadir el error al log, con los datos de conexión
            // redirigir a una página segura
            echo $e -> getMessage() . "<br>";
            return null;
        }

        return $conn;
    }

    function readDept($numero) {
        $sql = "SELECT * FROM departments WHERE dept_no = :numero";
        try {
            $conn = conectar();
            $stmt = $conn->prepare($sql);
            $stmt->bindParam("numero", $numero, PDO::PARAM_STR);
            $stmt->execute();
            $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
            $conn = null;
            return $resultado;
        } catch (PDOException $e) {
            echo $e;
            $conn = null;
            return false;
        }
    }

    function updateDept($numero, $descripcion) {
        $sql = "UPDATE departments SET  dept_name = :nombre  
                WHERE dept_no = :numero"; 

        $rows = 0;
        $response = [];

        try {
            $conn =  conectar();
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

    function insertDept($numero, $descripcion) {
        $sql = "INSERT INTO departments (dept_no, dept_name) 
                VALUES (:numero, :nombre)"; 

        $rows = 0;
        $response = [];

        try {
            $conn =  conectar();
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
    // Comprobar si el modo es de edición
    if (isset($_GET['numero'])) {
        $modo = 'update';
        $dept = readDept($_GET['numero']);
        if  (!$dept) {
            echo "Error al leer el departamento.." . $_GET['numero'];
        } else {
            $numero = $dept['dept_no'];
            $nombre = $dept['dept_name'];
        }
    } else {
        $modo = "insert";
    }

    // Formulario para departamentos
    if ($_SERVER['REQUEST_METHOD'] === "POST") {
        print_r($_POST);
        $numero = $_POST["numero"];
        $nombre = $_POST["nombre"];
        $modo = $_POST["modo"];
        if ($modo == 'update') {
            $result = updateDept($numero, $nombre);
        } else if ($modo == 'insert') {
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
        <h2>Edicion por GET</h2>
        <p style="text-align: center;">ej: localhost:8080/bbdd/employees_form2Javi.php?number=d099</p>
        <div id="errores">
            <!-- mostrar errores de la base de datos -->
             <?php
                if (isset($result)) {
                    if ($result[0]<0) {
                        echo "<p style='color:red;'>" . $result[1] . ". Filas afectadas: ". $result[2] ."</p>";
                    } else {
                        echo "<p style='color:green;'>" . $result[1] . "</p>";
                    }   
                }
             ?>
        </div>
        <form action="" method="POST">
            <label for="numero">Número:</label>
            <input type="text" 
                    name="numero" 
                    maxlength="4" 
                    minlength="4" 
                    required  
                    value = "<?= $numero ?? ""?>"
                    <?= ($modo == 'update') ? 'readonly': '' ?>>
            <br>

            <label for="Nombre">Nombre:</label>
            <input type="text" name="nombre" id="nombre" maxlength="40" required value = "<?= $nombre ?? ""?>">
            <br>

            <input type="hidden" name="modo" value="<?=$modo?>">

            <button type="submit">Guardar</button><br>
        </form>
</body>
</html>