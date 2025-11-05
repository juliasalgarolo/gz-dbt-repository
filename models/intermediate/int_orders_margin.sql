select  orders_id,
        date_date,
        SUM(revenue) as revenue,
        SUM(quantity) as quantity,
        SUM(purchase_cost) as purchase_cost,
        sum(margin) as margin
from {{ ref("int_sales_margin") }}
group by orders_id, 
         date_date
order by orders_id