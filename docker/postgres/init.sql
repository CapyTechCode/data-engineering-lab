-- ============================================
-- CapyTech — Datos de práctica para SQL
-- Este script se ejecuta automáticamente al crear el contenedor
-- Dataset: tienda e-commerce ficticia
-- ============================================

-- Esquema para práctica SQL (Fase 1)
CREATE SCHEMA IF NOT EXISTS tienda;

-- ============================================
-- TABLAS
-- ============================================

CREATE TABLE tienda.clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    ciudad VARCHAR(100),
    pais VARCHAR(50) DEFAULT 'Chile',
    fecha_registro DATE NOT NULL,
    activo BOOLEAN DEFAULT true
);

CREATE TABLE tienda.categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE tienda.productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    categoria_id INT REFERENCES tienda.categorias(categoria_id),
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo BOOLEAN DEFAULT true
);

CREATE TABLE tienda.pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES tienda.clientes(cliente_id),
    fecha_pedido TIMESTAMP NOT NULL DEFAULT NOW(),
    estado VARCHAR(20) DEFAULT 'pendiente',
    total DECIMAL(12,2)
);

CREATE TABLE tienda.detalle_pedidos (
    detalle_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES tienda.pedidos(pedido_id),
    producto_id INT REFERENCES tienda.productos(producto_id),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
);

-- ============================================
-- DATOS DE EJEMPLO
-- ============================================

INSERT INTO tienda.categorias (nombre, descripcion) VALUES
    ('Electrónica', 'Dispositivos electrónicos y accesorios'),
    ('Hogar', 'Artículos para el hogar'),
    ('Deportes', 'Equipamiento deportivo'),
    ('Libros', 'Libros físicos y digitales'),
    ('Ropa', 'Vestimenta y accesorios');

INSERT INTO tienda.clientes (nombre, email, ciudad, pais, fecha_registro) VALUES
    ('María López', 'maria@email.com', 'Santiago', 'Chile', '2024-01-15'),
    ('Carlos Ruiz', 'carlos@email.com', 'Valparaíso', 'Chile', '2024-02-20'),
    ('Ana Torres', 'ana@email.com', 'Concepción', 'Chile', '2024-03-10'),
    ('Pedro Soto', 'pedro@email.com', 'Lima', 'Perú', '2024-01-05'),
    ('Lucía Vargas', 'lucia@email.com', 'Buenos Aires', 'Argentina', '2024-04-01'),
    ('Diego Morales', 'diego@email.com', 'Santiago', 'Chile', '2024-05-12'),
    ('Valentina Díaz', 'valentina@email.com', 'Medellín', 'Colombia', '2024-02-28'),
    ('Andrés Silva', 'andres@email.com', 'Santiago', 'Chile', '2024-06-15'),
    ('Camila Rojas', 'camila@email.com', 'Viña del Mar', 'Chile', '2024-03-22'),
    ('Roberto Muñoz', 'roberto@email.com', 'Bogotá', 'Colombia', '2024-07-01'),
    ('Francisca Herrera', 'francisca@email.com', 'Santiago', 'Chile', '2024-08-10'),
    ('Matías Castillo', 'matias@email.com', 'Temuco', 'Chile', '2024-01-30');

INSERT INTO tienda.productos (nombre, categoria_id, precio, stock) VALUES
    ('Notebook Lenovo 15"', 1, 599990, 25),
    ('Mouse Logitech MX', 1, 49990, 100),
    ('Teclado mecánico RGB', 1, 79990, 60),
    ('Monitor 27" 4K', 1, 349990, 15),
    ('Webcam HD 1080p', 1, 39990, 80),
    ('Silla ergonómica', 2, 199990, 30),
    ('Escritorio standing desk', 2, 299990, 20),
    ('Lámpara LED escritorio', 2, 29990, 50),
    ('Pelota de yoga', 3, 15990, 40),
    ('Mancuernas 10kg par', 3, 35990, 25),
    ('Mat de yoga', 3, 19990, 35),
    ('Clean Code - Robert Martin', 4, 25990, 100),
    ('Designing Data-Intensive Apps', 4, 32990, 70),
    ('The Pragmatic Programmer', 4, 28990, 85),
    ('Polera técnica running', 5, 24990, 60),
    ('Zapatillas trail', 5, 89990, 30);

INSERT INTO tienda.pedidos (cliente_id, fecha_pedido, estado, total) VALUES
    (1, '2024-06-01 10:30:00', 'completado', 649980),
    (2, '2024-06-05 14:15:00', 'completado', 79990),
    (3, '2024-06-10 09:00:00', 'completado', 399980),
    (1, '2024-07-01 11:00:00', 'completado', 29990),
    (4, '2024-07-15 16:30:00', 'completado', 599990),
    (5, '2024-07-20 13:00:00', 'enviado', 235980),
    (6, '2024-08-01 10:00:00', 'completado', 129980),
    (2, '2024-08-10 15:00:00', 'completado', 349990),
    (7, '2024-08-15 11:30:00', 'completado', 54980),
    (8, '2024-09-01 09:45:00', 'pendiente', 499980),
    (3, '2024-09-05 14:00:00', 'completado', 89990),
    (9, '2024-09-10 10:00:00', 'enviado', 199990),
    (1, '2024-09-15 16:00:00', 'completado', 79990),
    (10, '2024-10-01 11:00:00', 'completado', 329980),
    (11, '2024-10-05 13:30:00', 'pendiente', 599990),
    (12, '2024-10-10 09:00:00', 'completado', 25990),
    (6, '2024-10-15 15:00:00', 'completado', 89990),
    (4, '2024-11-01 10:30:00', 'enviado', 199990);

INSERT INTO tienda.detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
    (1, 1, 1, 599990), (1, 2, 1, 49990),
    (2, 3, 1, 79990),
    (3, 4, 1, 349990), (3, 2, 1, 49990),
    (4, 8, 1, 29990),
    (5, 1, 1, 599990),
    (6, 6, 1, 199990), (6, 11, 1, 19990), (6, 9, 1, 15990),
    (7, 2, 1, 49990), (7, 3, 1, 79990),
    (8, 4, 1, 349990),
    (9, 12, 1, 25990), (9, 14, 1, 28990),
    (10, 6, 1, 199990), (10, 7, 1, 299990),
    (11, 16, 1, 89990),
    (12, 6, 1, 199990),
    (13, 3, 1, 79990),
    (14, 7, 1, 299990), (14, 8, 1, 29990),
    (15, 1, 1, 599990),
    (16, 12, 1, 25990),
    (17, 16, 1, 89990),
    (18, 6, 1, 199990);

-- ============================================
-- VISTAS ÚTILES PARA PRACTICAR
-- ============================================

CREATE VIEW tienda.resumen_ventas AS
SELECT
    p.pedido_id,
    c.nombre AS cliente,
    c.ciudad,
    p.fecha_pedido,
    p.estado,
    p.total,
    COUNT(d.detalle_id) AS items
FROM tienda.pedidos p
JOIN tienda.clientes c ON p.cliente_id = c.cliente_id
JOIN tienda.detalle_pedidos d ON p.pedido_id = d.pedido_id
GROUP BY p.pedido_id, c.nombre, c.ciudad, p.fecha_pedido, p.estado, p.total;

-- ============================================
-- MENSAJE DE CONFIRMACIÓN
-- ============================================
DO $$
BEGIN
    RAISE NOTICE '✅ CapyTech DB inicializada correctamente';
    RAISE NOTICE '   → 5 categorías, 16 productos, 12 clientes, 18 pedidos';
    RAISE NOTICE '   → Schema: tienda.*';
    RAISE NOTICE '   → Listo para practicar SQL!';
END $$;
