use sakila;
-- Select the first name, last name, and email address of all the customers who have rented a movie.


SELECT distinct first_name, last_name, address_id  
FROM rental INNER JOIN customer
ON rental.customer_id = customer.customer_id;


-- What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
SELECT customer_id, first_name, last_name, AVG(amount) FROM customer JOIN payment USING(customer_id) GROUP BY customer_id;

select concat(c.first_name,' ',c.last_name) as 'Customer Name', avg(p.amount) as 'Avg Paid', p.customer_id
	from payment as p
	join customer as c
	on p.customer_id = c.customer_id
	group by p.customer_id;

-- Select the name and email address of all the customers who have rented the "Action" movies.

-- Write the query using multiple join statements
-- Write the query using sub queries with multiple WHERE clause and IN condition
-- Verify if the above two queries produce the same results or not

SELECT CONCAT(first_name, " ", last_name) AS name, email 
FROM customer WHERE customer_id IN 
(SELECT customer_id FROM rental WHERE inventory_id IN 
 (SELECT inventory_id FROM inventory WHERE film_id IN 
  (SELECT film_id FROM film_category JOIN category USING (category_id) WHERE category.name="Action")));
  
  
  
  SELECT payment_id, amount, 
CASE WHEN amount >= 0 AND amount < 2 THEN 'low' 
WHEN amount >= 4 THEN 'high' 
END AS category 
FROM payment;
  


