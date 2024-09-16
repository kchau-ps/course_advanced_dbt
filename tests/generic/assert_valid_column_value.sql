{% test assert_valid_column_value(model, column_name, value) %}

-- We have an issue with some test events appearing in our data source that we want to be notified about
-- This returns records where the event name contains 'test'

SELECT *
FROM {{ model }}
WHERE lower({{ column_name }}) LIKE '%{{ value }}%'

{% endtest %}
