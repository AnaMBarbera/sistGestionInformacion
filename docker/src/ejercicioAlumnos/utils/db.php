<?php

    define('DB_HOST_NAME', getenv('MYSQL_HOST') ?? 'localhost');
    define ('DB_NAME', 'escuela');
    define ('DB_USER', getenv('MYSQL_USER') ?? 'root');
    define ('DB_PASSWORD', getenv('MYSQL_PASSWORD'));

    class dbConnection{
        private static $instance;
        private $conexion;

        private function __construct(){
            try{
                $conn="mysql:host=".DB_HOST_NAME.";dbname=".DB_NAME;                
                $this->conexion = new PDO($conn, DB_USER, DB_PASSWORD);                  
                $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            }catch (PDOException $e) {
                $this->conexion = null;
                echo "DB Error -> " . $e->getCode() . "->".$e->getMessage();
            }
        }
        public static function obtenerConexion():PDO {
            if (self::$instance == null){
                self::$instance = new dbConnection();
            }
            return self::$instance->conexion;
        }

    }
?>