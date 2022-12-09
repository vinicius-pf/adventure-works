with stores as (
    select 
        businessentityid as store_id
        , name as store_name
        , _sdc_received_at as ind_extraction_date
    from {{ source('adventure_works_etl', 'store')}}
)

select *
from stores