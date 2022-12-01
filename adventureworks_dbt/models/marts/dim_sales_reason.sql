with sales_reason as (
        select 
            sales_reason_id
            , reason_name
            , reason_type
        from {{ref('src_salesreason')}}
    )

    , sales_order_header_reason as (
        select 
            sales_order_id
            , sales_reason_id
        from  from {{ref('src_salesorderheadersalesreason')}}
    )

    , sales_reason_combined as (
        select
            sales_reason_id
            , sales_order_id
            , reason_name
        from sales_reason
        left join sales_order_header_reason on sales_order_header_reason.sales_reason_id = sales_reason.sales_reason_id
    )

select *
from sales_reason_combined