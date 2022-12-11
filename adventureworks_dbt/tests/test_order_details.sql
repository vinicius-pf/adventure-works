/* This will test if all orders on the fact table are correctly detailed on dim_order_details
If there are any orders on fct_sales_header without detail, the test will fail.*/

with orders as (
    select sales_order_id
    from {{ref('dim_order_details')}}
)

select sales_order_id
from {{ref('fct_sales_header')}}
where sales_order_id not in (select sales_order_id from orders)