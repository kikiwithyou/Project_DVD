-- This is SQL 2 - Simple selection with WHERE Clause & ORDER BY & LIMIT
-- Purpose of this sql: 
-- 1. Find 10 inactive customer from store 1
-- 2. Find their customer ID, first_name, last_name and email 
-- 3. List the customer in alphebatic order of frist name

SELECT customer_id, first_name, last_name, email
FROM customer
WHERE store_id = 1 AND active = 0
ORDER BY first_name
LIMIT 10;

