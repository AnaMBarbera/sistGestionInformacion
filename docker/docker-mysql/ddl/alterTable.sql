CREATE DATABASE TEMP;
USE TEMP;
SHOW DATABASES;

CREATE TABLE Temporal(
    id int primary key,
    nombre varchar(30),
    edad int
);

CREATE TABLE Poblaciones(
    id int primary key,
    nombre varchar(30)    
);

ALTER TABLE Personas CHANGE poblacion poblacion int;
ALTER TABLE Personas ADD FOREIGN KEY (poblacion) REFERENCES Poblaciones(id);

ALTER TABLE Temporal RENAME  to Personas;
ALTER TABLE Personas ADD poblacion VARCHAR(50) NOT NULL;
 -- la palabra COLUMN ES OPCIONAL
 -- ALTER TABLE Personas ADD COLUMN poblacion VARCHAR(50) NOT NULL;

 ALTER TABLE Personas ADD DNI VARCHAR(9) NOT NULL FIRST;
ALTER TABLE Personas ADD apellidos VARCHAR(50) NOT NULL AFTER nombre;
ALTER TABLE Personas CHANGE DNI DNI VARCHAR(9) NOT NULL UNIQUE FIRST;
-- cambia el campo con toda su definición
ALTER TABLE Personas ADD UNIQUE(DNI);
-- añade sólo el tipo UNIQUE respetando el resto de tipos

ALTER TABLE Personas CHANGE apellidos apellido1 VARCHAR(50) NOT NULL AFTER nombre;

