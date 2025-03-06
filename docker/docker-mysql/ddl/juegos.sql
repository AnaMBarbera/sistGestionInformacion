create database JUEGOS;
DROP DATABASE JUEGOS;

use JUEGOS;

create table Usuarios (
    id int primary key,
    nombre varchar(50) NOT NULL,
    email varchar(30) NOT NULL,
    edad int NOT NULL CHECK (edad >= 18 and edad<=100)
);

create table Juegos (
    id int primary key,
    nombre varchar(50) not null,
    categoria varchar(30) not null
);

create table Compras (
    id int primary key,
    usuario int not null,
    juego int not null,
    fechaCompra date not null,
    Foreign Key (usuario) REFERENCES Usuarios(id),
    Foreign Key (juego) REFERENCES Juegos(id)
);

create table Progreso (
    id int primary key,
    usuario int,
    juego int,
    nivel int NOT NULL CHECK (nivel >= 0 AND nivel <=100),
    Foreign Key (usuario) REFERENCES Usuarios(id),
    Foreign Key (juego) REFERENCES Juegos(id)
);

show tables;