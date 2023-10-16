-- This is SQL 6 - Table joining (Full Outer Join)
-- Purpose of this sql: 
-- Show a list of film and their accumulated rental amount
-- Need to show film title, and their accumulated rental amount
-- Sort by ascending order of accumulated rental amount, then film title


SELECT f.title,SUM(p.amount)
FROM film f
FULL OUTER JOIN inventory i ON f.film_id = i.film_id
FULL OUTER JOIN rental r ON i.inventory_id = r.inventory_id
FULL OUTER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.title
ORDER BY SUM(p.amount), f.title;
