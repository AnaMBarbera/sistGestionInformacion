<?php  
    //Para el formulario de acceso
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        //Para el formulario de contacto
        $usuario = $_POST['usuario'];
        $contrasena = $_POST['contrasena'];            
        // Validación
        if (empty($usuario)) {
            echo "El usuario es obligatorio.";
            }  elseif (strlen($contrasena) < 6) {
                echo "<span style='color:red'>La contraseña debe tener al menos 6 caracteres.</span>";
            } else {
                echo "<span style='color:green'>Formulario enviado correctamente.</span>";
            }
    }   

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de contacto</title>
    <style>
         h2{
            text-align: center;
         }
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
        input[type="number"], input[type="email"] {
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
    <h2>Formulario de acceso</h2>
    <form action="acceso.php" method="post">
        <label for="usuario">Usuario: </label>
        <input type="text" id="usuario" name="usuario">
        <label for="contrasena">Contraseña: </label>
        <input type="text" id="contrasena" name="contrasena">        
        <input type="submit" value="Enviar">        
    </form>
</body>
</html>