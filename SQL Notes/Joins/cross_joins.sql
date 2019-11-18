# Finding orders placed by george: 2 step process
SELECT id FROM customers WHERE last_name = 'George';
SELECT * FROM orders WHERE customer_id = 1;

# Finding orders placed by george using a subquery
SELECT * FROM orders WHERE customer_id = 
	(
		SELECT id FROM customers
		WHERE last_name='George'
	);

SELECT * FROM customers, orders;

# Cross joins multiply tables with tables, which is meaningless
	
	
	
	
	