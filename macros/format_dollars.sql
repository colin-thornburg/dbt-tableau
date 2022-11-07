
{% macro format_dollars(column_name, precision=2) %}
    ({{ column_name }} * 2)::numeric(16, {{ precision }})
{% endmacro %}

