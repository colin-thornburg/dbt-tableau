select
    id as payment_id,
    order_id,
    payment_method,
    state,
    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at,
    case
        when payment_method='coupon' then to_number(0.05, 10,2) 
        else to_number(0.00, 10,2)
    end as discount_percent
from {{ source('stripe', 'payment') }}