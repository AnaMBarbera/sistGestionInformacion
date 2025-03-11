use COLEGIOS;

INSERT INTO Colegios (id, nombre, ubicacion, tipo)
VALUES 
    (1, 'Colegio Central', 'Calle Mayor, 45', 'Público'),
    (2, 'Colegio Norte', 'Avenida Norte, 12', 'Privado'),
    (3, 'Colegio Sur', 'Calle Sur, 78', 'Público');

INSERT INTO Estudiantes (id, nombre, edad, colegio)
VALUES
    (1, 'Juan García', 12, 1),
    (2, 'Ana Martínez', 11, 1),
    (3, 'Carlos López', 13, 2),
    (4, 'Marta Jiménez', 14, 2),
    (5, 'Pedro Gil', 10, 3);

 INSERT INTO Profesores (id, nombre, asignatura, colegio)
VALUES
    (1, 'Luis Fernández', 'Matemáticas', 1),
    (2, 'Marta Sánchez', 'Historia', 1),
    (3, 'Laura Pérez', 'Inglés', 2),
    (4, 'Javier Torres', 'Ciencias', 2),
    (5, 'Elena Morales', 'Música', 3);   

INSERT INTO Clases (id, nombre, profesor, colegio)
VALUES
    (1, 'Álgebra', 1, 1),
    (2, 'Geografía', 2, 1),
    (3, 'Conversación', 3, 2),
    (4, 'Biología', 4, 2),
    (5, 'Coro', 5, 3);

--cambiar la dirección de un colegio
UPDATE Colegios
SET ubicacion = 'Avenida Principal, 200'
WHERE id = 2;

-- Incrementar la edad de todos los estudiantes
UPDATE Estudiantes
SET edad = edad + 1;

--Cambiar la asignatura de un profesor
UPDATE Profesores
SET asignatura = 'Literatura'
WHERE id = 3;

--Actualizar las edades de estudiantes según condición
UPDATE Estudiantes
SET edad = edad + 2
WHERE edad < 12 AND colegio = 1;

--Cambiar los profesores de varias clases
UPDATE Clases
SET profesor = 2
WHERE id = 1;

UPDATE Clases
SET profesor = 5
WHERE id = 4;

--Eliminar un estudiante
DELETE FROM Estudiantes
WHERE id = 5;

--Eliminar un profesor (primero sus clases)
DELETE FROM Clases
WHERE profesor = 1;
DELETE FROM Profesores
WHERE id = 1;

--Eliminar todas las clases de un colegio
DELETE FROM clases
WHERE colegio = 2;

--Eliminar un colegio (primero a los estudiantes, profesores y clases asociados.)
DELETE FROM Estudiantes
WHERE colegio = 3;
DELETE FROM Clases
WHERE colegio = 3;
DELETE FROM Profesores
WHERE colegio = 3;





