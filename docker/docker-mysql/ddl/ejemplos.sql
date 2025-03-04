select database();
create database temp;
use temp;

/* crear una tabla llamada tabla1 con los siguientes campos:
-id:entero, clave primaria
- nombre: cadena de texto de 50 caract
- fecha_nacimiento: fecha no nulo
- edad: entero, no nulo, positivo por defecto 0
*/

create table tabla1 (
    id int primary key,
    nombre varchar (50) NOT NULL,
    edad int NOT NULL DEFAULT 0 CHECK(edad>0),
    fecha_nacimiento date NOT NULL
);

/*crear una tabla con los campos
-id1: entero clave primaria
-id2:entero clave primaria
- nombre: cadena de texto de 50 caracteres
- alumno: int (clave ajena) no nulo */

create table tabla2(
    id1 int,
    id2 int,
    alumno int not null,    
    nombre varchar (50),
    PRIMARY KEY (id1,id2),
    FOREIGN KEY (alumno) REFERENCES tabla1(id)    
);

/** 
    crear una tabla3 con los campos
    -id1: entero clave primaria
    -poblacion: cadena de texto de 50 caracteres
    -año: entero, no nulo, mayor que 2000 por defecto 0
    - campo1: campo 2 enteros y clave ajena a tabla 2
*/

create table tabla3(
    id1 int PRIMARY KEY,
    poblacion varchar (50),
    año int not null default 0 CHECK(año>2000),
    campo1 int,
    campo2 int,
    FOREIGN KEY (campo1,campo2) REFERENCES tabla2(id1,id2)    
);



show tables;
DESCRIBE tabla1;
DESCRIBE tabla2;
DESCRIBE tabla3;
show create table tabla2;
show create table tabla3;


