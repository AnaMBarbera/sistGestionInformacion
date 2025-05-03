<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla php</title>
</head>
<body>
    <h1>Tabla php</h1>
    <?php
        $nombre = "Javier";
        $apellido = "Beteta";
        $poblacion = "Cullera";
        $rol = "Profesor";

        echo "<table border='1'>";
        echo "<tr>";
        echo "<td> Nombre </td>";
        echo "<td> $nombre </td>";
        echo "<tr>";
        echo "<td> Apellidos </td>";
        echo "<td> $apellido </td>";
        echo "<tr>";
        echo "<td> Poblacion </td>";
        echo "<td> $poblacion </td>";
        echo "<tr>";
        echo "<td> Rol </td>";
        echo "<td> $rol </td>";
    // si cerramos las "" tenemos que concatenar con un punto
    // echo "<th>" . $titulo . "</th>";
    // si queremos ver $rol como texto y no el valor de la variable
    //echo "<td> \$rol </td>";
    ?>
    
</body>
</html>






