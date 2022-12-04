with person_table as (
    select 
        businessentityid as businessentity_id
        , firstname
        , middlename
        , lastname
        , case
            when middle name is null then concat(firstname, ' ', lastname) 
            else concat(firstname, ' ', middlename, ' ', lastname)
          end as full_name
        , _sdc_received_at as ind_extraction_date
    from {{ source('adventure_works_etl', 'person')}}
)

select *
from person_table