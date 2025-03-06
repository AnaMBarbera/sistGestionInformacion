create database VUELOS;

drop database VUELOS;
use VUELOS;

create table Aeropuertos (
    id int primary key,
    nombre varchar (50) NOT NULL,
    ciudad varchar (100) NOT NULL,
    pais varchar (20) not null
);
create table Vuelos (
    id int primary key,
    aeropOrigen int not null,
    aeropDestino int not null,
    duracion decimal (4,2) not null check (duracion > 0),
    capacidad int check (capacidad > 0),
    FOREIGN KEY (aeropOrigen) REFERENCES Aeropuertos(id),
    FOREIGN KEY (aeropDestino) REFERENCES Aeropuertos(id)
);

create table Pasajeros (
    id int primary key,
    nombre varchar(50),
    pasaporte char(12) UNIQUE
);

create table Reservas(
    id int primary key,
    vuelo int not null,
    pasajero int not null,
    asiento char(4) not null,
    Foreign Key (vuelo) REFERENCES Vuelos (id),
    Foreign Key (pasajero) REFERENCES Pasajeros(id)
)

show TABLEs;
