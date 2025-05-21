<?php
    //include __DIR__."/../utils/verificarAcceso.php";
    include __DIR__."/../controlador/DepartamentoControlador.php";

  //  $controlador = new DepartamentoControlador();
  //  $departamentos = $controlador->verDepartamentos();

?>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Departamentos</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
    <nav>
        <ul>
            <li><a href="index.php?accion=inicio">Inicio</a></li>

            <?php if (isset($_SESSION['usuario'])): ?>
            <li><a href="index.php?accion=ver_empleados">Empleados</a></li>
            <!--<li><a href="index.php?accion=ver_departamentos">Departamentos</a></li>-->
            <li><a href="vista\departamentos.php">Departamentos</a></li>
            <?php endif;?>
            
            <li><a href="index.php?accion=contacto">Contacto</a></li>
            
            <!-- Si el usuario no está logueado, mostramos el enlace al login -->
            <?php if (!isset($_SESSION['usuario'])): ?>
                <li><a href="index.php?accion=login">Login</a></li>
            <?php else: ?>
                <li><a href="index.php?accion=logout">Cerrar sesión</a></li>
            <?php endif; ?>
        </ul>
    </nav>
    <!-- Busqueda -->
    <div id="busqueda">
        <h2>Buscar departamentos</h2>
        <form method="GET" action="index.php" > 
            <input name="busqueda" type="text" placeholder="buscar por id o nombre" value="<?= $busqueda?>"/>
            <input type="text" name="accion" value="ver_departamentos" hidden >            
            <button type="submit">Buscar</button>
        </form>
    </div>
        <h1>Lista de Departamentos</h1>
        <table>
            <thead>
                <tr>
                    <th>
                        <a href="/index.php?accion=ver_departamentos&ordenarPor=dept_no&orden=asc">+</a>
                        ID
                        <a href="/index.php?accion=ver_departamentos&ordenarPor=dept_no&orden=desc">-</a>
                    </th>
                    <th>
                        <a href="/index.php?accion=ver_departamentos&ordenarPor=dept_name&orden=asc">+</a>
                        Nombre
                        <a href="/index.php?accion=ver_departamentos&ordenarPor=dept_name&orden=desc">+</a>
                    </th>                   
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($departamentos as $departamento): ?>
                <tr>
                    <td><?= $departamento['dept_no'] ?></td>
                    <td><?= $departamento['dept_name'] ?></td>                    
                    <td>
                    <a href="/index.php?accion=editar_departamento&id=<?= $departamento['dept_no'] ?>&pagina=<?= $pagina ?>">Editar</a>

                        <!-- tenemos que encerrar el parámetro en '' para que el script lo recoja correctamente al no ser numérico -->
                        <button onclick="eliminarDepartamento('<?= $departamento['dept_no']?>');" >Eliminar</button>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
        <div style="max-width: 800px; margin: 0 auto;">
            <a href="./index.php?accion=nuevo_departamento&pagina=<?=($pagina)?>">Agregar Nuevo Departamento</a>
        </div>
        <!--Paginacion -->
        <div id="paginacion">
                <a href="/index.php?accion=ver_departamentos&pagina=1">Pag.1</a>
                <a href="/index.php?accion=ver_departamentoss&pagina=<?=($pagina>1) ? $pagina -1 : 1 ?>">Anterior</a>
                <span><?= $pagina ?> de <?= $totalPaginas ?></span>
                <a href="/index.php?accion=ver_departamentos&pagina=<?=($pagina<$totalPaginas) ? $pagina +1 : $totalPaginas ?>">Siguiente</a>
                <a href="/index.php?accion=ver_departamentos&pagina=<?=$totalPaginas ?> ">última</a>
        </div>

        <script>
            function eliminarDepartamento(dept_no) {
                if (confirm('¿Estás seguro de que deseas eliminar este departamento?')) {
                    window.location.href = `departamentosForm.php?id=${dept_no}&action=delete`;
                }
            }
        </script>
    </body>
</html>