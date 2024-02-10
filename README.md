# PostgreSQL Commands Cheat Sheet

## Database Operations

### Connect to pgsql
```sh
psql -U username -W
```

### Create Database
```sql
CREATE DATABASE database_name;
```

### Connect to Database
```sql
\c database_name;
```

### List Databases
```sql
\l
```

### Drop Database
```sql
DROP DATABASE database_name;
```

## Table Operations

### Create Table
```sql
CREATE TABLE table_name (
    column1 datatype1,
    column2 datatype2,
    ...
);
```

### Show Tables
```sql
\dt
```

### Describe Table
```sql
\d+ table_name
```

### Drop Table
```sql
DROP TABLE table_name;
```

## Data Manipulation

### Insert Data
```sql
INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);
```

### Select Data
```sql
SELECT * FROM table_name;
```

### Update Data
```sql
UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;
```

### Delete Data
```sql
DELETE FROM table_name WHERE condition;
```

## Querying

### Basic Query
```sql
SELECT column1, column2 FROM table_name WHERE condition;
```

### Aggregate Functions
```sql
SELECT COUNT(*), SUM(column1), AVG(column2) FROM table_name;
```

### Joins
```sql
SELECT t1.column1, t2.column2 FROM table1 t1 INNER JOIN table2 t2 ON t1.id = t2.id;
```

## Transactions

### Start Transaction
```sql
BEGIN;
```

### Commit Transaction
```sql
COMMIT;
```

### Rollback Transaction
```sql
ROLLBACK;
```

## Miscellaneous

### Show Query Execution Time
```sql
\timing
```

### Show Server Version
```sql
SELECT version();
```

### Show Current User
```sql
SELECT current_user;
```

### Show Table Size
```sql
SELECT pg_size_pretty(pg_total_relation_size('table_name'));
```
```

These commands cover a wide range of PostgreSQL operations including database and table management, data manipulation, querying, transactions, and miscellaneous tasks. Adjustments may be necessary based on your specific PostgreSQL setup and requirements.