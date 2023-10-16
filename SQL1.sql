-- This is SQL 1 - Simple Selection with COUNT
-- Purpose of this sql: 
-- 1. Count the number of customer in customer table 
-- 2. Display the result with "number_of_customer" header

SELECT COUNT(customer_id) AS number_of_customer
FROM customer;

