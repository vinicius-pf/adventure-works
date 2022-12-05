select
    territoryid
    , countryregioncode
    , name
    , saleslastyear
    , "group" as territory_group
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'salesterritory')}}