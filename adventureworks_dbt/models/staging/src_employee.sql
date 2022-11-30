select 
    id
    , gender
    , businessentityid
    , hiredate
    , jobtitle
    , currentflag
    , modifieddate
    , maritalstatus
    , _airbyte_emitted_at as ind_extraction_date
from {{ source('adventure_works_etl', 'employee')}}