select
    table_catalog,
    table_schema,
    table_name,
    table_owner,
    table_type,
    is_transient,
    row_count,
    bytes,
    created,
    last_altered,
    dbt_updated_at,
    dbt_valid_from,
    dbt_valid_to




from {{ ref('tables_snapshot') }}
