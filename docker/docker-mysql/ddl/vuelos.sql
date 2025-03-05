create database VUELOS;
use VUELOS;

create table Aeropuertos (
    id int primary key,
    nombre varchar (50) NOT NULL,
    ciudad varchar (100) NOT NULL,
    pais varchar (20)
);
create table Vuelos (
    id int primary key,
    aeropOrigen int,
    aeropDestino int,
    duracion int,
    capacidad int,
    FOREIGN KEY (aeropOrigen) REFERENCES Aeropuertos(id),
    FOREIGN KEY (aeropDestino) REFERENCES Aeropuertos(id)
);

create table Pasajeros (
    id int primary key,
    nombre varchar(50),
    pasaporte varchar(30) UNIQUE
);

create table Reservas(
    id int primary key,
    vuelo int,
    pasajero int,
    asiento int,
    Foreign Key (vuelo) REFERENCES Vuelos (id),
    Foreign Key (pasajero) REFERENCES Pasajeros(id)
)

show TABLEs;
