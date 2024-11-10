with days_difference as (
    select inventory_id,
    date_part('day', return_date - rental_date) as date_difference
    from rental
    ),

final as (
    select film.film_id,
        case when date_difference < rental_duration then 'Returned early'
        when date_difference = rental_duration then 'Returned on time'
        else 'Returned late'
        end AS return_status
    from film
    join inventory
    using(film_id)
    join days_difference
    USING(inventory_id)
    )

select 
    return_status, 
    count(film_id) total_films
from final
group by return_status
