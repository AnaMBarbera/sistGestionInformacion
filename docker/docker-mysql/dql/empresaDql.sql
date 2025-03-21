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

SELECT nombre,
LOWER(nombre) as 'Minúsculas',
 -- También sirve lcase y ucase
UPPER(nombre) as 'Mayúsculas'
FROM `Departamentos`;

SELECT MAX(salario) as "Salario max", MIN(salario) as "Salario min", round(AVG(salario),2) as media, SUM(salario) as Suma, COUNT(*) as totalEmpleados, COUNT(jefe_dep) as totalJefedep
    FROM Empleados;

SELECT MAX(salario) as "Salario max", MIN(salario) as "Salario min", round(AVG(salario),2) as media, SUM(salario) as Suma, COUNT(*) as totalEmpleados, COUNT(jefe_dep) as totalJefedep
FROM Empleados
WHERE dept = 4; -- Los del departamento desarrollo

--para ver los empleados que tiene cada departamento
SELECT `Departamentos`.nombre, `Empleados`.nombre
FROM Departamentos, `Empleados`
WHERE Empleados.dept = Departamentos.cod;

--para ver también el nombre del jefe del departamento. Como hay una relación unaria en la tabla de Empleados tenemos que utilizar JOIN 
SELECT Departamentos.nombre, 
    Empl1.nombre AS Empleado, 
    Empl2.nombre AS Jefe
FROM 
    Departamentos
-- Empleados asignados a cada departamento
JOIN 
    Empleados Empl1 ON Empl1.dept = Departamentos.cod
-- Empleados que son jefe de departamento
-- JOIN Empleados Empl2 ON Empl2.num = Empl1.jefe_dep;

-- Para que aparezcan departamentos que no tienen jefe deberíamos utilizar LEFT JOIN en la última línea
 LEFT JOIN Empleados Empl2 ON Empl2.num = Empl1.jefe_dep;

--EJERCICIOS. DISTINCT (BD empresa)

--Muestra los departamentos que tienen algún empleado. En la tabla dept están todos los departamentos pero quizá alguno no tiene empleados. Por tanto, deberás sacarlo a partir de la tabla emp. Que no aparezcan repetidos los departamentos.
SELECT DISTINCT dept
FROM Empleados;

--Muestra las parejas de comisión y departamento (de la tabla de empleados) sin que aparezcan parejas repetidas. .
SELECT DISTINCT comision, dept
FROM Empleados;

-- Muestra en cuántos pueblos hay departamentos
select DISTINCT pueblo
from Departamentos;

-- EJERCICIOS. WHERE (BD empresa)
-- Muestra nombre y comisión de aquellos empleados que NO tengan comisión (piensa que puede haber empleados con comisión 0 y empleados con comisión NULL).
SELECT nombre, comision
from Empleados
WHERE comision = 0 OR comision is null;
-- Muestra nombre y comisión de los empleados que sean del departamento 2 con una comisión superior al 10%.
SELECT nombre, comision
from Empleados
WHERE dept = 2 and comision > 10;
-- Muestra nombre y comisión de los empleados cuya comisión es entre el 20 y el 50%. Hazlo de 2 formas: con BETWEEN y sin BETWEEN.
SELECT nombre, comision
from Empleados
WHERE comision BETWEEN 20 and 50;
--
SELECT nombre, comision
from Empleados
WHERE comision >= 20 and comision <=50;

-- Muestra el nombre de los empleados de los departamentos 2, 5 y 6. Muestra también el departamento de cada uno. Hazlo de 2 formas: con IN y sin IN.
SELECT nombre
from Empleados
WHERE dept in(2, 5, 6);
--
SELECT nombre
from Empleados
WHERE dept = 2 or dept = 5 or dept =6;
-- Muestra todos los datos de los empleados que el nombre empiece por A, que terminan con E y que la tercera letra de su nombre sea una I.
SELECT nombre
from Empleados
WHERE upper(nombre LIKE 'A__I%E');

DESCRIBE TABLE Empleados;



