-- Dropeo por las dudas qu exista una base con el mismo nombre
DROP DATABASE IF EXISTS tienda_de_ropa;

-- Crear base de datos
CREATE DATABASE TiendaRopa;

-- Usar base de datos
USE TiendaRopa;

-- Tabla: Categoría de Producto
CREATE TABLE ProductCategory (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Tabla: Producto
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES ProductCategory(category_id)
);

-- Tabla: Cliente
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

-- Tabla: Dirección del Cliente
CREATE TABLE CustomerAddress (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Tabla: Pedido
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Tabla: Detalle del Pedido
CREATE TABLE OrderDetail (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Tabla: Método de Pago
CREATE TABLE PaymentMethod (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    method VARCHAR(255) NOT NULL
);

-- Tabla: Envío
CREATE TABLE Shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_date DATETIME NOT NULL,
    delivery_date DATETIME NOT NULL,
    carrier VARCHAR(255) NOT NULL,
    tracking_number VARCHAR(255) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Tabla: Descuentos y Promociones
CREATE TABLE Discount (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    discount_percentage DECIMAL(5, 2) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL
);

-- Tabla: Reseñas de Productos
CREATE TABLE ProductReview (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT NOT NULL,
    review TEXT,
    review_date DATETIME NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Tabla: Inventario
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT NOT NULL,
    last_update DATETIME NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
