<?php
    $productos = [
        ["Producto 1", 15, "Este es el producto 1, muy popular."],
        ["Producto 2", 10, "Producto 2, ideal para uso diario."],
        ["Producto 3", 20, "Producto 3, calidad superior."]
    ];
    echo "<ul>";
    foreach ($productos as $producto) {
        echo "<li><strong>" . $producto[0] . "</strong> - $" . $producto[1] . "<br>" . $producto[2] . "</li>";
    }
    echo "</ul>";
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            
            h1{
                text-align: center;
            }      

            table {
                /*width: 100%; 
                border-collapse: collapse; /* Elimina los espacios entre celdas */
                margin: 20px auto; /* Espaciado superior e inferior */
                font-family: Arial, sans-serif; /* Tipografía */
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Sombra suave */        
            }
            
            /* Estilo para las cabeceras de la tabla */
            th {
                background-color: #4CAF50; /* Color de fondo verde */
                color: white; /* Color del texto */
                padding: 12px 15px; /* Espaciado interno */
                text-align: left; /* Alineación del texto */
                font-size: 16px; /* Tamaño de la fuente */
            }
            #while th{
                background-color:rgb(185, 108, 31);
            }
            #dowhile th{
                background-color:rgb(49, 31, 185);
            }
            /* Estilo para las celdas */
            td {
                padding: 12px 15px; /* Espaciado interno */
                text-align: center; /* Alineación del texto */
                border-bottom: 1px solid #ddd; /* Línea sutil entre filas */
            }
            /* Estilo para las filas alternas */
            tr:nth-child(even) {
                background-color: #f2f2f2; /* Color de fondo gris claro para filas pares */
            }
            /* Efecto al pasar el ratón sobre una fila */
            tr:hover {
                background-color: #ddd; /* Color de fondo gris oscuro cuando se pasa el ratón */
            }
            /* Estilo para la tabla cuando no hay bordes alrededor de las celdas */
            table, th, td {
                border: 1px solid #ddd; /* Línea sutil alrededor de la tabla y celdas */
            }
            /* Estilo para las celdas en la primera columna */
            td:first-child {
                font-weight: bold; /* Negrita para la primera columna */
            }
        </style>
    </head>

    <body>
        <?php
            $productos = [
                ["Producto 1", "15.00 €", "Este es el producto 1, muy popular."],
                ["Producto 2", "10.00 €", "Producto 2, ideal para uso diario."],
                ["Producto 3", "20.00 €", "Producto 3, calidad superior."]
            ];
        ?>
        <table>
            <tr>
            <th> Producto </th>
            <th> Precio </th>
            <th> Descripcion</th>
            </tr>
            <?php
                foreach ($productos as $producto) {
                    echo "<tr>";
                    foreach ($producto as $campo) {
                        echo "<td>" . $campo . "</td>";
                    }
                    echo "</tr>";
                }   
            ?>            
        </table>
    </body>
</html>