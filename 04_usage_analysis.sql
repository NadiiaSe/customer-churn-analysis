SELECT 
CASE
	WHEN avg_weekly_usage_hours < 5.5 THEN 'Low Usage'
	WHEN avg_weekly_usage_hours < 15.5 THEN 'Medium Usage'
	ELSE 'High Usage'
END AS usage_segment
,COUNT(*) AS total_customers
,SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
,ROUND(100.0 * SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY usage_segment;
