-- Create database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Create User table
CREATE TABLE IF NOT EXISTS User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME NULL
);

-- Create Product table
CREATE TABLE IF NOT EXISTS Product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_in_cents INT NOT NULL,
    stock_qty INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME NULL
);

-- Create Order table
CREATE TABLE IF NOT EXISTS `Order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    product_qty INT NOT NULL,
    price_in_cents INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME NULL,
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
);

-- Insert sample users
INSERT INTO User (name, email, password) VALUES
('John Doe', 'john@example.com', 'hashed_password1'),
('Jane Smith', 'jane@example.com', 'hashed_password2'),
('Bob Johnson', 'bob@example.com', 'hashed_password3');

-- Insert sample products
INSERT INTO Product (name, description, price_in_cents, stock_qty) VALUES
('Laptop', 'High performance laptop', 99999, 10),
('Smartphone', 'Latest model smartphone', 59999, 15),
('Headphones', 'Noise cancelling headphones', 19999, 20);

-- Insert sample orders
INSERT INTO `Order` (product_id, user_id, product_qty, price_in_cents) VALUES
(1, 1, 1, 99999),
(2, 2, 2, 59999),
(3, 3, 1, 19999);