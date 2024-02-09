DROP DATABASE IF EXISTS TpShop;
CREATE DATABASE IF NOT EXISTS TpShop;
SHOW DATABASES;
USE TpShop;

DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer
(
    id      VARCHAR(8),
    name    VARCHAR(30),
    address VARCHAR(30),
    salary  double,
    CONSTRAINT PRIMARY KEY (id)
    );
SHOW TABLES;
DESCRIBE Customer;

DROP TABLE IF EXISTS Item;
CREATE TABLE IF NOT EXISTS Item
(
    code        VARCHAR(8),
    description VARCHAR(50),
    qty         INT(5)        DEFAULT 0,
    unitPrice   DECIMAL(10, 2) DEFAULT 0.00,
    CONSTRAINT PRIMARY KEY (code)
    );
SHOW TABLES;
DESCRIBE Item;

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE IF NOT EXISTS `Orders`
(
    orderId   VARCHAR(8),
    orderDate DATE,
    cusId     VARCHAR(8),
    CONSTRAINT PRIMARY KEY (orderId, cusId),
    CONSTRAINT FOREIGN KEY (cusId) REFERENCES Customer (id) ON DELETE CASCADE ON UPDATE CASCADE
    );
SHOW TABLES;
DESCRIBE `Orders`;

DROP TABLE IF EXISTS `OrderDetail`;
CREATE TABLE IF NOT EXISTS `OrderDetail`
(
    orderId   VARCHAR(8),
    itemCode  VARCHAR(8),
    qty       INT(5)        DEFAULT 0,
    total DECIMAL(10, 2) DEFAULT 0.00,

    CONSTRAINT PRIMARY KEY (orderId, itemCode),
    CONSTRAINT FOREIGN KEY (orderId) REFERENCES `Orders` (orderId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (itemCode) REFERENCES Item (code) ON DELETE CASCADE ON UPDATE CASCADE

    );
SHOW TABLES;
DESCRIBE `OrderDetail`;

INSERT INTO Customer
VALUES ('C00-001', 'Naduni', 'Kandy', 55000),
       ('C00-002', 'Malki', 'Galle', 50000),
       ('C00-003', 'Gigi', 'Colombo', 60000),
       ('C00-004', 'Selena', 'Kadawatha', 60000),
       ('C00-005', 'Sadani', 'Matara', 55000);

SELECT *
FROM Customer;

INSERT INTO Item
VALUES ('I00-001', 'Flour', 55, 120.00),
       ('I00-002', 'Samba Rice', 50, 190.00),
       ('I00-003', 'Kakulu Rice',60, 105.00),
       ('I00-004', 'Potato', 50, 130.00),
       ('I00-005', 'Onions', 30, 155.00),
       ('I00-006', 'Chocolate Biscuit', 30, 250.00),
       ('I00-007', 'Dhal', 95, 105.00),
       ('I00-008', 'Chicken', 60, 500.00),
       ('I00-009', 'Sugar', 30, 105.00),
       ('I00-010', 'Noodles', 55, 190.00);


SELECT *
FROM Item;

use TpShop;
SELECT orderId FROM `Orders` ORDER BY orderId DESC LIMIT 1;
SELECT COUNT(id) FROM Customer;