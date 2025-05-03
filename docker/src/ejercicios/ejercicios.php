<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ejercicios</title>
    <style>
        .divTabla, #tabla2{
            display:flex;            
        }
        h1{
            text-align: center;
        }
        .ejercicio {
            width: 50%; /* Ancho del recuadro (puedes ajustar este valor) */
            margin: 20px auto; /* Centra el div horizontalmente y agrega margen superior/inferior */
            padding: 20px; /* Espaciado dentro del div */
            border: 2px solid #4CAF50; /* Borde verde */
            border-radius: 10px; /* Bordes redondeados */
            background-color: #f9f9f9; /* Fondo blanco suave */
            text-align: center; /* Centra el texto dentro del div */
            font-family: Arial, sans-serif; /* Fuente para el texto */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra suave alrededor del div */
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
        echo "<h1> Ejercicios con bucles, tablas y funciones </h1>";
        /**
         * Ejercicio 1
         * Crea una constante NUMERO 
         * Muestra la tabla de multiplicar de ese número
         * Con FOR, con WHILE y con DO WHILE
         */
        echo "<div class='divTabla'>";
        echo "<div class='ejercicio'>";
        echo "<h2> tabla con bucle for </h2>";
        $num = 7;
        echo "<table>";
        echo "<tr>";
        echo "<th> Num </th> <th> Multiplicacion </th> <th>Resultado</th>";
        for ($i = 1; $i <= 10; $i++) { 
        echo "<tr>";   
            echo "<td>" .$i ."</td>". "<td>" .$i ." X ".$num ." = </td><td>".$i*$num ."</td>";
        };
        echo "</table>";
        echo "</div>";

        echo "<div class='ejercicio'>";
        echo "<h2> tabla con bucle while </h2>";
        $i = 1;
        echo "<table id='while'>";
        echo "<tr>";
        echo "<th> Num </th> <th> Multiplicacion </th> <th>Resultado</th>";
        while ($i<=10){
            echo "<tr>";   
            echo "<td>" .$i ."</td>". "<td>" .$i ." X ".$num ." = </td><td>".$i*$num ."</td>";
        $i++;
        };
        echo "</table>";
        echo "</div>";

        echo "<div class='ejercicio'>";
        echo "<h2> tabla con bucle do-while </h2>";
        $i = 1;
        echo "<table id='dowhile'>";
        echo "<tr>";
        echo "<th> Num </th> <th> Multiplicacion </th> <th>Resultado</th>";
        do {
        echo "<tr>";   
        echo "<td>" .$i ."</td>". "<td>" .$i ." X ".$num ." = </td><td>".$i*$num ."</td>";
        $i++;
        } while ($i<=10);
        echo "</table>";
        echo "</div>";
        echo "</div>";


        /**
        * Ejercicio 2
        * Crea una función de devuelva un número alatorio entre 1 y 50
        * Obten un número generado por la función
        * muestra el número e indica:
        * El número, si es par o impar, si pasa o falta
        * (falta si es menor que la mitad (en este caso 25), sobra si pasa)
        */

        function generar_numero() {
            return rand(1, 50);
        }
        // Función para analizar el número generado
        function analizar_numero($numero) {
            // Verificar si el número es par o impar
            $tipo = ($numero % 2 == 0) ? 'par' : 'impar';
            // Verificar si el número pasa o falta
            $estado = ($numero < 25) ? 'falta' : 'sobra';
            // Mostrar el resultado
            echo "<div class='ejercicio'>";
            echo "<h2> Ejercicio número aleatorio </h3> ";
            echo "El número generado es: $numero<br>";
            echo "Es un número $tipo y $estado (menos de 25 es falta, más de 25 es sobra).<br>";
            echo "</div>";
        }
        echo "<br>";
        // Generar un número aleatorio
        $numero_generado = generar_numero();
        // Analizar el número
        analizar_numero($numero_generado);
    ?>  
    <h2 style="text-align:center">Nueva sintaxis (php en html)</h2>
    <div id="tabla2">
        <?php
                $tabla = [
                    [1, "Manzanas", "10"],
                    [2, "Peras", "10"],
                    [3, "Uva", "10"]
                ];
            ?>
            <table style="border: 1px solid black;">
                <tr>
                    <th>Id</th>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
                <?php foreach($tabla as $linea): ?>
                    <tr>
                        <td><?= $linea[0]?></td>
                        <td><?= $linea[1]?></td>
                        <td><?= $linea[2]?></td>
                    </tr>
                    <?php endforeach; ?>
            </table>

        
        <table style="border: 1px solid black;">
            <tr>
                <th>Num</th>
                <th>Multiplicacion</th>
                <th>Resultado</th>
            </tr>
        <?php
        $num = 7;
        ?>
            <?php for ($i = 1; $i <= 10; $i++): ?>            
                <tr>
                    <td><?= "{$i}" ?></td>
                    <td><?= "$i  X $num"?></td>
                    <td><?= $i*$num?></td>
                </tr>
                <?php endfor ?>
        </table>
    </div>   
</body>
</html>

