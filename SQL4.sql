-- This is SQL 4 - Table joining (Inner Join) & IS NULL
-- Purpose of this sql: 
-- Find active customer who has not returned their rental
-- Show their customer_id, first_name, address_id, email, rental_id
-- Show record by descending order of rental_id

SELECT c.customer_id, c.first_name, c.address_id, c.email, r.rental_id
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
WHERE c.activebool = true AND r.return_date IS NULL
ORDER BY rental_id DESC;


