create database FACTURAS;
use FACTURAS;

create table clientes (
    id int primary key,
    nombre varchar (50) NOT NULL,
    telefono varchar (10),
    email varchar (30)
);

create table facturas (
    id int primary key,
    fecha DATE,
    cliente int,
    total FLOAT,
    FOREIGN KEY (cliente) REFERENCES clientes(id)
);

create table productos (
    id int primary key,
    nombre varchar (50) NOT NULL,
    precio FLOAT    
);

create table detalleFactura (
    id int primary key,
    factura int,
    producto int,
    cantidad int,
    FOREIGN KEY (factura) REFERENCES facturas(id),
    FOREIGN KEY (producto) REFERENCES productos(id)
);

show TABLES;

SHOW DATABASES;

