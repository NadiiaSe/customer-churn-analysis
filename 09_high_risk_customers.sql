SELECT
    COUNT(*) AS high_risk_customers
FROM customer_churn
WHERE
    avg_weekly_usage_hours < 5.5
    AND payment_failures >= 2;