select 
    countryregioncode as country_id
    , name as country_name
    , _sdc_received_at as ind_extraction_date
from {{ source('adventure_works_etl', 'countryregion')}}