<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formularios</title>
    <style>
                /* Estilos generales para el formulario */
        form {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px 30px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);            
        }

        /* Estilos para las etiquetas */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        /* Estilos para los inputs */
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #bbb;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;            
        }

        /* Estilos para el botón */
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
    <?php
    echo "<form action='procesar.php' method='POST'>";
    echo "<label for='nombre'>Nombre:</label><input type='text' id='nombre' name='nombre'><br>";
    echo "<label for='edad'>Edad:</label><input type='number' id='edad' name='edad'><br>";
    echo "<input type='submit' value='Enviar'>";
    echo "</form>";
    ?>

    <?php
    $paises = ["España", "Francia", "Italia"];
    echo "<form action='procesar.php' method='POST'>";
    echo "<label for='pais'>País:</label><select name='pais'>";
    foreach ($paises as $pais) {
        echo "<option value='$pais'>$pais</option>"; // Creamos las opciones del select
    }
    echo "</select><br><br>";
    echo "<input type='submit' value='Enviar'>";
    echo "</form>";
    ?>

    <!-- Ejemplo de formulario usando el método GET -->

    <?php
        if( !isset($_GET["number"])) {
            echo "<h1 style='text-align:center'> Formulario de datos <h1>";
        } else {
            echo "<h1 style='text-align:center'> Tratamiento de datos <h1>";
            //die();
        }
    ?>   
    
    <form id="formulario" action="formularios.php" method="get">
        <label for="number">Número:</label>
        <input type="number" id="numero" name="number">
        <input type="submit" value="Enviar">
    </form>



    <!-- Ejemplo de formulario usando el método POST -->
    <?php
        if( !isset($_POST["email"])) {
            echo "<h1 style='text-align:center'> Formulario de datos <h1>";
        } else {
            echo "<h1 style='text-align:center'> Tratamiento de datos <h1>";
            //die();
        }
    ?>

    <form action="formularios.php" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email">
        <input type="submit" value="Enviar">
    </form>
</body>
</html>