create database CULTIVOS;
use CULTIVOS;

create table Cultivos (
    cod char(3) primary key,
    nombre varchar (30) NOT NULL    
);

create table Paises (
    cod char(3) primary key,
    nombre varchar(30) not null,
    continente varchar (50) NOT NULL    
);

create table Provincias (
    cod char(3),
    nombre varchar (50) NOT NULL,
    n_hab int,
    pais char(3),
    PRIMARY KEY (cod, pais),
    Foreign Key (pais) REFERENCES Paises(cod)
);

create table Comarcas (
    cod char(5) primary key,
    nombre varchar (30) NOT NULL,
    provincia char(3) NOT NULL,  
    pais char(3) NOT NULL,
    Foreign Key (provincia, pais) REFERENCES Provincias(cod, pais)
);

create table cultivar(
    cultivo char(3),
    comarca char(5),
    PRIMARY KEY (cultivo, comarca),
    FOREIGN KEY (cultivo) REFERENCES Cultivos (cod),
    FOREIGN KEY (comarca) REFERENCES Comarcas (cod)
)

INSERT INTO Cultivos (cod, nombre) VALUES ("ARR", "Arroz");
INSERT INTO Paises VALUES ("ESP", "España", "Europa");

INSERT INTO Provincias VALUES
("VAL", "Valencia", 1000000, "ESP"),
("ALI", "Alicante", 700000, "ESP"),
("CAS", "Castellon", 500000, "ESP"),
("MAD", "Madrid", 2000000, "ESP");

INSERT INTO Comarcas VALUES ("RB", "Ribera Baixa", "VAL", "ESP");

SELECT * FROM `Provincias`;
--PARA VER TODAS LAS COLUMNAS

--Para borrar registros
-- Ejemplo
DELETE FROM alumnos
   WHERE codigo = 25; -- campo y valor

--en modo seguro sólo se puede borrar de uno a un registro
SET SQL_SAFE_UPDATES=0;

--Modificar datos (UPDATE)
UPDATE alumnos
  SET calle = “Sequial”,
    número = 31,
    pueblo = 56410
  WHERE código = 25;

  -------------------------------------------

  DELETE FROM `Provincias` WHERE nombre = "Madrid";
UPDATE `Provincias`
SET n_hab= n_hab + (n_hab*0.10)
WHERE n_hab IS NOT NULL;
-- es posible omitir ese where

UPDATE `Comarcas` set nombre =  CONCAT ('La ', nombre)
WHERE cod = "RB";

UPDATE `Comarcas` set nombre =  "Ribera Baixa"
WHERE cod = "RB";