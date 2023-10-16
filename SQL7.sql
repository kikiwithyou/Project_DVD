-- This is SQL 7 - CASE WHEN
-- Purpose of this sql: 
-- Show a list of film and their accumulated rental amount
-- Need to show film title, and their accumulated rental amount
-- ** If the film has never been rented, the rental amount should show as 0 **
-- Sort by ascending order of accumulated rental amount, then film title

SELECT result.title,
	CASE WHEN result.rental_amount IS NULL THEN '0'
		 ELSE result.rental_amount
	END
FROM (
	SELECT f.title,SUM(p.amount) As rental_amount
	FROM film f
	FULL OUTER JOIN inventory i ON f.film_id = i.film_id
	FULL OUTER JOIN rental r ON i.inventory_id = r.inventory_id
	FULL OUTER JOIN payment p ON r.rental_id = p.rental_id
	GROUP BY f.title
	ORDER BY f.title
	) result
ORDER BY rental_amount, result.title;