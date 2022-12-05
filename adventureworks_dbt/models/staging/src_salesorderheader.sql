select 
    salesorderid as sales_order_id
    , salespersonid as sales_person_id
    , customerid as customer_id
    , billtoaddressid as address_id
    , creditcardid as credit_card_id
    , taxamt as tax_amount
    , orderdate as order_date
    , freight
    , duedate as due_date
    , shipdate as ship_date
    , case 
        when "status" = 1 then "In process"
        when "status" = 2 then "Approved"
        when "status" = 3 then "Backordered"
        when "status" = 4 then "Rejected"
        when "status" = 5 then "Shipped"
        when "status" = 6 then "Cancelled"
      end as sale_status
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'salesorderheader')}}