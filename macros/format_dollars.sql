
{% macro format_dollars(column_name, precision=2) %}
    ({{ column_name }} * 4)::numeric(16, {{ precision }})
{% endmacro %}

