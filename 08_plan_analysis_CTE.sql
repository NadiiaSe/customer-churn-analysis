WITH churn_summary AS (

    SELECT
        plan_type,
        COUNT(*) AS customers,
        SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned

    FROM customer_churn
    GROUP BY plan_type

)

SELECT
    plan_type,
    customers,
    churned,
    ROUND(100.0 * churned / customers, 2) AS churn_rate
FROM churn_summary;