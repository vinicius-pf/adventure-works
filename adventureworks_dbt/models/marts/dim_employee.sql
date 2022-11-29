with employee as (
        select * 
        from {{ref('src_employee')}}
    )
    
    , salesperson as (
        select *
        from {{ref('src_salesperson')}}
    )

    