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
            , store_id
        from {{ref('src_customer')}}
    )

    , store as (
        select
            store_id
            , store_name
        from {{ref('src_store')}}
    )

    , joining_tables as (
        select 
            customer.customer_id
            , person.full_name
            , store.store_name
            , case
                when person.full_name is null then store.store_name
                when store.name is null then person.full_name
            end as customer_name
        from customer
        left join person on person.businessentity_id = customer.person_id
        left join store on store.store_id = customer.store_id
    )

select * 
from joining_tables 
