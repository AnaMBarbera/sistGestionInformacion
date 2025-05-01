<?php
    function listarEmpl(){
        $datos = "";
        try {
            // leemos los parámetros de conexión...
            $host = getenv("MYSQL_HOST");
            $db = "employees";
            $user = getenv("MYSQL_USER");
            $pass = getenv("MYSQL_PASSWORD");
            // Crear conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Consulta para obtener los nombres y apellidos de los empleados
            $query = "SELECT emp_no, first_name, last_name  FROM employees LIMIT 30";
            $resultado = $conexion->query($query);

            // Mostrar los resultados 
            $datos = "<h2> Listado de empleados </h2>";           
            while ($fila = $resultado->fetch(PDO::FETCH_ASSOC)) {
                //para sacar los datos quitamos echo y lo ponemos en una variable, luego haremos el return de esa variable
                $datos .= "Numero: " . $fila['emp_no'] ." - Nombre: " . $fila['first_name'] . " - Apellido: " . $fila['last_name'] .  "<br>";
            }

        } catch (PDOException $e) {
            echo "Conexión fallida: " . $e->getMessage();
        }
        $conexion = null;
        return [1, $datos];
    }
    function buscarEmpl($emp_no){
        // leemos los parámetros de conexión...
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
        $datos = "";
        try {
            
            // Crear conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Consulta para obtener el nombre y apellido del empleado
            $query = "SELECT emp_no, first_name, last_name FROM employees WHERE emp_no = :emp_no";
            $stmt = $conexion->prepare($query);
            $stmt->bindParam(':emp_no', $emp_no);            
            $stmt->execute();
            // Mostrar los resultados
            $datos = "<h2> Datos del empleado </h2>";
            while ($fila = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $datos .= "Nombre: " . $fila['first_name'] . " - Apellido: " . $fila['last_name'] . "<br>";
            }

        } catch (PDOException $e) {
            echo "Conexión fallida: " . $e->getMessage();
        }
        $conexion = null;
        return [1, $datos]; 
    }
    function buscarNombre($nombre){
        // leemos los parámetros de conexión...
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
        $datos = "";
        try {            
            // Crear conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Consulta para obtener el nombre y apellido del empleado
            $query = "SELECT first_name, last_name FROM employees WHERE first_name LIKE :nombre OR last_name LIKE :nombre LIMIT 30";
            $stmt = $conexion->prepare($query);
            //para añadir los caracteres en la consulta
            $nombre = "%" . $nombre . "%";

            $stmt->bindParam(':nombre', $nombre);            
            $stmt->execute();
            // Mostrar los resultados
            $datos = "<h2> Empleados por nombre </h2>";
            while ($fila = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $datos .= "Nombre: " . $fila['first_name'] . " - Apellido: " . $fila['last_name'] . "<br>";
            }

        } catch (PDOException $e) {
            echo "Conexión fallida: " . $e->getMessage();
        }
        $conexion = null;
        return [1, $datos]; 
    }
    function buscarFecha($fechaIni, $fechaFin){
        // leemos los parámetros de conexión...
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
        $datos = "";
        try {            
            // Crear conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Consulta para obtener el nombre y apellido del empleado
            $query = "SELECT first_name, last_name, hire_date FROM employees WHERE hire_date BETWEEN :fechaIni AND :fechaFin LIMIT 30";
            $stmt = $conexion->prepare($query);
            //para añadir los caracteres en la consulta            
            $stmt->bindParam(':fechaIni', $fechaIni);
            $stmt->bindParam(':fechaFin', $fechaFin);             
            $stmt->execute();
            // Mostrar los resultados
            $datos = "<h2> Empleados por Fecha </h2>";
            while ($fila = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $datos .= "Nombre: " . $fila['first_name'] . " - Apellido: " . $fila['last_name'] ." - Fecha Contratación: " . $fila['hire_date'] .  "<br>";
            }

        } catch (PDOException $e) {
            echo "Conexión fallida: " . $e->getMessage();
        }
        $conexion = null;
        return [1, $datos]; 
    }
    function buscarDept($dept){
        // leemos los parámetros de conexión...
        $host = getenv("MYSQL_HOST");
        $db = "employees";
        $user = getenv("MYSQL_USER");
        $pass = getenv("MYSQL_PASSWORD");
        $datos = "";
        try {
            
            // Crear conexión
            $conexion = new PDO("mysql:host=$host;dbname=employees", $user, $pass);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            // Consulta para obtener el nombre y apellido del empleado
            $query = "SELECT employees.first_name, employees.last_name, departments.dept_name 
                FROM employees
                INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
                INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
                WHERE departments.dept_no = :dept LIMIT 30 ";
            $stmt = $conexion->prepare($query);
            $stmt->bindParam(':dept', $dept);            
            $stmt->execute();
            // Mostrar los resultados
            $datos = "<h2> Datos de los empleados del departamento ".$dept. "</h2>";
            while ($fila = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $datos .= "Nombre: " . $fila['first_name'] . " - Apellido: " . $fila['last_name'] . "<br>";
            }

        } catch (PDOException $e) {
            echo "Conexión fallida: " . $e->getMessage();
        }
        $conexion = null;
        return [1, $datos]; 
    }
    
    if ($_SERVER['REQUEST_METHOD'] === "POST") {
        $emp_no = $_POST["emp_no"]; 
        $nombre =  $_POST["nombre"];
        $dept =  $_POST["dept"];      
        $accion = $_POST["accion"] ?? "";
        $fechaIni = $_POST["fechaIni"];
        $fechaFin = $_POST["fechaFin"];
    
        switch ($accion) {
            case "listar":
                $result = listarEmpl();
                break;
            case "buscar":
                $result = buscarEmpl($emp_no);
                break;
            case "buscarNombre":
                if (empty($nombre)) {
                    $result = [-1, "Debes ingresar un nombre para buscar."];
                } else {
                    $result = buscarNombre($nombre);
                }
                break;
            case "buscarFecha":
                $result = buscarFecha($fechaIni, $fechaFin);
                break;
            case "buscarDept":
                $result = buscarDept($dept);
                break;            
            default:
                $result = [-1, "Acción no reconocida"];
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Consultas de datos</title>
        <link rel="stylesheet" href="./styles/form.css">
    </head>
    <body>
        <h2>Formulario empleados</h2>
        <div id="errores">
            <!-- mostrar errores de la base de datos -->
            <?php                    
                if (isset($result) && $result[0] < 0) {
                    echo "<p style='color:red;'>" . $result[1] . "</p>";
                }
            ?>
        </div>            
        <form action="" method="POST">
            
            <label for="emp_no">Número de empleado:</label>
            <input type="text" name="emp_no" maxlength="5" value = "<?= $emp_no ?? ""?>">
            <label for="nombre">Nombre de empleado:</label>
            <input type="text" name="nombre" value = "<?= $nombre ?? ""?>">
            <br>
            <label for="dept">Departamento:</label>
            <input type="text" name="dept" value = "<?= $dept ?? ""?>">
            <br>
            <label for="fechaIni">Fecha inicial:</label>
            <input type="date" name="fechaIni" id="fechaIni">
            <label for="fechaFin">Fecha final:</label>
            <input type="date" name="fechaFin" id="fechaFin"> <br>

            <input type="submit" name="accion" value="buscar">
            <input type="submit" name="accion" value="buscarNombre">
            <input type="submit" name="accion" value="buscarFecha">
            <input type="submit" name="accion" value="buscarDept">
            <input type="submit" name="accion" value="listar">                
            <br>
        </form>
        <p id="datosEmpl">
            <?php
                if (isset($result) && $result[0] > 0) {
                    echo $result[1];
                }
            ?>
        </p>            
    </body>
</html>
