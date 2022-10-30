with orders as (
    Select * from {{ ref('stg_orders') }}

),

payments as (
    Select * from {{ ref('stg_payments') }}

)


Select * from orders left join payments using (order_id)