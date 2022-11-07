{% snapshot tables_snapshot %}

{{
    config(
      target_database='colint_demo_tableau',
      target_schema='snapshots',
      unique_key="table_schema||'-'||table_name",

      strategy='timestamp',
      updated_at='last_altered',
    )
}}

select * from {{ source('info_schema', 'tables') }}
where table_type = 'BASE TABLE'

{% endsnapshot %}