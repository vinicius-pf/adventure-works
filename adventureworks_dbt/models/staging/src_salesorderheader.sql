select 
    salesorderid
    , salespersonid
    , customerid
    , territoryid
    , billtoaddressid
    , shipmethodid
    , taxamt
    , status
    , orderdate
    , creditcardid
    , freight
    , purchaseordernumber
    , duedate
    , shipdate
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'salesorderheader')}}