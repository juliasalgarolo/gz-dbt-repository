The finance team has communicated that they want the following data at a daily granularity:
Date
Total number of transactions
Total revenue
Average Basket
Operational Margin
Total purchase cost
Total shipping fees
Total log costs
Total quantity of products sold.


select  date_date,
        count(distinct orders_id) as nb_of_transactions,
        round(sum(revenue),0) as revenue,
        round(sum(margin),0) as margin,
        round(sum(operational_margin),0) as operational_margin,
        round(sum(purchase_cost),0) as purchase_cost,
        round(sum(shipping_fee),0) as shipping_fee,
        round(sum(logcost),0) as log_cost,
        round(sum(ship_cost),0) as ship_cost,
        sum(quantity) as quantity
from {{ ref('int_orders_operational') }} 
group by date_date 