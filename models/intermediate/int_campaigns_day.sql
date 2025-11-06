select *
from {{ ref('int_campaigns') }}
group by date_date