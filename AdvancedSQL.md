# Advanced SQL
Requirements
- mysql version 8.0
- Database classicmodels from data folder (/var/www in docker)

### Window Functions
```sql
SELECT
	c.customerNumber,
	SUM(od.quantityOrdered) AS quantity_purchased,
	RANK() OVER (ORDER BY SUM(od.quantityOrdered) DESC) CustomerRank
FROM
customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY
	c.customerNumber
ORDER BY
	CustomerRank
LIMIT 3;
```
```sql
-- Shows the product quantity difference between the current order and the previous
-- order
SELECT
	o.orderNumber,
	p.productName,
	LAG(o2.quantityOrdered) OVER (ORDER BY o.orderDate) AS PreviousQuantity,
	o2.quantityOrdered - LAG(o2.quantityOrdered) OVER (ORDER BY o.orderDate) AS QuantityDifference
FROM
orders o
JOIN orderdetails o2 ON o.orderNumber = o2.orderNumber
JOIN products p ON o2.productCode = p.productCode
GROUP BY o.orderNumber, p.productCode
ORDER BY o.orderDate DESC
LIMIT 3;
```

### Subquery
Shows the top 10 most hight payments then the average
```sql
SELECT
c.phone, p.amount
FROM
classicmodels.customers c
JOIN classicmodels.payments p ON c.customerNumber = p.customerNumber
WHERE p.amount > (
	SELECT AVG(p2.amount)
	FROM classicmodels.payments p2
)
ORDER BY p.amount DESC
LIMIT 10
```

### Common Table Expression

```sql
WITH 
LowStockProducts AS 
(
SELECT
p.productName,
p.quantityInStock
FROM
classicmodels.products p
WHERE p.quantityInStock < 50
)

SELECT
LSP.productName, LSP.quantityInStock
FROM
LowStockProducts AS LSP
```

### Update with data from same table

```sql
### Common Table Expression
UPDATE db.table SET column =
(SELECT column FROM (SELECT column FROM db.table WHERE id = 1) AS subquery)
WHERE id = 1;
```
### JSON Search
```sql
CREATE TABLE services (id INT, name VARCHAR(20), configurations JSON);

INSERT INTO services VALUES (1, 'test', '{"host":{"url":"test"}}');

SELECT * FROM services WHERE JSON_CONTAINS(configurations->'$.host.url', '"test"') limit 1;
```
