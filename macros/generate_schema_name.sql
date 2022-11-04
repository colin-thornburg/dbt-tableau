{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    
    {% set log_msg='getting custom schema:\ntarget_name:' ~ target.name ~ '\ncustom_schema_name:' ~ custom_schema_name %}
    {% do log(log_msg, True) %}

    {%- if custom_schema_name -%}
        {% if 'default' == target.name %}
            {{ log("First if: " ~ arg1 ~ ", " ~ arg2) }}
            {{default_schema}}
        {% elif 'ci' in target.name.lower() -%}
            {{target.schema}}{{ '_' ~ custom_schema_name if custom_schema_name else ''}}
        {% else %}
            {{custom_schema_name}}
        {% endif %}
    {%- else -%} 
        {{ log("Last Else: ") }}
        {{ default_schema }}
    {% endif %}
{%- endmacro %}	