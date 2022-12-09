with products as (
        select 
            product_id
            , product_name
            , list_price
        from {{ref('src_product')}}
    )

    , sales_order_details as (
        select 
            sales_order_id
            , sales_detail_id
            , product_id
            , order_qty
            , unit_price
        from {{ref('src_salesorderdetail')}}
    )

    , joining_tables as (
        select
            sales_order_details.sales_order_id
            , sales_order_details.sales_detail_id
            , sales_order_details.product_id
            , sales_order_details.order_qty
            , sales_order_details.unit_price
            , products.list_price
            , products.product_name
        from sales_order_details
        left join products on products.product_id = sales_order_details.product_id
    )

select *
from joining_tables