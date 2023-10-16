-- This is SQL 3 - Simple selection with GROUP BY, HAVING
-- Purpose of this sql: 
-- 1. Count the number of inactive customers
-- 2. Group by store
-- 3. Show only store that has more than 7 inactive customers

SELECT store_id, COUNT(customer_id)
FROM customer
WHERE active = 0
GROUP BY store_id
HAVING COUNT(customer_id) >7;



