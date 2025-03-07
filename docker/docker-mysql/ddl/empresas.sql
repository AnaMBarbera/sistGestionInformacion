create database EMPRESA;
use EMPRESA;

create table Empleados (
    num int,
    nombre varchar (10) NOT NULL,
    jefe_dep int,
    comision int
);

create table Departamentos(
    cod int primary key,
    nombre varchar (10) NOT NULL UNIQUE,
    pueblo varchar(20)
);

ALTER TABLE Empleados ADD PRIMARY KEY (num);
ALTER TABLE Empleados ADD salario int not null;
ALTER TABLE Empleados ADD dept int not null;
ALTER TABLE Empleados ADD FOREIGN KEY (dept) REFERENCES Departamentos (cod) ON DELETE CASCADE;
ALTER TABLE Empleados ADD FOREIGN KEY (jefe_dep) REFERENCES Empleados (num);

ALTER TABLE Empleados DROP jefe_dep;
--no está permitido
ALTER TABLE Departamentos DROP PRIMARY KEY;
--no está permitido



