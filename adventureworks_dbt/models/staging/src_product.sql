select 
    productid as product_id
    , name as product_name
    , size as product_size
    , listprice as list_price
    , standardcost as standard_cost
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'product')}}