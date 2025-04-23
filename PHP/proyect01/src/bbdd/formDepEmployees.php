


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
    <h2>Nuevo Departamento</h2>
    <form action="" method="post">
        <label for="dep_no">Número : </label>
        <input type="text" id="dep_no" name="dep_no" maxlength="4" minlength="4">
        <label for="dep_name">Departamento: </label>
        <input type="text" id="dep_name" name="dep_name">        
        <input type="submit" value="Enviar">        
    </form>
</body>
</html>