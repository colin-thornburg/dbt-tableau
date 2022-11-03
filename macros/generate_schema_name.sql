{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    
    {% set log_msg='getting custom schema:\ntarget_name:' ~ target.name ~ '\ncustom_schema_name:' ~ custom_schema_name %}
    {% do log(log_msg, False) %}

    {%- if custom_schema_name -%}
        {% if 'default' == target.name %}
            {{default_schema}}
        {% elif 'merge_request' in target.name.lower() -%}
            {{target.schema}}{{ '_' ~ custom_schema_name if custom_schema_name else ''}}
        {% else %}
            {{custom_schema_name}}
        {% endif %}
    {%- else -%} 
        {% if node.path != 'rpc/request' or node.path != None %}
            {% set log_msg='Invalid Schema Config for model '~ node.path %}
            {% do log(log_msg, True) %}
        {%- else -%}
            {{ exceptions.raise_compiler_error("Invalid Schema Config for model "~ node.path ~ '\n Please check the dbt_project.yml to make sure the schema config is defined.') }} 
        {%- endif -%}
    {% endif %}
{%- endmacro %}	