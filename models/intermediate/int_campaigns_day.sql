select  date_date,
        SUM(ads_cost) as ads_cost,
        SUM(impressions) as impressions,
        SUM(clicks) as clicks
from {{ ref('int_campaigns') }}
group by date_date 
order by date_date desc
