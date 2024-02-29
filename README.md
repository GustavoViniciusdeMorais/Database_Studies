# SQLite3 Cheat Sheet

## Basic Commands

- `sqlite3`: Command to start the SQLite command-line interface.
- `.open <database_name>`: Open or create a database.
- `.tables`: List all tables in the current database.
- `.schema <table_name>`: Show the schema of a specific table.
- `.exit`: Exit SQLite command-line interface.

## Creating Tables

```sql
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    price REAL
);

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

## Inserting Data

```sql
INSERT INTO products (name, price) VALUES ('Product1', 10.99);
INSERT INTO products (name, price) VALUES ('Product2', 15.99);

INSERT INTO customers (name, email) VALUES ('John Doe', 'john@example.com');
INSERT INTO customers (name, email) VALUES ('Jane Smith', 'jane@example.com');

INSERT INTO orders (customer_id, product_id, quantity) VALUES (1, 1, 2);
INSERT INTO orders (customer_id, product_id, quantity) VALUES (2, 2, 1);
```

## Selecting Data

### List customers, their orders, and the products they ordered

```sql
SELECT customers.name AS customer_name, 
       orders.order_id, 
       products.name AS product_name, 
       products.price AS product_price, 
       orders.quantity
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN products ON orders.product_id = products.product_id;
```

This query selects the customer's name, the order ID, the product's name, price, and quantity from the `customers`, `orders`, and `products` tables, respectively. It joins these tables based on the `customer_id` and `product_id` foreign keys.
