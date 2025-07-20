CREATE DATABASE sellit_db;

USE sellit_db;

CREATE TABLE products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  price DECIMAL(10,2),
  quantity INT
);

INSERT INTO products (name, price, quantity)
VALUES ('T-shirt', 299.99, 50), ('Sneakers', 999.99, 20);

