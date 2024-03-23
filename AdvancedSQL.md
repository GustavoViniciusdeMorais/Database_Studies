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
