-- This is SQL 5 - Table joining (Left Join)
-- Purpose of this sql: 
-- Obtain a list of films with its id, title, language and category name
-- Sort by alphebatical order of category name, then film title

SELECT f.film_id, f.title, c.name AS Category
FROM film f
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
ORDER BY Category, title;
