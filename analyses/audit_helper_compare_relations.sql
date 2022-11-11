{# in dbt Develop #}

{% set old_etl_relation=ref('stg_pmts') %}

{% set dbt_relation=ref('int_pmts') %}

{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    exclude_columns=["state"],
    primary_key="id"
) }}
