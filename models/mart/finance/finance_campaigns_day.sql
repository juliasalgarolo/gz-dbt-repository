--ads_margin = operational_margin - ads_cost


with finance_campaigns_day as (
select  date_date,
        average_basket,
        operational_margin,
        ads_cost,
        impressions,
        clicks,
        quantity,
        revenue,
        purchase_cost,
        margin,
        shipping_fee,
        log_cost,
        ship_cost
from {{ ref('finance_days') }}
join {{ ref('int_campaigns_day') }}
using (date_date)
)

select  date_date,
        operational_margin-ads_cost as ads_margin,
        average_basket,
        operational_margin,
        ads_cost,
        impressions,
        clicks,
        quantity,
        revenue,
        purchase_cost,
        margin,
        shipping_fee,
        log_cost,
        ship_cost
from finance_campaigns_day