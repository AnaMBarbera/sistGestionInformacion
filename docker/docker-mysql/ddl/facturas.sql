create database if not exists FACTURAS;
use FACTURAS;

drop database FACTURAS;

create table clientes (
    id int primary key,
    nombre varchar (50) NOT NULL,
    telefono char (12) NOT NULL,
    email varchar (30) NOT NULL
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
    id int,
    factura int,
    producto int,
    cantidad int,
    PRIMARY KEY (ID, factura),
    FOREIGN KEY (factura) REFERENCES facturas(id)
        on delete CASCADE
        on update CASCADE,
    FOREIGN KEY (producto) REFERENCES productos(id)
);

ALTER TABLE clientes CHANGE COLUMN telefono numero_contacto VARCHAR(10);
ALTER TABLE facturas ADD COLUMN direccion_envio VARCHAR(100);
ALTER TABLE productos CHANGE COLUMN precio precio DECIMAL(10,3); --1234567,890

show create table clientes;
show create table facturas;
show TABLES;

SHOW DATABASES;

