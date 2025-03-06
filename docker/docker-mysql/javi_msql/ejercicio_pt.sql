drop database if exists aeropuertos;

create database if not exists aeropuertos;
use aeropuertos;

create table paises(
    codigo int primary key,
    nombre varchar(50) not null,
    pasaporte char(1) check (pasaporte = 'S' OR pasaporte = 'N')
        not null
);

create table ciudades(
    codigo int,
    nombre varchar(50) not null,
    pais int not null,
    primary key (codigo, pais),
    foreign key (pais) 
        references paises(codigo)
);

create table aeropuertos(
    codigo int primary key,
    nombre varchar(50) not null,
    categoria varchar(10),
    ciudad int not null,
    pais int not null,
    foreign key (ciudad, pais) 
        references ciudades(codigo, pais)
);

create table vuelosg(
    codigo int primary key,
    hora time not null,
    tipo_avion varchar(50) not null,
    capacidad int not null,
    origen int not null,
    destino int not null,
    foreign key (origen) 
        references aeropuertos(codigo),
    foreign key (destino) 
        references aeropuertos(codigo)
);

create table vuelosc(
    codigo int,
    vuelog int not null,
    pasajeros int check (pasajeros >= 0),
    incidencias varchar(100),
    primary key (codigo, vuelog),
    foreign key (vuelog) 
        references vuelosg(codigo)
);