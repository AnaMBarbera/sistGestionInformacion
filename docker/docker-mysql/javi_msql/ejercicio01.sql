drop database colegios;
create database if not exists colegios;

use colegios;

select database();
create table if not exists colegios(
    id int primary key,
    nombre varchar(100) not null,
    direccion varchar(100) not null,
    poblacion varchar(100) not null,
    tipo varchar(10) check (tipo="publico" OR tipo="priovado") not null
);

describe colegios;

create table if not exists estudiantes(
    id int primary key,
    nombre varchar(100) not null,
    edad int not null,
    colegio int,
    foreign key (colegio) references colegios(id)
        on delete CASCADE
        on update CASCADE
);

create table if not exists profesores(
    id int primary key,
    nombre varchar(100) not null,
    asignatura varchar(100) not null,
    colegio int,
    foreign key (colegio) references colegios(id)
        on delete CASCADE
        on update CASCADE
);

create table if not exists clases(
    id int primary key,
    nombre varchar(100) not null,
    profesor int,
    colegio int,
    foreign key (profesor) references profesores(id),
    foreign KEY (colegio) references colegios(id)
);

show tables;