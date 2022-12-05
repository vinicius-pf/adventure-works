with person as (
    select
        businessentity_id
        , full_name
    from {{ref('src_person')}}
    where person_type = 'SP'
    )

    , salesperson as (
        select
            businessentity_id
            , commission_pct
            , sales_last_year
            , bonus
        from {{ref('src_salesperson')}}
    )

    , employee as (
        select
            businessentity_id
            , hire_date
            , job_title
            , current_flag
        from {{ref('src_employee')}}
    )

    , joining_tables as (
        select
            employee.businessentity_id
            , employee.hire_date
            , employee.job_title
            , salesperson.commission_pct
            , salesperson.sales_last_year
            , person.full_name
        from employee
        left join salesperson on salesperson.businessentity_id = employee.businessentity_id
        left join person on person.businessentity_id = employee.businessentity_id
    )

select *
from joining_tables
    