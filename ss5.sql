
CREATE DATABASE IF NOT EXISTS ss5;
USE ss5;

-- Tạo bảng products
CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) UNIQUE,
    productName VARCHAR(50),
    productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
    productStatus BOOLEAN
);


INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'Laptop', 1500.00, 10, 'Laptop chơi game cao cấp', TRUE),
    ('P002', 'Smartphone', 800.00, 20, 'Điện thoại thông minh mới nhất', TRUE),
    ('P003', 'Tablet', 500.00, 15, 'Nhẹ và dễ mang theo', FALSE),
    ('P004', 'Monitor', 300.00, 5, 'Màn hình 27-inch 4K', TRUE);

CREATE UNIQUE INDEX idx_productCode ON products(productCode);


EXPLAIN SELECT * FROM products WHERE productCode = 'P001';


CREATE INDEX idx_productName ON products(productName, productPrice);


EXPLAIN SELECT * FROM products WHERE productCode = 'P001';


CREATE VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus
FROM products;


ALTER VIEW view_products AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM products;


DROP VIEW IF EXISTS view_products;