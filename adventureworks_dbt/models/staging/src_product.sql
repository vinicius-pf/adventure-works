select 
    productid
    , name
    , size
    , class
    , listprice
    , standardcost
    , discontinueddate
    , _airbyte_emitted_at as ind_extraction_date
from {{source('adventure_works_etl', 'product')}}