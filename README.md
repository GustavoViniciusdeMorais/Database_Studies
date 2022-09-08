# MySQL Commands

```

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

```