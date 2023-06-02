-- datestamp_macro.sql

{% macro datestamp_model(table_name) %}
WITH transformed_data AS (
  SELECT *,
         CURRENT_DATE::TEXT AS datestamp
  FROM {{ ref(table_name) }}
)

{% if execute %}
SELECT * FROM transformed_data
{% endif %}
{% endmacro %}
