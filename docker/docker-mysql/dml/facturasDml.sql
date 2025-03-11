USE FACTURAS;

INSERT INTO Clientes (id, nombre, numero_contacto, email)
VALUES
    (1, 'Juan Pérez', '600123456', 'juan.perez@example.com'),
    (2, 'María López', '700987654', 'maria.lopez@example.com'),
    (3, 'Pedro Martínez', '800567890', 'pedro.martinez@example.com'),
    (4, 'Ana Gómez', '900345678', 'ana.gomez@example.com'),
    (5, 'Luis Fernández', '678987654', 'luis.fernandez@example.com');

INSERT INTO Productos (id, nombre, precio)
VALUES
    (1, 'Laptop', 899.99),
    (2, 'Teclado', 49.99),
    (3, 'Mouse', 19.99),
    (4, 'Monitor', 199.99),
    (5, 'Impresora', 129.99);

INSERT INTO Facturas (id, fecha, cliente, total)
VALUES
    (1, '2025-01-15', 1, 350.75),
    (2, '2025-01-16', 2, 1200.50),
    (3, '2025-01-17', 3, 89.99),
    (4, '2025-01-18', 4, 499.99);

INSERT INTO DetalleFactura (id, factura, producto, cantidad)
VALUES
    (1, 1, 1, 1),
    (2, 1, 2, 2),
    (3, 2, 4, 2),
    (4, 2, 3, 3),
    (5, 2, 2, 1),
    (6, 3, 3, 1),
    (7, 4, 5, 1);   

--Actualizar el correo electrónico de un cliente
UPDATE Clientes
SET email = "juan.perez.nuevo@example.com"
WHERE id = 1;

--Incrementar el precio de todos los productos
UPDATE productos
SET precio = precio*1.1;

--Actualizar el total de una factura
UPDATE facturas
SET total = 800.50
WHERE cliente = 2;

--Cambiar las cantidades de productos en una factura
INSERT INTO detalleFactura (id, factura, producto, cantidad)
VALUES (8, 4, 3, 1);

--Modificar los datos de varios clientes
UPDATE clientes
set numero_contacto = 850123456
WHERE id = 3;
UPDATE clientes
set email = "ana.gomez.nueva@example.com"
WHERE id = 4;


--Eliminar un cliente
DELETE FROM clientes
WHERE id = 5;

--Eliminar un producto (y los detalles asociados)
DELETE FROM `detalleFactura`
WHERE producto = 3;
DELETE FROM productos
WHERE id = 3;

--. Eliminar los detalles de una factura
DELETE FROM `detalleFactura`
WHERE factura = 1;

--Eliminar una factura (primero detalles)
DELETE FROM `detalleFactura`
WHERE factura = 3;
DELETE FROM `facturas`
WHERE id = 3;

