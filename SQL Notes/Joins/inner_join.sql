# Implicit inner join
SELECT * FROM customers, orders
WHERE customers.id = orders.customers_id;

# Implicit inner join
SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;
	

# Explicit inner joins
SELECT * FROM customers
JOIN orders 
	ON customers.id = orders.customers_id;
	
SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders
	ON customers.id = orders.customer_id;
	
SELECT * FROM orders
JOIN customers 
	ON orders.customer_id = customers.id;
	

# arbitrary join, meaningless, but still possible
SELECT * FROM customers 
JOIN orders ON customers.id = orders.id;




	