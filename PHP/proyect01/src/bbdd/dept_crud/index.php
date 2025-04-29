<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración de departamentos</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Ventana modal para agregar/editar departamento -->
    <div id="modalFormulario" class="modal">
        <div class="modal-content">
            <span class="close" onclick="cerrarFormulario()">&times;</span>
            <h2>Formulario de Departamento</h2>
            <form id="formDepartamento" method="post">
                <label for="dept_id">ID:</label>
                <input type="text" id="dept_id" name="dept_id" disabled>
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>                

                <button type="button" onclick="guardarDepartamento()">Guardar</button>
                <button type="button" onclick="cerrarFormulario()">Cancelar</button>
            </form>
        </div>
    </div>
    <h1>Administración de Departamentos</h1>
        <!-- Botón para agregar nuevo departamento -->
        <button>Añadir Nuevo Departamento</button>
        <!-- Tabla de departamentos -->
    <table id="departamentos">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>                
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <!-- Filas de departamentos serán generadas aquí -->
            <?php
                $host = getenv('MYSQL_HOST'); 
                $base_de_datos   = 'employees';
                $usuario = getenv('MYSQL_USER');
                $contrasena = getenv('MYSQL_PASSWORD');
                try { 
                    $conexion = new PDO("mysql:host=$host;dbname=$base_de_datos", $usuario, $contrasena);
                    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                    // Consulta para obtener todos los departamentos
                    $query = "SELECT dept_no, dept_name FROM departments LIMIT 10";
                    $stmt = $conexion->query($query);

                    if ($stmt->rowCount() > 0) {
                        while ($departamento = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<tr data-id= '". $departamento['dept_no']."'>";
                            echo "<td>" . $departamento['dept_no'] . "</td>"; 
                            echo "<td>" . $departamento['dept_name'] . "</td>";                           //añadimos \" al parámetro porque es un string 
                            echo "<td>
                                    <button onclick='editarDepartamento(\"". $departamento['dept_no'] . "\")'>Editar</button>
                                    <button onclick='eliminarDepartamento(\"" . $departamento['dept_no'] . "\")'>Eliminar</button>
                                </td>";
                            echo "</tr>";
                        }
                    } else {
                        echo "<tr><td colspan='7'>No hay departamentos para mostrar.</td></tr>";
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