select 
    salesorderid as sales_order_id
    , salesorderdetailid as sales_detail_id
    , productid as product_id
    , orderqty as order_qty
    , unitprice as unit_price
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'salesorderdetail')}}