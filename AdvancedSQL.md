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
