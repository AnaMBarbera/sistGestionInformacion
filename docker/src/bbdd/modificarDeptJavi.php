<?php

    $id = $_GET['id'] ?? '10001';

    function conectar() {
        $host = getenv("MYSQL_HOST");
        $user = getenv("MYSQL_USER");
        $password = getenv("MYSQL_PASSWORD");
        $db = getenv("MYSQL_DB");
        try {
            $conexion = new PDO("mysql:host=$host;dbname=$db", $user, $password);
            return $conexion;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return false;
        }
    }

    function employeeData( $id ) {
        $conexion = conectar();
        $sql = "SELECT * FROM employees WHERE emp_no = :codigo";
        $stmp = $conexion->prepare($sql);
        $stmp->bindParam('codigo', $id, PDO::PARAM_INT);
        $stmp->execute();
        if ($stmp->rowCount()>0) {
            return $stmp->fetch(PDO::FETCH_ASSOC);
        }
        return false;
    }

    function departmentsList( $id ) {
        // devuelve todos los departamentos excepto en el que está $id
        $conexion = conectar();
        $sql = "SELECT * 
            FROM departments 
            WHERE NOT EXISTS (
                SELECT * 
                    FROM dept_emp 
                    WHERE emp_no = :codigo AND to_date = '9999-01-01'
                    AND departments.dept_no = dept_emp.dept_no
            )";
        $stmp = $conexion->prepare($sql);
        $stmp->bindParam('codigo', $id, PDO::PARAM_INT);
        $stmp->execute();
        if ($stmp->rowCount()>0) {
            return $stmp->fetchAll(PDO::FETCH_ASSOC);
        }
        return false;
    }

    function curEmployeeDept( $id ) {
        $conexion = conectar();
        
        $sql = "SELECT de.emp_no, de.dept_no, d.dept_name, de.from_date
            FROM dept_emp de, departments d 
            WHERE de.dept_no = d.dept_no AND de.to_date = '9999-01-01'
                 AND de.emp_no = :codigo";

        $stmp = $conexion->prepare($sql);
        $stmp->bindParam('codigo', $id, PDO::PARAM_INT);
        $stmp->execute();
        if ($stmp->rowCount()>0) {
            return $stmp->fetch(PDO::FETCH_ASSOC);
        }
        return false;
    }

    function modificarDepartamento($idEmpleado, $idDepartamento) {
        $conn = conectar();
        $sql = "CALL cambiar_departamento(:codigo, :dept)";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam("codigo", $idEmpleado, PDO::PARAM_INT);
        $stmt->bindParam("dept", $idDepartamento, PDO::PARAM_STR);
        try {
            $resultado = $stmt->execute();
        } catch (PDOException $e) {
            echo "<p> Error:". $e ."</p>";
            $resultado = false;
        }
        desconectar($conn);
        if ($resultado) {
            echo "<p>Departamento actualizado correctamente</p>";
        }
    }

    function desconectar($conexion){
        $conexion = null;
        return true;
    }

    if ($_SERVER["REQUEST_METHOD"] === "POST" ) {
        $id = $_POST['codigo'];
    }

    $empleado = employeeData($id);
    if ($empleado) {
        $codigo = $empleado['emp_no'];
        $nombre = $empleado['first_name'];
        $apellido = $empleado['last_name'];
        $fechaAlta = $empleado['hire_date'];
    }

    $depActual = curEmployeeDept($id);
    if ($depActual) {
        $deptno = $depActual['dept_no'];
        $deptname = $depActual['dept_name'];
        $deptalta = $depActual['from_date'];
    }

    $departments = departmentsList($id);

    if ($_SERVER["REQUEST_METHOD"] === "POST" ) {

        $empleado = $_POST['codigo'];
        $dept = $_POST['departamento'];
        //echo "Cambiar a $empleado al $dept";
        modificarDepartamento($empleado, $dept);
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Deparamento</title>
    <style>
        .disabled {
            display: disabled;
            color:gray;
        }
        .disabled::before {
            color:gray;
        }
    </style>
</head>
<body>
<h1>Modificar Departamento</h1>
<h2>Datos del Empleado</h2>
<label for="codigo">Código:</label>
<input type="text"  name="codigo" class="disabled" value="<?= $codigo ?? ''?>">
<label for="nombre">Nombre:</label>
<input type="text"  name="nombre" class="disabled" value="<?= $nombre ?? ''?>">
<label for="apellido">Apellidos:</label>
<input type="text"  name="apellido" class="disabled" value="<?= $apellido ?? ''?>">
<label for="fechaAlta">Fecha Alta:</label>
<input type="text"  name="fechaAlta" class="disabled" value="<?= $fechaAlta ?? ''?>">
<hr>
<h2>Departamento Actual</h2>
<label for="deptno">Código:</label>
<input type="text"  name="deptno" class="disabled" value="<?= $deptno ?? ''?>">
<label for="deptname">Nombre:</label>
<input type="text"  name="deptname" class="disabled" value="<?= $deptname ?? ''?>">
<label for="deptfrom">Desde:</label>
<input type="text"  name="deptfrom" class="disabled" value="<?= $deptalta ?? ''?>">
<hr>
<!-- Formulario para pedir código de empleado y salario -->
 <form action="" method="POST">

    <label for="departamento">Departamento: </label>    
    <select name="departamento" id="departamento" required>
        <?php foreach($departments as $departamento): ?>
        <option value="<?= $departamento['dept_no'] ?>">
            <?= $departamento['dept_name'] ?>
        </option>
        <?php endforeach; ?>
    </select>   
    <input type="number" name="codigo" hidden value="<?= $id ?? 0 ?>"><br>

    <button type="submit">Enviar</button>
 </form>
    
</body>
</html>