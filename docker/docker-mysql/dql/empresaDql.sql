USE EMPRESA;

INSERT INTO `Departamentos`
values (1, "Dirección", "Torrent"),
(2, "RRHH", "Torrent"),
(3, "MARKETING", "Torrent"),
(4, "DESARROLLO", "Torrent"),
(5, "VENTAS", "Torrent");

INSERT INTO `Empleados` (num, nombre, jefe_dep, comision, dept, salario)
values (1, "Pepe", null, 10, 1, 1000),
(2, "PEPA", 1, 0, 2, 500),
(3, "PEPITA",1, 0, 3, 500 ),
(4, "PEPET", 1, 0, 4, 400),
(5, "PIPO",4 , 0, 4, 300),
(6, "PEPON",4 , 0, 4, 300),
(7, "PIPA",1 , 10, 5, 500);

SELECT * FROM EMPLEADOS;

ALTER TABLE Empleados ADD f_nac DATE;
UPDATE `Empleados`
SET f_nac = "2000/01/30"
WHERE num = 1;
UPDATE `Empleados`
SET f_nac = "1990/03/3"
WHERE num = 2;
UPDATE `Empleados`
SET f_nac = "1995/05/15"
WHERE num = 3;
UPDATE `Empleados`
SET f_nac = "1969/07/25"
WHERE num = 4;
UPDATE `Empleados`
SET f_nac = "2004/12/25"
WHERE num = 5;
UPDATE `Empleados`
SET f_nac = "2002/10/09"
WHERE num = 6;
UPDATE `Empleados`
SET f_nac = "2004/06/18"
WHERE num = 7;

SELECT *, CHAR_LENGTH(nombre) AS 'Long',
    comision/100 as 'Comisionx1',
    DAYNAME(f_nac) as 'Dia nac',
    CONCAT(DAY(f_nac), ' de ', MONTH(f_nac), ' de ', YEAR(f_nac)) as 'fecha_mod'
FROM `Empleados`
