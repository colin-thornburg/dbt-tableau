Select payment_method, sum(amount) as amount
from {{ ref("int_pmts") }} 
group by payment_method
