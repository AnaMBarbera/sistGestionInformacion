create database if not exists facturas;
use facturas;

create table clientes(
    id int primary key,
    nombre varchar(100) not null,
    telefono char(12) not null,
    correo varchar(50) not null
);

create table facturas(
    id int primary key,
    fecha date not null,
    cliente int,
    total decimal(10,2) not null, -- 12345678.90
    foreign key (cliente) references clientes(id)
);

create table productor(
    id int primary key,
    nombre varchar(100) not null,
    precio decimal(8,2) default 0 check (precio >= 0) not null
);

create table detalle(
    id int,  -- (ID) linea 1, linea 2, ... se repite entre facturas
    factura int,
    producto int not null,
    cantidad int not null,
    primary key (id, factura),
    foreign key (factura) references facturas(id)
        on delete CASCADE
        on update CASCADE,
    foreign key (producto) references productor(id)
)