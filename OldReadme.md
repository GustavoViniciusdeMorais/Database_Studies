# Pgsql Commands

### Import database
```sh
mysql -u root -p
mysql> use laravel;
mysql> source /var/www/mysqlsampledatabase.sql;
```
### Export MariaDB database
Access the terminal of the db server, no need to enter the db terminal, just the server terminal
```
mariadb-dump --user=root --password --lock-tables --databases dbName > /var/lib/mysql/dbDump.sql
```

### Create database tables and simple commands
```sql

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DOUBLE
);

CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

ALTER TABLE customers ADD UNIQUE (name);

ALTER TABLE customers ADD COLUMN email VARCHAR(100);

ALTER TABLE orders ADD COLUMN total_price DOUBLE;

ALTER TABLE customers ADD UNIQUE (email);

ALTER TABLE customers DROP COLUMN (email);

ALTER TABLE customers ADD COLUMN cpf VARCHAR(20);

ALTER TABLE customers ADD CONSTRAINT cpf_unique UNIQUE (cpf);

desc customers;

ALTER TABLE customers MODIFY cpf VARCHAR(14) NOT NULL;

ALTER TABLE customers DROP INDEX cpf_unique;

ALTER TABLE orders ALTER COLUMN total_price SET DEFAULT 0;

ALTER TABLE orders ALTER COLUMN total_price DROP DEFAULT;

INSERT INTO customers (name, email, cpf) VALUES ('gustavo', 'gustavo@email.com', '04777911199');
INSERT INTO customers (name, email, cpf) VALUES ('Vanessa Veracruz', 'vanessacruz@email.com', '69969969969');
INSERT INTO customers (name, email, cpf) VALUES ('Cory Chase', 'corychase@email.com', '690');

INSERT INTO products (name, price) VALUES ('Coca Cola', 5.50);
INSERT INTO products (name, price) VALUES ('Bra', 205.89);

INSERT INTO orders (customer_id, product_id, total_price) VALUES (1,1,5.50);
INSERT INTO orders (customer_id, product_id, total_price) VALUES (2, 2, (SELECT price FROM products WHERE id = 2));
INSERT INTO orders (customer_id, product_id, total_price) VALUES (3, 2, (SELECT price FROM products WHERE id = 2));

UPDATE customers SET name = 'gustavo vinicius' WHERE id = 1;

DELETE FROM products WHERE id = 3;

ALTER TABLE customers ADD COLUMN uf VARCHAR (11);

ALTER TABLE customers ALTER COLUMN uf SET DEFAULT 'GO';

SELECT * FROM products WHERE name LIKE '%a%';

SELECT COUNT(*) FROM products;

SELECT MAX(price) FROM products;

SELECT uf, COUNT(*) AS AmtCustomers 
FROM customers
GROUP BY uf;

SELECT c.name AS customer_name, p.name as product_name, sale.total_price AS order_price
FROM customers AS c
INNER JOIN orders AS sale ON c.id = sale.customer_id
INNER JOIN products AS p ON sale.product_id = p.id;

ALTER TABLE products ADD COLUMN store INT;
ALTER TABLE products ALTER COLUMN store SET DEFAULT 10;
UPDATE products SET store = 10;

```

### Procedures

```

DELIMITER &&

DROP PROCEDURE IF EXISTS get_customers&&

CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM customers;
END&&
DELIMITER ;

CALL get_customers();


DELIMITER &&

DROP PROCEDURE IF EXISTS make_order&&

CREATE PROCEDURE make_order(customer_id INT, product_id INT, total_price DOUBLE, amt INT)
BEGIN
    INSERT INTO orders (customer_id, product_id, total_price)
    VALUES (customer_id, product_id, total_price);
    UPDATE products SET store=store-amt WHERE id = product_id;
END&&
DELIMITER ;

CALL make_order(3,2,500,2);

```

### View example
```

CREATE OR REPLACE VIEW v_go_customers AS
SELECT * FROM customers WHERE uf = 'GO';

SELECT * FROM v_go_customers;


DROP VIEW IF EXISTS v_orders_details;

CREATE VIEW v_orders_details AS
SELECT c.name AS customer_name, c.cpf AS customer_cpf, p.name as product_name, sale.total_price AS order_price
FROM customers AS c
INNER JOIN orders AS sale ON c.id = sale.customer_id
INNER JOIN products AS p ON sale.product_id = p.id;

SELECT * FROM v_orders_details;

```
![TDD](/imgs/dbDiagram.png)
