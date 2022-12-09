select
    stateprovinceid as province_id
    , territoryid as territory_id
    , countryregioncode as country_id
    , name as province_name
    , isonlystateprovinceflag
    , _sdc_received_at as ind_extraction_date
from {{ source('adventure_works_etl', 'stateprovince')}}