select 
    salesorderid
    , salesreasonid
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'salesorderheadersalesreason')}}