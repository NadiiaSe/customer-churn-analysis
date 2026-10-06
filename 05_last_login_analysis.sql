SELECT 
CASE
	WHEN last_login_days_ago < 10 THEN '0-9'
	WHEN last_login_days_ago < 20 THEN '10-19'
	WHEN last_login_days_ago < 30 THEN '20-29'
	WHEN last_login_days_ago < 40 THEN '30-39'
	WHEN last_login_days_ago < 50 THEN '40-49'
	ELSE '50-60'
END AS login_group
,COUNT(*) AS total_customers
,SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
,ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY login_group
ORDER BY login_group;
