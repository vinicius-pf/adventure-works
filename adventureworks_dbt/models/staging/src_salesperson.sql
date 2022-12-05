select
    businessentityid as businessentity_id
    , territoryid as territory_id
    , commissionpct as commission_pct
    , saleslastyear as sales_last_year
    , bonus
    , salesquota as sales_quota
    , _sdc_received_at as ind_extraction_date
from {{ source('adventure_works_etl', 'salesperson')}}