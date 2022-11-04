
{{ config(
    schema='Revenue'
) }}

with
    customers as (select * from {{ ref("dim_customers") }}),

    orders as (select * from {{ ref("fct_orders") }})

select
    orders.order_id,
    orders.customer_id,
    customers.first_name,
    customers.last_name,
    orders.order_date,
    orders.state,
    orders.payment_id,
    orders.payment_method,
    orders.amount,
    orders.created_at,
    customers.first_order_date,
    customers.most_recent_order_date,
    orders.discount_percent

from orders
left join customers using (customer_id)
