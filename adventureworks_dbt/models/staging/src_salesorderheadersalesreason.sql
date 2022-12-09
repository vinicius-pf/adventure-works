select 
    salesorderid as sales_order_id
    , salesreasonid as sales_reason_id
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'salesorderheadersalesreason')}}