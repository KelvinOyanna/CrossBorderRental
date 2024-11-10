with final as (
    select country,
    count(customer_id) as total_customers
from country
join city
on country.country_id = city.country_id
join address addr on city.city_id = addr.city_id
inner join customer cstmr on addr.address_id = cstmr.address_id
group by cntry.country
order by customers
limit 5)

select *
from final