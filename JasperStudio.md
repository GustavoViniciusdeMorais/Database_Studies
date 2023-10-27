# Jasper Studio

```sh
```

### Database setup
```sql
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL
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
    total_price DOUBLE,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (name, email, cpf) VALUES ('gustavo', 'gustavo@email.com', '04777911199');
INSERT INTO customers (name, email, cpf) VALUES ('Person1', 'person1@email.com', '09322211122');
INSERT INTO customers (name, email, cpf) VALUES ('Person2', 'person2@email.com', '11122299922');

INSERT INTO products (name, price) VALUES ('Coca Cola', 5.50);
INSERT INTO products (name, price) VALUES ('Cellphone', 205.89);

INSERT INTO orders (customer_id, product_id, total_price) VALUES (1,1,5.50);
INSERT INTO orders (customer_id, product_id, total_price) VALUES (2, 2, (SELECT price FROM products WHERE id = 2));
INSERT INTO orders (customer_id, product_id, total_price) VALUES (3, 2, (SELECT price FROM products WHERE id = 2));
```

### Query orders
```sql
SELECT c.name AS customer_name, p.name as product_name, sale.total_price AS order_price
FROM customers AS c
INNER JOIN orders AS sale ON c.id = sale.customer_id
INNER JOIN products AS p ON sale.product_id = p.id;
```
