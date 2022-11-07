{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    
    {% set log_msg='getting custom schema:\ntarget_name:' ~ target.name ~ '\ncustom_schema_name:' ~ custom_schema_name %}
    {% do log(log_msg, True) %}
    {{ log(target.name)}}

    {%- if custom_schema_name -%}
        {% if 'default' == target.name %}
            {{ log("First if: "~ target.schema) }}
            {{default_schema}}
        {% elif 'ci' in target.name.lower() -%}
            {{ log("Second if.  Target Schema: " ~ target.schema) }}
            {{target.schema}}{{ 'test_pr_schema'}}{{ '_' ~ custom_schema_name if custom_schema_name else ''}}
        {% else %}
            {{ log("First Else: ") }}
            {{default_schema}}
        {% endif %}
    {%- else -%} 
        {{ log("Last Else: "~ target.schema) }}
        {{ default_schema }}
    {% endif %}
{%- endmacro %}	