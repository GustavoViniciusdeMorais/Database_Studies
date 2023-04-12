# Sql Optimization

Created by: Gustavo Morais

### Dicas
```
1- Stop bringing every column with *, pick your columns
2- Use very specific WHERE clauses
```

### Choose columns
```sql
SELECT u.name, u.email FROM users AS u WHERE u.id = 1;
```

### Debug Commands
```
SHOW processlist;
SHOW FULL processlist;

EXPLAIN select customerNumber, customerName, phone, city FROM customers LIMIT 10;
```

### Show details of query execution
The 'Show warnings' commad shows the query details
```
EXPLAIN extended select customerNumber, customerName, phone, city FROM customers LIMIT 10; SHOW warnings;
```
![](./imgs/explainExtendedShowWarnings.png)


### Use indexes
Indexes creates a pointer in the table column that is used to split
the table for the data search, making it faster to look for the
data in the first half and the second half.
The engine needs to look for less rows to find the desired data.
```
ALTER TABLE payments ADD KEY IX_AMOUNT(amount);
EXPLAIN SELECT customerNumber, checkNumber, amount FROM payments WHERE amount < 50;
```
![](./imgs/withoutIndex.png)
<br>
Here we can see that the engine finds the result by looking just one row.
<br>
![](./imgs/withIndex.png)

### Show cost of last query execution
Use this command to measure if it costs less to run a lot of simple queries then just one complex query.
```
SHOW STATUS LIKE 'Last_Query_Cost';
```

<img src="./imgs/queryExecutionPath.png" width="500" height="500">
