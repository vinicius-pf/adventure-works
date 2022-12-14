with sales_order_header as (
    select
        sales_order_id
        , sales_person_id
        , customer_id
        , address_id
        , credit_card_id
        , tax_amount
        , order_date
        , freight
        , due_date
        , ship_date
        , sale_status
        , is_online_order
    from {{ref('src_salesorderheader')}}
)

select *
from sales_order_header