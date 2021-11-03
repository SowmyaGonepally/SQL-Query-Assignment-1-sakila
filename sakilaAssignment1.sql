/*

Assigned
1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.
2. Find out the top 3 rented horror movies.
3. Find out the list of customers from India who have rented sports movies.
4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.
5. Find out the number of movies in which “SEAN WILLIAMS” acted.

*/

-- 1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

SELECT film.title as PG_13_RATED_COMEDY_MOVIES FROM 
film INNER JOIN film_category
ON film.film_id=film_category.film_id
INNER JOIN category 
ON film_category.category_id=category.category_id
WHERE rating='PG-13' AND category.name='Comedy';

-- 2. Find out the top 3 rented horror movies.
select film.title, count(*) as total
from rental inner join inventory
on rental.inventory_id=inventory.inventory_id
inner join film_category
on inventory.film_id=film_category.film_id
inner join category
on film_category.category_id=category.category_id
inner join film
on film_category.film_id=film.film_id
where category.name='Horror'
group by film.title
order by count(*) desc;

-- 3. Find out the list of customers from India who have rented sports movies.
select distinct first_name,last_name,category.name,country.country
from customer inner join address
on customer.address_id=address.address_id
inner join city 
on address.city_id=city.city_id
inner join country
on city.country_id=country.country_id
inner join rental
on customer.customer_id=rental.customer_id
inner join inventory
on rental.inventory_id=inventory.inventory_id
inner join film_category
on inventory.film_id=film_category.film_id
inner join category
on category.category_id=film_category.category_id
where category.name='Sports' and country.country='India'


-- 4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.
select distinct customer.first_name,customer.last_name,actor.first_name,actor.last_name
from customer inner join address
on customer.address_id=address.address_id
inner join city 
on address.city_id=city.city_id
inner join country
on city.country_id=country.country_id
inner join rental
on customer.customer_id=rental.customer_id
inner join inventory
on rental.inventory_id=inventory.inventory_id
inner join film
on inventory.film_id=film.film_id
inner join film_actor
on film.film_id=film_actor.film_id
inner join actor
on film_actor.actor_id=actor.actor_id
where country.country='Canada' and actor.first_name='NICK' and actor.last_name='WAHLBERG'

-- 5. Find out the number of movies in which “SEAN WILLIAMS” acted.
select count(film_id) as number_of_movies
from actor inner join film_actor
on actor.actor_id=film_actor.actor_id
where actor.first_name='SEAN' and actor.last_name='WILLIAMS';

