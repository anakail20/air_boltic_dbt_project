{% macro safe_column(column, default_value) %}
    COALESCE({{ column }}, {{ default_value }})
{% endmacro %}
