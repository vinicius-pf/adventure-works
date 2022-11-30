select *
from {{ source('hr', 'raw_e')}}