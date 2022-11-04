
{% macro format_dollars(column_name, precision=2) %}
    ({{ column_name }} * 1)::numeric(16, {{ precision }})
{% endmacro %}

