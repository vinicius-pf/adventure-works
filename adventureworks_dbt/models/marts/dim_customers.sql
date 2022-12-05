with person as (
    select
        businessentity_id
        , full_name
        , person_type
    from {{ref('src_person')}}
    where person_type = 'IN'
    )

    , customer as (
        select
            person_id
            , customer_id
        from {{ref('src_customer')}}
    )

    , joining_tables as (
        select 
            person.businessentity_id
            , customer.customer_id
            , person.full_name
        from person
        left join customer on customer.person_id = person.businessentity_id
    )

select * 
from joining_tables 
