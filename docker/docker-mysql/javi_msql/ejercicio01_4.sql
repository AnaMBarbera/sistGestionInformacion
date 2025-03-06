-- drop database if exists juegos;
create database if not exists juegos;

use juegos;

create table usuarios(
    id int primary key,
    nombre varchar(50) not null,
    email varchar(50) not null,
    edad int not null check (edad >= 18 AND edad <= 100)
);

create table juegos(
    id int primary key,
    nombre varchar(50) not null,
    categoria varchar(50) not null
);

create table compras (
    id int primary key,
    id_usuario int not null,
    id_juego int not null,
    fecha_compra date not null,
    foreign key (id_usuario) references usuarios(id),
    foreign key (id_juego) references juegos(id)
);

create table progreso (
    id int primary key,
    id_usuario int not null,
    id_juego int not null,
    nivel int not null check (nivel >= 0 AND nivel <= 100),
    foreign key (id_usuario) references usuarios(id),
    foreign key (id_juego) references juegos(id)
);





