-- This is SQL 8 - Sub-Query in FROM Clause
-- Purpose of this sql:
-- Count the number of distinct films rented by customer with address in Ontario district
-- Show film_id, title

SELECT COUNT(rented.film_id)
FROM (
	SELECT DISTINCT(f.film_id), c.customer_id, a.district
	FROM film f
	INNER JOIN inventory i ON i.film_id = f.film_id
	INNER JOIN rental r ON i.inventory_id = r.inventory_id
	INNER JOIN customer c ON r.customer_id = c.customer_id
	LEFT JOIN address a ON c.address_id = a.address_id
	WHERE a.district = 'Ontario'
) rented;
