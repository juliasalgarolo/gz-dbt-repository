-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

with operational_margin_selected as (
select  orders_id,
        date_date,
        margin,
        quantity,
        shipping_fee,
        logcost,
        ship_cost,
        revenue,
        purchase_cost
from {{ ref('int_orders_margin') }} 
join {{ ref('stg_raw__ship') }} 
    using (orders_id)
)

select  orders_id,
        date_date,
        SUM(shipping_fee) as shipping_fee,
        SUM(logcost) as logcost,
        SUM(ship_cost) as ship_cost,
        SUM(quantity) as quantity,
        ROUND(SUM((margin + shipping_fee) - (logcost - ship_cost)),2) as operational_margin,
        SUM(revenue) as revenue,
        SUM(purchase_cost) as purchase_cost
from operational_margin_selected
group by orders_id,
         date_date 
order by orders_id