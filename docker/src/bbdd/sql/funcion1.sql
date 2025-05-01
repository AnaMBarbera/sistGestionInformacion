-- Active: 1741034868095@@127.0.0.1@6606@employees
use employees;

SELECT salary, from_date, to_date
FROM salaries
WHERE emp_no = 10001 and to_date = "9999-01-01";

/*he tenido qu agregar READS SQL DATA después de RETURNS DECIMAL para que la cabecera indique que lee datos*/

CREATE FUNCTION lastSalary(emp_id INT)
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE salario DECIMAL(10,2);
    DECLARE numero INT;

    select count(*) into numero
    FROM salaries
    WHERE emp_no = emp_id and to_date = "9999-01-01";

    IF (numero !=1) THEN
    RETURN -1;
    END IF;

    SELECT salary INTO salario
        FROM salaries
        WHERE emp_no = emp_id and to_date = "9999-01-01";
    RETURN salario;
END;

DROP FUNCTION `lastSalary`;

select lastSalary(10001);

/* PODEMOS UTILIZAR LA FUNCION EN OTRAS CONSULTAS */
select emp_no, lastSalary(emp_no) as salario 
from employees
LIMIT 10;

CREATE FUNCTION lastDept(emp_id INT)
RETURNS CHAR(4)
READS SQL DATA
BEGIN
    DECLARE departamento CHAR(4);
    DECLARE numero INT;

    select count(*) into numero
    FROM dept_emp
    WHERE emp_no = emp_id and to_date = "9999-01-01";

    IF (numero !=1) THEN
    RETURN NULL;
    END IF;

    SELECT dept_no INTO departamento
        FROM dept_emp
        WHERE emp_no = emp_id and to_date = "9999-01-01";
    RETURN departamento;
END;

