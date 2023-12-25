-- retrieve the first_name and last_name of the  customers who have postal code with '35'

select * from customer;
select * from address;

select * from customer c inner join rental r on c.customer_id= r.customer_id
inner join staff s on r.staff_id=s.staff_id
inner join address a on s.address_id=a.address_id
 where postal_code = (select postal_code from address where postal_code like '35_%') ;


--- display the titles and rental rates of films that have a rental rate between 2.00 and 3.00

select * from film;
select title, rental_rate from film where rental_rate between 2.00 and 3.00;

--- list the names and the release year of the films released in the 21 st century (after the year 2000 ),orderead by release year 

select * from film;

select title , description, release_year from film  where release_year >2000 order by release_year; 


--- find the actors whose last names contain the letter 'a' oreder the result alphabatically by last name

select* from actor;

select first_name, last_name from actor where last_name like '%A%'  order by last_name ;


---  retrieve the film titles and rental duration of the top 5 longest films (ordered by rental_duration) 

select*from film;
select title, description , rental_duration from film order by rental_duration desc limit 5;

--- list the name of the customers who have made more than 20 rentals ,order by the no of rentals in descending order.

select * from rental;
select c.first_name ,count(r.rental_id) as rental_count from customer c join rental r on c.customer_id=r.customer_id  group by c.first_name having rental_count >20 order by rental_count desc ;


--- display first and last name of the actor who have made appeared in at least 3 films, ordered by the number of films in descending order.

select * from film_actor;
select * from actor ;
select a.first_name, a.last_name , count(fa.film_id) as no_of_films from actor a join film_actor fa on a.actor_id=fa.actor_id group by a.actor_id having no_of_films >=3 order by no_of_films desc;

--- find the films that have a replacement cost greater than 20.00 and rental rate less than 3.00

select * from film;
select title, replacement_cost, rental_rate from film where replacement_cost > 20 and rental_rate < 3;

--- retrieve the customer names and their total payments,order by total payments in descending order and limit the result to 10 rows

select * from payment;
 
 select c.first_name , sum(p.amount) as total_amount 
 from customer c
 join payment p on c.customer_id=p.customer_id
 group by c.first_name
 order by total_amount desc
 limit 10;
 
 
---  list the titles and release years of films  released year before the year 2005,ordered by release year in ascending order,and limit the reslt to 5 rows.

select * from film;
select title, release_year from film where release_year < 2005 order by release_year asc limit 5;