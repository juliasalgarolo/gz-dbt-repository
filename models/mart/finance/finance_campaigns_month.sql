select  extract(month from date_date) as date_month,
        sum(ads_margin) as ads_margin,
        round(sum(average_basket),2) as average_basket,
        sum(operational_margin) as operational_margin,
        sum(ads_cost) as ads_cost,
        sum(impressions) as impressions,
        sum(clicks) as clicks,
        sum(quantity) as quantity,
        sum(revenue) as revenue,
        sum(purchase_cost) as purchase_cost,
        sum(margin) as margin,
        sum(shipping_fee) as shipping_fee,
        sum(log_cost) as log_cost,
        sum(ship_cost) as ship_cost
from {{ ref('finance_campaigns_day') }}
group by date_month