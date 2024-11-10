with sales_by_country as (
    select distinct (country.country) country, 
    sum(payment.amount) as total_sales,
    count(customer.customer_id) as total_customers
from country
join city 
on country.country_id = city.country_id
join address
on city.city_id = address.city_id
join customer
on address.address_id = customer.address_id
join payment
on customer.customer_id = payment.customer_id
group by country
order by total_sales desc, total_customers desc
limit 5
)

select *
from sales_by_country