with 
    dates_raw as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('1970-01-01' as date)",
        end_date="date_add(current_date(), interval 10 year)"
        )
    }}
    )

    , days_info as (
        select 
            cast(date_day as date) as cd_data
            , extract(month from date_day) as date_month
            , extract(quarter from date_day) as date_quarter
            , extract(year from date_day) as year
        from dates_raw
    )

    , days_named as (
        select
            cd_data
            , date_month
            , date_quarter
            , year
            , case
                when date_month = 1 then 'January'
                when date_month = 2 then 'February'
                when date_month = 3 then 'March'
                when date_month = 4 then 'April'
                when date_month = 5 then 'May'
                when date_month = 6 then 'June'
                when date_month = 7 then 'July'
                when date_month = 8 then 'August'
                when date_month = 9 then 'September'
                when date_month = 10 then 'October'
                when date_month = 11 then 'November'
                else 'December' 
            end as month_name
            , case
                when date_month = 1 then 'Jan.'
                when date_month = 2 then 'Fev.'
                when date_month = 3 then 'Mar.'
                when date_month = 4 then 'Apr.'
                when date_month = 5 then 'May'
                when date_month = 6 then 'June'
                when date_month = 7 then 'July'
                when date_month = 8 then 'Aug.'
                when date_month = 9 then 'Sept.'
                when date_month = 10 then 'Oct.'
                when date_month = 11 then 'Nov.'
                else 'Dec.' 
            end as month_ab
        from days_info
    )

select *
from days_named