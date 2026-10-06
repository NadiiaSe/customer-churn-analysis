SELECT 
CASE WHEN payment_failures <= 1 THEN '0-1 failures'
ELSE '2+ failures'
END AS payment_group
,COUNT(*) AS total_customers
,SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
,ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY payment_group;