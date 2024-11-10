
  create view "dvdrental"."transformation"."top_loyal_customers__dbt_tmp"
    
    
  as (
    with customer_activity as (
select 
    customer.first_name,
    customer.last_name,
    concat(country.country, ' | ', city.city, ', ', address.address) as customer_address,
    count(payment.rental_id) as no_of_rentals,
    sum(payment.amount) as total_amount_paid
from rental
join customer
using(customer_id)
join payment
using(customer_id)
left join address 
using(address_id)
left join city
using(city_id)
left join country
using (country_id)
group by 1, 2, 3
order by total_amount_paid desc
)

select *
from customer_activity
  );