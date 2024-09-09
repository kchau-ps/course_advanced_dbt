{% macro rolling_agg(
    column_name,
    partition_by,
    period_len=7,
    agg_func="avg",
    order_by='created_at') %}
    {{ agg_func }}( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ period_len - 1 }} PRECEDING AND CURRENT ROW
            ) AS {{ agg_func }}_7_periods_{{ column_name }}
{% endmacro %}
