<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de alumnos</title>
</head>
<body>
    <h1>Administración de Empleados</h1>
        <!-- Botón para agregar nuevo empleado -->
        <button onclick='mostrarFormulario();'>Añadir Nuevo Empleado</button>
        <!-- Tabla de empleados -->
    <table id="alumnos">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Fecha de Nacimiento</th>
                <th>Fecha de Contratación</th>
                <th>Género</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <!-- Filas de alumnos serán generadas aquí -->
            <?php
                $host = getenv('MYSQL_HOST'); 
                $base_de_datos   = 'escuela';
                $usuario = getenv('MYSQL_USER');
                $contrasena = getenv('MYSQL_PASSWORD');
                try { 
                    $conexion = new PDO("mysql:host=$host;dbname=$base_de_datos", $usuario, $contrasena);
                    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                    // Consulta para obtener todos los alumnos
                    $query = "SELECT id, nombre, edad, curso, email FROM escuela";
                    $stmt = $conexion->query($query);

                    if ($stmt->rowCount() > 0) {
                        while ($alumno = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<tr data-id= '". $alumno['id']."'>";
                            echo "<td>" . $alumno['id'] . "</td>";
                            echo "<td>" . $alumno['nombre'] . "</td>";
                            echo "<td>" . $alumno['edad'] . "</td>";
                            echo "<td>" . $alumno['curso'] . "</td>";
                            echo "<td>" . $alumno['email'] . "</td>";                           
                            echo "<td>
                                    <button onclick='editarEmpleado(".$alumno['id'] . ")'>Editar</button>
                                    <button onclick='eliminarEmpleado(".$alumno['id'] . ")'>Eliminar</button>
                                </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7'>No hay alumnos para mostrar.</td></tr>";
                    }

                } catch (PDOException $e) {
                    echo "Error: " . $e->getMessage();
                }
            $conexion = null;
            ?>
        </tbody>
    </table>
    <script src="scripts.js"></script>
</body>
</html>