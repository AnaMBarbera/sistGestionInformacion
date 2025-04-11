<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ejercicios</title>
    <style>
        .divTabla{
            display:flex
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
        margin: 20px 0; /* Espaciado superior e inferior */
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
    echo "<br><h2> tabla con bucle while </h2><br>";
    $i = 1;
    while ($i<=10){
    echo "$i x $num = ".$i*$num ."<br>";
    $i++;
    };
    echo "</div>";

    echo "<div class='ejercicio'>";
    echo "<br><h2> tabla con bucle do-while </h2><br>";
    $i = 1;
    do {
    echo "$i x $num = ".$i*$num ."<br>";
    $i++;
    } while ($i<=10);
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
        echo "<h3> Ejercicio número aleatorio </h3> ";
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
    
</body>
</html>

