-- This is SQL 10 - Double CTE
-- Purpose of this sql:
-- Find Ontario active customer who has paid average monthly rental fee of 4 or more in April
-- Round the amount paid to 2 decimal places
-- Sort by descending amount of average monthly rental fee, then sort by name in alphebatical order

WITH customer_avg_monthly_payment AS (
	SELECT customer_id, EXTRACT(MONTH from payment_date) AS month, AVG(amount) AS monthly_average
	FROM payment
	WHERE EXTRACT(MONTH from payment_date) = 4
	GROUP BY customer_id, EXTRACT(MONTH from payment_date)
	ORDER BY customer_id
),

ontario_customer AS(
	SELECT c.customer_id, c.first_name, a.district
	FROM customer c
	LEFT JOIN address a ON c.address_id = a.address_id
	WHERE a.district = 'Ontario' AND c.activebool = true
)

SELECT oc.customer_id, oc.first_name, ROUND(camp.monthly_average,2) As customer_monthly_average
FROM ontario_customer oc
INNER JOIN customer_avg_monthly_payment camp ON oc.customer_id = camp.customer_id
GROUP BY oc.customer_id, oc.first_name, ROUND(camp.monthly_average,2)
HAVING ROUND(camp.monthly_average,2) >= 4
ORDER BY ROUND(camp.monthly_average,2) DESC, oc.first_name ASC;
