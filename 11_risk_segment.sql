SELECT
    CASE
        WHEN avg_weekly_usage_hours < 5.5
             AND payment_failures >= 2
        THEN 'High Risk'

        WHEN avg_weekly_usage_hours < 5.5
             OR payment_failures >= 2
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS risk_segment,

    COUNT(*) AS customers,

    ROUND(
        100.0 * SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate

FROM customer_churn

GROUP BY risk_segment;