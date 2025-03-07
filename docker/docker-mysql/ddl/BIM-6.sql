SHOW DATABASES;

create database AEROPUERTOS;

use AEROPUERTOS;

CREATE TABLE Paises (
    cod int PRIMARY key,
    nombre VARCHAR (30) not null,
    pasaporte char (2) CHECK (pasaporte IN ('Si', 'No'))
);

CREATE TABLE Ciudades (
    cod int,
    pais int,
    nombre VARCHAR (30),
    PRIMARY KEY (cod, pais),
    FOREIGN KEY (pais) REFERENCES Paises(cod)
);

CREATE TABLE Aeropuertos (
    cod int PRIMARY KEY,
    nombre varchar(30) not null,
    categoria char(10) not null,
    ciudad int not null,
    pais int not null,
    FOREIGN KEY (ciudad, pais) REFERENCES Ciudades(cod, pais)
);

CREATE TABLE VuelosGenericos (
    cod int PRIMARY KEY,
    hora time not null,
    tipo_avion varchar(30) not null,
    capacidad int not null,
    aerop_ori int not null,
    aerop_dest int not null,
    FOREIGN KEY (aerop_ori) REFERENCES Aeropuertos(cod),
    FOREIGN KEY (aerop_dest) REFERENCES Aeropuertos(cod)
);

CREATE TABLE VuelosConcretos(
    cod int,
    vueloGen int,
    nPasajeros int check(nPasajeros>0),
    incidencias varchar(100),
    FOREIGN KEY (vueloGen) REFERENCES VuelosGenericos(cod),
    PRIMARY KEY (cod, vueloGen)
);




show tables;
show create table Ciudades;
