<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear alumno</title>
</head>

<body>
    <h2>Formulario de Alumno</h2>
    <form id="formEmpleado" method="post">
        <label for="id">ID:</label>
        <input type="text" id="id" name="id" disabled>

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="edad">Edad:</label>
        <input type="number" id="edad" name="edad" required>

        <label for="curso">Curso:</label>
        <input type="text" id="curso" name="curso" required>

        <label for="email">Fecha de Contratación:</label>
        <input type="email" id="email" name="email" required>

        <button type="button" onclick="guardarAlumno()">Guardar</button>
        <button type="button" onclick="anyadirAlumno()">Añadir nuevo</button>
    </form>
</body>

</html>