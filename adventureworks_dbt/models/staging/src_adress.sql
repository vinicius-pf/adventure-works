select 
    addressid
    , city
    , stateprovinceid
    , addressline1 as addressline
    , _sdc_received_at as ind_extraction_date
from {{ source('adventure_works_etl', 'adress')}}