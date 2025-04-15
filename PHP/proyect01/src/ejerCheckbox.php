<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {        
            background-color: #f4f6f8;
            color: #333;
            margin: 40px;
            font-size: 18px
        }

        form {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
        }

        input[type="checkbox"] {
            margin-right: 10px;
            transform: scale(1.2);
            cursor: pointer;
        }

        input[type="submit"] {
            margin-top: 15px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        h3 {
            margin-top: 30px;
            color: #007BFF;
        }       
    </style>
</head>
<body>
    <?php
        $categorias = ["Tecnología", "Salud", "Deportes", "Cultura"];
    ?>
    <form action="ejerCheckbox.php" method="post">
        <?php
            foreach ($categorias as $categoria) {
                echo "<input type='checkbox' name='categorias[]' value='$categoria'>$categoria<br>";
            }
        ?>
        <input type='submit' value='Seleccionar categorías'>        
    </form>
    <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $seleccionadas = $_POST['categorias'];
            echo "<h3>Categorías seleccionadas:</h3>
                    <ul>";
                        foreach ($seleccionadas as $categoria) {
                            echo "<li>$categoria</li>";
                        }
            echo "</ul>";
        }
    ?>
</body>
</html>
