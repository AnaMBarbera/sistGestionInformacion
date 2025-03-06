drop database vuelos;

create database if not exists vuelos;
use vuelos;
select database();

create table aeropuertos(
    id int primary key,
    nombre varchar(100) not null,
    ciudad varchar(100) not null,
    pais varchar(100) not null
);

create table vuelos(
    id int primary key,
    origen int not null,
    destino int not null,
    duracion decimal (4,2) not null CHECK (duracion > 0), 
    capacidad int not null CHECK (capacidad > 0),
    foreign key (origen) references aeropuertos(id),
    foreign key (destino) references aeropuertos(id)
);

create table pasajeros (
    id int primary key,
    nombre varchar(100) not null,
    pasaporte char(12) not null unique
);

create table reservas(
    id int primary key,
    vuelo int not null,
    pasajero int not null,
    asiento char(4) not null, -- 1A, 1B, 2A, 2B
    foreign key (vuelo) references vuelos(id),
    foreign key (pasajero) references pasajeros(id)
);