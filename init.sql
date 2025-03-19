CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE DetallesPedido (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol ENUM('admin', 'cliente') NOT NULL
);

-- Insertar 50 clientes
INSERT INTO Clientes (nombre, email) VALUES
('Carlos Perez', 'carlos1@email.com'),
('Maria Gomez', 'maria2@email.com'),
('Juan Lopez', 'juan3@email.com'),
('Ana Martinez', 'ana4@email.com'),
('Pedro Sanchez', 'pedro5@email.com');

-- Insertar 20 productos
INSERT INTO Productos (nombre, precio) VALUES
('Laptop', 1500.00),
('Mouse', 25.00),
('Teclado', 45.00),
('Monitor', 300.00),
('Impresora', 120.00);

-- Insertar 50 pedidos
INSERT INTO Pedidos (id_cliente, fecha, total) VALUES
(1, '2024-03-01', 1570.00),
(2, '2024-03-02', 345.00),
(3, '2024-03-03', 120.00),
(4, '2024-03-04', 1900.00),
(5, '2024-03-05', 25.00);

-- Insertar 25 detalles de pedido
INSERT INTO DetallesPedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 1500.00),
(1, 2, 2, 25.00),
(2, 3, 1, 45.00),
(3, 5, 1, 120.00),
(4, 1, 1, 1500.00);

-- Insertar 5 usuarios
INSERT INTO Usuarios (usuario, password, rol) VALUES
('admin1', 'hashedpassword1', 'admin'),
('cliente1', 'hashedpassword2', 'cliente'),
('cliente2', 'hashedpassword3', 'cliente'),
('admin2', 'hashedpassword4', 'admin'),
('cliente3', 'hashedpassword5', 'cliente');


