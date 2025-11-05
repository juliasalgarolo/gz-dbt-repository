with cost as (
select 
    product.products_id,
    revenue,
    quantity,
    purchase_price,
    purchase_price * quantity as purchase_cost
from
    {{ ref('stg_raw__sales') }} as sales
inner join
    {{ ref('stg_raw__product') }} as product
ON (sales.products_id = product.products_id)
) 

select 
    products_id,
    revenue,
    quantity,
    purchase_price,
    purchase_cost,
    ROUND(revenue - purchase_cost, 2) as margin 
from cost as int_sales_margin
