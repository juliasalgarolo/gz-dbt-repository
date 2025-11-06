with cost as (
select 
    product.products_id,
    orders_id,
    date_date,
    revenue,
    quantity,
    purchase_price,
    product.purchase_price * sales.quantity as purchase_cost
from
    {{ ref('stg_raw__sales') }} as sales
left join
    {{ ref('stg_raw__product') }} as product
    using (products_id)
) 

select 
    products_id,
    orders_id,
    date_date,
    revenue,
    quantity,
    purchase_price,
    purchase_cost,
    ROUND(revenue - purchase_cost, 2) as margin 
from cost
