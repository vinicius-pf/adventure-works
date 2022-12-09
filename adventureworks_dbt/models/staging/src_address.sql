select 
    addressid as address_id
    , city as city_name
    , stateprovinceid as province_id
    , addressline1 as address_line
    , _sdc_received_at as ind_extraction_date
from {{ source('adventure_works_etl', 'address')}}