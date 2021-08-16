/* Create tables: */

CREATE TABLE customers (
    cust_id INT AUTO_INCREMENT,
    cust_name VARCHAR(20),
    cust_email VARCHAR(320) UNIQUE,
    cust_password VARCHAR(15) UNIQUE,
    cust_phonenum VARCHAR(10) UNIQUE,
    PRIMARY KEY (cust_id)
);

CREATE TABLE invoice (
    inv_num int NOT NULL,
    quantity int NOT NULL,
    cust_id int,
    total_price DECIMAL(4,2),
    purchase_date DATE,
    PRIMARY KEY (inv_num),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

CREATE TABLE cards
(
    card_num INT AUTO_INCREMENT,
    card_name VARCHAR(20),
    card_type VARCHAR(20),
    card_price DECIMAL(4,2),
    card_currency DECIMAL(4,2),
    card_exppdate DATE,
    card_available BOOLEAN,
    card_code VARCHAR(12),
    PRIMARY KEY (card_num)
);

CREATE TABLE customer_service
(
    ticket_num INT AUTO_INCREMENT,
    ticket_date DATE,
    cust_id INT AUTO_INCREMENT,
    inv_num INT AUTO_INCREMENT,
    PRIMARY KEY (ticket_num),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id),
    FOREIGN KEY (inv_num) REFERENCES invoice(inv_num)
);

/* End of Table Creation __________________________________*/

/* Display the tables specifications: */
DESCRIBE TABLE customers;
DESCRIBE TABLE invoice;
DESCRIBE TABLE cards;
DESCRIBE TABLE customer_service;

/* Display the tables content: */
SELECT * FROM customers;
SELECT * FROM invoice;
SELECT * FROM cards;
SELECT * FROM customer_service;

/* Delete Tables: */
DROP TABLE customers;
DROP TABLE invoice;
DROP TABLE cards;
DROP TABLE customer_service;

/* Insert & delete customer service rows: */
INSERT INTO customer_service (ticket_date, cust_id, inv_num)
VALUES ('2020/10/08', 6, 6);

DELETE FROM customer_service
WHERE ticket_num = 5;

/* Insert & delete invoice rows: */
INSERT INTO invoice (inv_num, quantity, cust_id, total_price, purchase_date)
VALUES (11, 3, 1, 90.00, '2020/03/17');

DELETE FROM invoice
WHERE inv_num = 11;

/* Insert & delete customers columns: */
ALTER TABLE customers
ADD cust_adreess VARCHAR(30);

ALTER TABLE customers
DROP cust_adreess;

/* Update invoice dates: */
UPDATE invoice
SET purchase_date = '2020/06/06'
WHERE inv_num > 5;

/* Update card price: */
UPDATE cards
SET card_price = card_price*1.02
WHERE card_price <= 20.00;

/* Update customer's phone number: */
UPDATE customers
SET cust_phonenum = '0500518005'
WHERE cust_name = 'jack';

/* Avrage Invoice price amount: */
SELECT AVG (total_price) FROM invoice;

/* Maximum Invoice price amount: */
SELECT MAX (total_price) FROM invoice;

/* Minimum Invoice price amount: */
SELECT MIN (total_price) FROM invoice;

/* Sum of all Invoice price amount: */
SELECT SUM (total_price) FROM invoice;

/* Number of custumers count: */
SELECT COUNT (cust_id) FROM customers;

/* Number of all Available cards: */
SELECT COUNT (card_available) FROM cards
WHERE card_available = true;
