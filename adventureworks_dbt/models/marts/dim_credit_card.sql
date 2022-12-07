with credit_card as (
    select
        credit_card_id
        , card_type
    from {{ref('src_creditcard')}}
)

select *
from credit_card