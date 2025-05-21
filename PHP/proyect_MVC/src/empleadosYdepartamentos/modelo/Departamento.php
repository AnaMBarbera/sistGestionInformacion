<?php
//include __DIR__."/../utils/verificarAcceso.php";
//para no perder la ruta se escribe __DIR__
include __DIR__."/../utils/db.php";

    class Departamento{
        private $conexion;
        public function __construct(){
            $this -> conexion = dbConnection::obtenerConexion();
        }

        public function obtenerTotalDepartamentos($busqueda):int{
            $where = "";
            if ($busqueda !== "")
            $where = " AND (dept_no like :busqueda 
                        OR dept_name like :busqueda)" ;
    
            $query = "SELECT count(*) as total 
                        FROM departments
                        WHERE 1 $where";
    
            $busqueda = "%$busqueda%";
            $stmt = $this->conexion->prepare($query);
            if ($where !="") $stmt->bindParam("busqueda", $busqueda, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC)['total'];          
    
        }
        //utilizamos 2 parámetros para la paginación
        public function obtenerDepartamentos($pagina = 1, $elementos = 10,
        $ordenarPor = 'emp_no',
        $orden = 'asc',
        $busqueda=''): array {
            $offset=($pagina-1)*$elementos;
            $where = "";
            if ($busqueda !== "")
                $where = " AND (dept_no like :busqueda 
                OR dept_name like :busqueda)" ;

            $query = "SELECT *
                     FROM departments
                     WHERE 1 $where
                     ORDER BY dept_no 
                     DESC LIMIT :limit 
                     OFFSET :offset";

            $busqueda = "%$busqueda%";

            $stmt = $this ->conexion->prepare($query);
            $stmt -> bindParam("offset", $offset, PDO::PARAM_INT);
            $stmt -> bindParam("limit", $elementos, PDO::PARAM_INT);
            if ($where !="") $stmt->bindParam("busqueda", $busqueda, PDO::PARAM_STR);
            $stmt->execute();

            return $stmt ->fetchAll(PDO::FETCH_ASSOC);
        }

        // **Calcular el siguiente ID del departamento** hay que extraer la parte numérica, convertirla a entero, obtener el valor máximo y luego volver a formatear el ID.
        public function getNewId(){
            $query = "SELECT MAX(CAST(SUBSTRING(dept_no, 2) AS UNSIGNED)) AS max_dept_num FROM departments";
            $stmt = $this->conexion->prepare($query);
            $stmt -> execute();            
            $count= $stmt->fetchColumn();
            //aquí sumamos 1 a la parte númerica
            $nextNum = $count ? $count + 1 : 1;
            //aquí añadimos la parte númerica al carácter "d"
            $id = 'd' . str_pad($nextNum, 3, '0', STR_PAD_LEFT);
            return $id;
        }

         // Crear un nuevo departamento
        public function crearDepartamento($nombre) {
            $query = "INSERT INTO departments (dept_no, dept_name) 
                VALUES (:id, :nombre)";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue(':id', $this->getnewId(), PDO::PARAM_STR);
            $stmt->bindValue(':nombre', $nombre, PDO::PARAM_STR);
            return $stmt->execute();
        }

        public function obtenerDepartamento($id){
            $query = "SELECT * FROM departments WHERE dept_no = :id";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue('id', $id, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }

        // Actualizar un empleado
        public function actualizarDepartamento($dept_id, $nombre) {
            $query = "UPDATE departments 
                    SET dept_name = :nombre
                    WHERE dept_no = :dept_id";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue(':dept_id', $dept_id, PDO::PARAM_STR);
            $stmt->bindValue(':nombre', $nombre, PDO::PARAM_STR);
            return $stmt->execute();
        }

        // Eliminar un departamento
        public function eliminarDepartamento($dept_id) {
            $query = "DELETE FROM departments WHERE dept_no = :dept_id";
            $stmt = $this->conexion->prepare($query);
            $stmt->bindValue(':dept_id', $dept_id, PDO::PARAM_STR);
            return $stmt->execute();
        }
    }
?>