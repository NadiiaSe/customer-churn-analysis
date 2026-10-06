SELECT
    user_id,
    payment_failures,
    last_login_days_ago,
    avg_weekly_usage_hours,

    RANK() OVER (
        ORDER BY
            payment_failures DESC,
            last_login_days_ago DESC
    ) AS risk_rank

FROM customer_churn;