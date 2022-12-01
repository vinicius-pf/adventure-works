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
        from  {{ref('src_salesorderheadersalesreason')}}
    )

    , sales_reason_combined as (
        select
            sales_order_header_reason.sales_order_id
            , sales_reason.reason_type
        from sales_reason
        left join sales_order_header_reason on sales_order_header_reason.sales_reason_id = sales_reason.sales_reason_id
    )

    , final_table as (
        select *
        from sales_reason_combined
        where sales_order_id is not null
    )

select *
from final_table