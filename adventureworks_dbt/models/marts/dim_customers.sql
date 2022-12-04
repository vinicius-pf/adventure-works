with person as (
    select
        businessentity_id
        , full_name
    from {{ref('src_person')}}
    )

    , customer as (
        select
            person_id
            , costumer_id
        from {{ref('src_customer')}}
    )

    , joining_tables as (
        select 
            person.businessentity_id
            , person.full_name
            , customer.costumer_id
        from person
        left join customer on customer.person_id = person.businessentity_id
    )

select * 
from joining_tables 
