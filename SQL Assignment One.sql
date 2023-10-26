select count(last_name)
from actor
where last_name = 'Wahlberg';

select amount, count(amount)
from payment
group by amount
having amount between 3.99 and 5.99
order by amount;

select film.title, inventory.store_id, count(inventory.film_id) as film_count
from inventory
inner join film on inventory.film_id = film.film_id
group by film.title, inventory.store_id order by film_count desc, inventory.store_id asc, film.title asc;
--because both stores have so many rentals with a count of 4, I'm unsure this is the right answer, but it appears correct..

select count(last_name)
from Customer
where last_name = 'William';

select staff_id, count(staff_id) as staff_sales
from rental
group by staff_id order by staff_sales desc;
-- Understand concept of LIMIT, but not including because I'm not sure which saves more space, leaving out the code, or leaving it in..

select count(distinct(district)) as district_count;
from address;

select film.title, film.film_id, count(distinct(film_actor.actor_id)) as actor_count
from film_actor
join film on film_actor.film_id = film.film_id
group by film.title, film.film_id order by actor_count desc;

with LNameCount as (
	select last_name, count(last_name)
	from customer
	where store_id = 1 and last_name like '%es'
	group by last_name
)
select count(last_name)
from LNameCount;

with HighRentalCountAmounts as (
	select amount, count(rental_id) as rental_count
	from payment
	where customer_id between 380 and 430
	group by amount
	having  count(rental_id) > 250
)
select count(amount) 
from HighRentalCountAmounts;

select rating, count(rating) as rating_count
from film
group by rating;