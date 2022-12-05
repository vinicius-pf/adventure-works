select 
    businessentityid as businessentity_id
    , gender
    , hiredate as hire_date
    , jobtitle as job_title
    , currentflag as current_flag
    , modifieddate as modified_date
    , _sdc_received_at as ind_extraction_date
from {{ source('adventure_works_etl', 'employee')}}