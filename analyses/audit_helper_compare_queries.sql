with test as (

{% set old_fct_orders_query %}
  select
    sum(amount)
  from {{ ref('mart_pmts') }}
{% endset %}

{% set new_fct_orders_query %}
  select
    sum(amount)
  from {{ ref('int_pmts') }}
{% endset %}

{{ audit_helper.compare_queries(
    a_query=old_fct_orders_query,
    b_query=new_fct_orders_query,
    primary_key="id"
) }}

)

Select * from test where IN_A = FALSE or IN_B = FALSE