CREATE DATABASE escuela;

USE escuela;

CREATE TABLE alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    edad INT,
    curso VARCHAR(50),
    email VARCHAR(100));


INSERT INTO alumnos (nombre, edad, curso, email) VALUES (
    'Carlos Pérez', 20, '2º de Bachillerato', 'carlos@gmail.com'
);

INSERT INTO alumnos (nombre, edad, curso, email) VALUES 
('Ana López', 22, '1º de Ingeniería', 'ana@yahoo.com'),
('José García', 23, '2º de Derecho', 'jose@outlook.com'),
('Lucía Martínez', 21, '3º de Medicina', 'lucia.m@gmail.com'),
('Pedro Torres', 20, '1º de Psicología', 'pedro.t@hotmail.com'),
('María Fernández', 24, '4º de Arquitectura', 'maria.f@universidad.edu'),
('Andrés Gómez', 19, '1º de Economía', 'andresg@gmail.com'),
('Carla Ruiz', 22, '2º de Ingeniería', 'carla.ruiz@yahoo.com'),
('Sofía Moreno', 23, '3º de Biología', 'sofia_moreno@outlook.com'),
('David Herrera', 25, 'Máster en Derecho', 'dherrera@correo.com'),
('Elena Sánchez', 21, '2º de Filosofía', 'elena.s@uni.edu'),
('Ana Barberá', 45,'3º de Criminología', 'anab@cuchame.es');


