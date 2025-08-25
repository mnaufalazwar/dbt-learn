with payments as (
    select * from {{ref('stg_stripe__payments')}}
)

select
    order_id,
    sum(amount) as total_amout
from
    payments
group by
    order_id
having
    total_amout < 0