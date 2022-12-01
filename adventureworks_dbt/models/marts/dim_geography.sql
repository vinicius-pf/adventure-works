with countries as (
        select 
            country_id
            , country_name
        from {{ref('src_countryregion')}}
    )

    , provinces as (
        select 
            province_id
            , country_id
            , province_name
            , territory_id
        from {{ref('src_stateprovince')}}
    )

    , cities as (
        select
            address_id
            , city_name
            , province_id
            , address_line
        from {{ref('src_address')}}
    )

    , joined_table as (
        select
            cities.city_name
            , cities.address_line
            , provinces.province_name
            , countries.country_name
        from cities
        left join provinces on provinces.province_id = cities.province_id
        left join countries on provinces.country_id = countries.country_id
    )

select *
from joined_table