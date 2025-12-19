-- This folder conatins SQL queries used to analyze customer churn data.
-- View total customers
SELECT COUNT(*) AS total_customers
FROM customer_churn;

-- Churn rate
SELECT
ROUND(
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
) AS churn_rate_percentage
FROM customer_churn;

-- Churn by contract type
SELECT contract_type,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customer_churn
GROUP BY contract_type;

-- Monthly charges impact on churn
SELECT
CASE
WHEN monthly_charges < 50 THEN 'Low'
WHEN monthly_charges BETWEEN 50 AND 100 THEN 'Medium'
ELSE 'High'
END AS charge_category,
COUNT(*) AS customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customer_churn
GROUP BY charge_category;

-- Tenure vs churn
SELECT
tenure,
COUNT(*) AS customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customer_churn
GROUP BY tenure
ORDER BY tenure;
