<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de empleados</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Ventana modal para agregar/editar empleado -->
    <div id="modalFormulario" class="modal">
        <div class="modal-content">
            <span class="close" onclick="cerrarFormulario()">&times;</span>
            <h2>Formulario de Empleado</h2>
            <form id="formEmpleado" method="post">
                <label for="emp_id">ID:</label>
                <input type="text" id="emp_id" name="emp_id" disabled>

                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>

                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>

                <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>

                <label for="fecha_contratacion">Fecha de Contratación:</label>
                <input type="date" id="fecha_contratacion" name="fecha_contratacion" required>

                <label for="genero">Género:</label>
                <select id="genero" name="genero" required>
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                    <option value="O">Otro</option>
                </select>

                <button type="button" onclick="guardarEmpleado()">Guardar</button>
                <button type="button" onclick="cerrarFormulario()">Cancelar</button>
            </form>
        </div>
    </div>
    <h1>Administración de Empleados</h1>
        <!-- Botón para agregar nuevo empleado -->
        <button>Añadir Nuevo Empleado</button>
        <!-- Tabla de empleados -->
    <table id="empleados">
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
            <!-- Filas de empleados serán generadas aquí -->
            <?php
                $host = getenv('MYSQL_HOST'); 
                $base_de_datos   = 'employees';
                $usuario = getenv('MYSQL_USER');
                $contrasena = getenv('MYSQL_PASSWORD');
                try { 
                    $conexion = new PDO("mysql:host=$host;dbname=$base_de_datos", $usuario, $contrasena);
                    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                    // Consulta para obtener todos los empleados
                    $query = "SELECT emp_no, first_name, last_name, birth_date, hire_date, gender FROM employees LIMIT 10";
                    $stmt = $conexion->query($query);

                    if ($stmt->rowCount() > 0) {
                        while ($empleado = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<tr data-id= '". $empleado['emp_no']."'>";
                            echo "<td>" . $empleado['emp_no'] . "</td>";
                            echo "<td>" . $empleado['first_name'] . "</td>";
                            echo "<td>" . $empleado['last_name'] . "</td>";
                            echo "<td>" . $empleado['birth_date'] . "</td>";
                            echo "<td>" . $empleado['hire_date'] . "</td>";
                            echo "<td>" . $empleado['gender'] . "</td>";
                            echo "<td>
                                    <button onclick='editarEmpleado(" . $empleado['emp_no'] . ")'>Editar</button>
                                    <button onclick='eliminarEmpleado(" . $empleado['emp_no'] . ")'>Eliminar</button>
                                </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7'>No hay empleados para mostrar.</td></tr>";
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