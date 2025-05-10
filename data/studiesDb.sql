USE studies;

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

alter table books add constraint fk_author foreign key (author_id) references author (id);

INSERT INTO customers (name, email, cpf) VALUES ('gustavo', 'gustavo@email.com', '04777911199');
INSERT INTO customers (name, email, cpf) VALUES ('Vanessa Veracruz', 'vanessacruz@email.com', '69969969969');
INSERT INTO customers (name, email, cpf) VALUES ('Cory Chase', 'corychase@email.com', '690');

INSERT INTO products (name, price) VALUES ('Coca Cola', 5.50);
INSERT INTO products (name, price) VALUES ('Bra', 205.89);

INSERT INTO orders (customer_id, product_id, total_price) VALUES (1,1,5.50);
INSERT INTO orders (customer_id, product_id, total_price) VALUES (2, 2, (SELECT price FROM products WHERE id = 2));
INSERT INTO orders (customer_id, product_id, total_price) VALUES (3, 2, (SELECT price FROM products WHERE id = 2));