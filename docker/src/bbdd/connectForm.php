<?php
    $error = "";

    function conectarMySQli($host, $user, $password, $db) {
        $conexion = mysqli_connect($host, $user, $password, $db);
        if (!$conexion) {
            global $error;
            $error = mysqli_connect_error();
            return false;
        } else {
            mysqli_close($conexion);
            return true;
        }
    }

    function conectarMySQLio($host, $user, $password, $db){
        $conexion = new mysqli($host, $user, $password, $db);
        if ($conexion->connect_error) {
            global $error;
            $error = $conexion->connect_error;
            return false;
        }
            else {
                $conexion->close();
                return true;
            }
    }

    function conectarMySQLPDO($host, $user, $password, $db) {
        try {
            $conexion = new PDO("mysql:host=$host;dbname=$db", $user, $password);
            $conexion = null;
            return true;
        } catch (PDOException $e) {
            global $error;
            $error = $e->getMessage();
            return false;
        }
    }

    // si el usuario ha rellenado el formulario...
    if (isset($_POST["host"])) {
        $HOST = $_POST["host"];
        $USER = $_POST["user"];
        $PASS = $_POST["password"];
        $DB = $_POST["database"];
        $DRIVER = $_POST["driver"];
        switch ($DRIVER) {
            case "pdo":
                $exito = conectarMySQLPDO($HOST, $USER, $PASS, $DB);
                break;
            case "mysqlip":
                $exito = conectarMySQli($HOST, $USER, $PASS, $DB);
                break;
            case "mysqlio":
                $exito = conectarMySQLio($HOST, $USER, $PASS, $DB);
                break;
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario Conexión</title>
    <style>
        label {
            display:block;
            font-weight: bold;
            padding: 0px 10px;
        }
        input, select {
            display: block;
            width: 300px;
            background-color: bisque;
        }

        input:focus, select:focus {
            background-color: cadetblue;
            color: white;
        }
        button {
            margin: 10px;
            text-align: center;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1>Conexión a la base de datos</h1>
    <?php if(isset($exito) && $exito): ?>
        <h2>Conexión establecida con éxito</h2>
    <?php endif; ?>
    <div id="errores">
        <?php if(isset($exito) &&  !$exito): ?>
            <h2>Conexión no establecida</h2>
            <p><?= $error ?></p>
        <?php endif; ?>
    </div>
    <form action="" method="POST">
        <label for="host">Host:</label>
        <input type="text" id="host" name="host" maxlength="30" required
            value = <?= $HOST ?? ""?>>
        <label for="user">User:</label>
        <input type="text" id="user" name="user" maxlength="10" required
            value = <?= $USER ?? ""?>>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" maxlength="10" required
            value = <?= $PASS ?? ""?>>
        <label for="database">Database</label>
        <input type="text" id="database" name="database" maxlength="10" required
            value = <?= $DB ?? ""?>>
        <label for="driver">Driver:</label>
      
        <select name="driver" id="driver">
            <option name="driver"  value="pdo" <?= (($DRIVER ?? "" )== 'pdo') ? 'selected' : '' ?>>PDO</option>
            <option name="driver"  value="mysqlip" <?= (($DRIVER  ?? "") == 'mysqlip') ? 'selected' : '' ?>>MySQLi procedimental</option>
            <option name="driver"  value="mysqlio"<?= (($DRIVER ?? "" )== 'mysqlio') ? 'selected' : '' ?>>MySQLi Orientado Objetos</option>
        </select>
        <button type="submit">Conectar</button>
    </form>
</body>
</html>