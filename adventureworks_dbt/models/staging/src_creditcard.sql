select 
    creditcardid as credit_card_id
    , cardtype as card_type
    , _sdc_received_at as ind_extraction_date
from {{source('adventure_works_etl', 'creditcard')}}