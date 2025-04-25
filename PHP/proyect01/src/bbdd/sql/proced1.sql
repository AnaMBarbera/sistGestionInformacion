use employees;

DELIMITER $$

CREATE PROCEDURE actualizar_salario(IN emp_id INT, IN salario DECIMAL(10,2))
BEGIN    

    declare emp_count INT; -- Variable para contar el número de empleados
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejo de errores
        ROLLBACK;
    END;
    -- Comprobamos si el empleado existe, si no existe producimos un error
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

DELIMITER;

SELECT dept_no, from_date, to_date
FROM dept_emp
WHERE emp_no = 10001;

 -- Cerrar el periodo actual
    UPDATE dept_emp    
    SET to_date = CURDATE()
    WHERE emp_no = 10001 AND to_date = '9999-01-01';

    INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
    VALUES (10001, 'd006', CURDATE(), '9999-01-01');



CREATE PROCEDURE actualizar_depart(IN emp_id INT, IN nuevo_dept CHAR(4))
BEGIN    

    declare emp_count INT; -- Variable para contar el número de empleados
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Manejo de errores
        ROLLBACK;
    END;
    -- Comprobamos si el empleado existe, si no existe producimos un error
    SELECT COUNT(*) INTO emp_count
        FROM employees
        WHERE emp_no = emp_id;
    -- Si no existe el empleado, lanzamos un error
    IF emp_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no existe';
    END IF;   

    START TRANSACTION;

    -- Actualizamos el departamento del empleado en la tabla de departamento
    UPDATE dept_emp 
    SET to_date = CURDATE() 
    WHERE emp_no = emp_id AND to_date = '9999-01-01';  -- Marcar el departamento actual como inactivo (termina)

    -- Insertamos el nuevo departamento con la fecha de inicio
    INSERT INTO dept_emp  (emp_no, dept_no, from_date, to_date) 
    VALUES (emp_id, nuevo_dept, CURDATE(), '9999-01-01'); -- El departamento actual se marcará con una fecha máxima

    COMMIT;
END;

DROP PROCEDURE actualizar_depart;