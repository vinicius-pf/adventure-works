select *
from {{ source('adventure_works_etl', 'adress')}}