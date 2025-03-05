create database COLEGIOS;
use COLEGIOS;

create table colegios (
    id int primary key,
    nombre varchar (50) NOT NULL,
    direccion varchar (100),
    tipo varchar (10)
);

create table estudiantes (
    id int primary key,
    nombre varchar (50) NOT NULL,
    edad int,
    colegio int,
    FOREIGN KEY (colegio) REFERENCES colegios(id) 
);

create table profesores (
    id int primary key,
    nombre varchar (50) NOT NULL,
    asignatura varchar (50),
    colegio int,
    FOREIGN KEY (colegio) REFERENCES colegios(id) 
);

create table clases (
    id int primary key,
    nombre varchar (50) NOT NULL,
    profesor int,
    colegio int,
    FOREIGN KEY (colegio) REFERENCES colegios(id),
    FOREIGN KEY (profesor) REFERENCES profesores(id) 
);

ALTER TABLE colegios CHANGE COLUMN direccion ubicacion VARCHAR(100);
ALTER TABLE colegios ADD COLUMN fecha_fundacion DATE;
ALTER TABLE estudiantes CHANGE COLUMN edad edad FLOAT;
show create table colegios;
show create table estudiantes;
show TABLES

SHOW DATABASES;