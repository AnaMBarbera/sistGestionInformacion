-- Active: 1740759994266@@127.0.0.1@3306@employees
use employees;

delimiter $$

CREATE PROCEDURE actualizar_salario(IN emp_id INT, IN nuevo_salario DECIMAL(10,2))
BEGIN
    -- Comprobamos si el empleado existe, si no existe producimos un error
    declare emp_count INT; -- Variable para contar el número de empleados
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejo de errores
        ROLLBACK;
    END;
    
    -- Contamos el número de empleados con el id pasado como parámetro
    SELECT COUNT(*) INTO emp_count
        FROM employees
        WHERE emp_no = emp_id;
    -- Si no existe el empleado, lanzamos un error
    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no existe';
    END IF;

    START TRANSACTION;

    -- Actualizamos el salario del empleado en la tabla de salarios
    UPDATE salaries 
    SET to_date = CURDATE() 
    WHERE emp_no = emp_id AND to_date = '9999-01-01';  -- Marcar el salario actual como inactivo (termina)

    -- Insertamos el nuevo salario con la fecha de inicio
    INSERT INTO salaries (emp_no, salary, from_date, to_date) 
    VALUES (emp_id, nuevo_salario, CURDATE(), '9999-01-01'); -- El salario actual se marcará con una fecha máxima

    COMMIT;
END;$$

delimiter ;

select * from employees where emp_no = 10001;
select *
    from salaries
    where emp_no = 10001
order by from_date asc;

CREATE FUNCTION salario_actual(emp_id INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE salario DECIMAL(10,2);
    DECLARE numero INT;

    select count(*) into numero
    FROM salaries
    WHERE  to_date = '9999-01-01'
        AND emp_no = emp_id; 
    
    IF ( numero != 1 ) THEN
        RETURN -1;
    END IF;

    SELECT salary INTO salario
    FROM salaries
    WHERE  to_date = '9999-01-01'
        AND emp_no = emp_id;  -- Solo salarios actuales

    RETURN salario;
END;

select salario_actual(10001);

select emp_no, salario_actual(emp_no) as salario
from employees
LIMIT 10;

drop procedure if exists cambiar_departamento;

CREATE PROCEDURE cambiar_departamento(IN emp_id INT, IN nuevoDep VARCHAR(4))
BEGIN
    -- Comprobamos si el empleado existe, si no existe producimos un error
    declare emp_count INT; -- Variable para contar el número de empleados
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejo de errores
        ROLLBACK;
    END;
    
    -- Contamos el número de empleados con el id pasado como parámetro
    SELECT COUNT(*) INTO emp_count
        FROM employees
        WHERE emp_no = emp_id;
    -- Si no existe el empleado, lanzamos un error
    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no existe';
    END IF;

    START TRANSACTION;

    -- Actualizamos el salario del empleado en la tabla de salarios
    UPDATE dept_emp 
    SET to_date = CURDATE() 
    WHERE emp_no = emp_id AND to_date = '9999-01-01';  -- Marcar el salario actual como inactivo (termina)

    -- Insertamos el nuevo salario con la fecha de inicio
    INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date) 
    VALUES (emp_id, nuevoDep, CURDATE(), '9999-01-01'); -- El salario actual se marcará con una fecha máxima

    COMMIT;
END;

call cambiar_departamento(10001, "d005");


select * from dept_emp where emp_no = 10001;

insert into dept_emp values (10001, 'd009', '2025-04-25', '9999-01-01');

update dept_emp set to_date = '9999-01-01' WHERE emp_no = 10001;
delete from dept_emp where dept_no in ('d005', 'd001') and emp_no = 10001;