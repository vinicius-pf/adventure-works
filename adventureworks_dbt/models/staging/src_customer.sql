select 
    customerid as costumer_id
    , personid as person_id
    , territoryid as territory_id
    , storeid as store_id
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'customer')}}