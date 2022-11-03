{% macro generate_database_name(custom_database_name, node) -%}
    {%- set default_database = target.database -%}
    
    {% set log_msg='getting custom database: \ntarget_name:' ~ target.name ~ '\ncustom_database_name:' ~ custom_database_name %}
    {% do log(log_msg, False) %}

    {%- if custom_database_name is none and node.type == 'model'-%}
        {{ exceptions.raise_compiler_error("Invalid Database Config for model "~ node.path) }}
    {%- elif 'default' == target.name or 'merge_request' in target.name -%}
        {{ default_database }} 
    {%- else -%}
        {#-- {{ custom_database_name }}_{{var('environment_id')}} --#}
        {{ custom_database_name }}_{{env_var('DBT_ENV_ID')}}
    {%- endif -%}
{%- endmacro %}