select
    salesreasonid as sales_reason_id
    , name as reason_name
    , reasontype as reason_type
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'salesreason')}}