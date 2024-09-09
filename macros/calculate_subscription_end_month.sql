{% macro calculate_subscription_end_month(start_date, end_date) %}
    CASE
        WHEN DATE(DATE_TRUNC('month', start_date)) = DATE(DATE_TRUNC('month', end_date))
            THEN DATEADD('month', 1, DATE(DATE_TRUNC('month', end_date)))
        WHEN DATE(DATE_TRUNC('month', end_date)) IS NULL
            THEN DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE)))
        ELSE DATE(DATE_TRUNC('month', end_date))
    END AS DATE(DATE_TRUNC('month', end_date))
{% endmacro %}
