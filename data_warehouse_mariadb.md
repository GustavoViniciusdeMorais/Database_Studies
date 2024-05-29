# Creating a Data Warehouse with MariaDB: A Step-by-Step Guide

In this tutorial, we will walk through the process of creating a simple data warehouse using MariaDB. We'll use the snowflake schema, which is a type of database schema that normalizes the data into multiple related tables. 

## Prerequisites

Before we begin, ensure you have the following:

- MariaDB installed on your system.
- Basic understanding of SQL.
- A database client tool like MySQL Workbench or phpMyAdmin (optional but recommended).

## Step 1: Setting Up MariaDB

First, you need to install MariaDB. If you haven't installed it yet, you can download it from the [official MariaDB website](https://mariadb.org/download/).

### Installing MariaDB on Ubuntu

```sh
sudo apt update
sudo apt install mariadb-server
sudo mysql_secure_installation
```

### Starting MariaDB

```sh
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

### Accessing MariaDB

```sh
sudo mysql -u root -p
```

## Step 2: Designing the Snowflake Schema

The snowflake schema is a type of data warehouse schema that is a more complex version of the star schema. It normalizes data into multiple related tables. For our example, we'll use a simple sales data warehouse with the following tables:

- **Dimension Tables**:
  - `dim_customer`
  - `dim_product`
  - `dim_date`
- **Fact Table**:
  - `fact_sales`

### Schema Diagram

```
         dim_date
           |
           |
dim_customer--fact_sales--dim_product
```

## Step 3: Creating the Database and Tables

### Create the Database

```sql
CREATE DATABASE sales_dw;
USE sales_dw;
```

### Create Dimension Tables

#### `dim_customer`

```sql
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    customer_phone VARCHAR(15)
);
```

#### `dim_product`

```sql
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(100)
);
```

#### `dim_date`

```sql
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    day INT,
    month INT,
    year INT,
    weekday VARCHAR(10)
);
```

### Create Fact Table

#### `fact_sales`

```sql
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    date_id DATE,
    quantity_sold INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id)
);
```

## Step 4: Inserting Sample Data

### Insert Data into `dim_customer`

```sql
INSERT INTO dim_customer (customer_id, customer_name, customer_address, customer_phone) VALUES
(1, 'John Doe', '123 Elm Street', '555-1234'),
(2, 'Jane Smith', '456 Oak Avenue', '555-5678');
```

### Insert Data into `dim_product`

```sql
INSERT INTO dim_product (product_id, product_name, product_category) VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Desk', 'Furniture');
```

### Insert Data into `dim_date`

```sql
INSERT INTO dim_date (date_id, day, month, year, weekday) VALUES
('2024-05-01', 1, 5, 2024, 'Wednesday'),
('2024-05-02', 2, 5, 2024, 'Thursday');
```

### Insert Data into `fact_sales`

```sql
INSERT INTO fact_sales (customer_id, product_id, date_id, quantity_sold, total_amount) VALUES
(1, 1, '2024-05-01', 1, 999.99),
(2, 2, '2024-05-02', 2, 199.98);
```

## Step 5: Querying the Data

### Example Query: Total Sales by Product

```sql
SELECT p.product_name, SUM(f.quantity_sold) AS total_quantity_sold, SUM(f.total_amount) AS total_sales_amount
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name;
```

### Example Query: Sales on a Specific Date

```sql
SELECT c.customer_name, p.product_name, f.quantity_sold, f.total_amount
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
JOIN dim_product p ON f.product_id = p.product_id
JOIN dim_date d ON f.date_id = d.date_id
WHERE d.date_id = '2024-05-01';
```

## Conclusion

Congratulations! You have successfully created a simple data warehouse using MariaDB with a snowflake schema.
