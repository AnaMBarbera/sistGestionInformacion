create database JUEGOS;
use JUEGOS;

create table Usuarios (
    id int primary key,
    nombre varchar(50),
    email varchar(30),
    edad int
);

create table Juegos (
    id int primary key,
    nombre varchar(50),
    categoria varchar(30)
);

create table Compras (
    id int primary key,
    usuario int,
    juego int,
    fechaCompra date,
    Foreign Key (usuario) REFERENCES Usuarios(id),
    Foreign Key (juego) REFERENCES Juegos(id)
);

create table Progreso (
    id int primary key,
    usuario int,
    juego int,
    nivel int,
    Foreign Key (usuario) REFERENCES Usuarios(id),
    Foreign Key (juego) REFERENCES Juegos(id)
);

show tables;