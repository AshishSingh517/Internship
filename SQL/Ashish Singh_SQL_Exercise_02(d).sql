 --Aggregate Queries
--1.0
SELECT a.actor_id, a.first_name,a.last_name,COUNT(*) AS "Movie Count"
FROM actor a
JOIN film_actor f ON a.actor_id = f.actor_id
JOIN film i ON f.film_id = i.film_id
GROUP BY a.actor_id, a.first_name
ORDER BY "Movie Count" DESC;

--2.0
SELECT a.actor_id, a.first_name,a.last_name, count(i.rating) AS "average_rating"
FROM actor a
JOIN film_actor f ON a.actor_id = f.actor_id
JOIN film i ON f.film_id = i.film_id
GROUP BY a.actor_id, a.first_name
ORDER BY "average_rating" DESC
LIMIT 1;

--3.0
Select language_id,count(*) as number
from film
group by language_id

--4.1
SELECT s.store_id, f.title, COUNT(i.film_id) AS movie_count
FROM store s
JOIN inventory  i ON i.store_id = s.store_id
JOIN film f ON f.film_id = i.film_id
GROUP BY s.store_id, f.title
order by movie_count desc;

--4.2
SELECT 
  COUNT (Distinct(film_id) )
FROM inventory
GROUP BY store_id;

--5.0
SELECT AVG(length) from film;

--6.0
SELECT  MAX(length) from film 
GROUP BY language_id
ORDER BY language_id desc
LIMIT 1;

--7.0
SELECT l.name,
COUNT(rating) as rating
FROM language l
JOIN film f ON f.language_id = l.language_id
GROUP BY l.name
ORDER BY rating DESC
LIMIT 1;
--8.0
SELECT c.name, COUNT(f.film_id) AS film
FROM category c
JOIN film_category f ON f.category_id =c.category_id
GROUP BY c.name
order by film desc;

--9.0
SELECT a.actor_id,a.first_name,a.last_name,COUNT(*) AS number
FROM actor a
JOIN film_actor fa on a.actor_id=fa.actor_id
JOIN film_category fc on fa.film_id =fc.film_id
JOIN category c on fc.category_id = c.category_id
where c.name like'%Horror'
GROUP BY a.actor_id
ORDER BY number
LIMIT 3;
--10.0
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS num_movies
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name='Action' or c.name='Romantic'
GROUP BY a.actor_id
ORDER BY num_movies DESC;
LIMIT 3;
--11.0
SELECT c.country, COUNT(DISTINCT f.film_id)
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN customer cus ON cus.customer_id = r.customer_id
JOIN address a ON a.address_id = cus.address_id
JOIN city ci ON ci.city_id = a.city_id
JOIN country c ON c.country_id = ci.country_id
GROUP BY c.country
ORDER BY COUNT(DISTINCT f.film_id) DESC;

--13.0
SELECT s.store_id, COUNT(st.staff_id) AS num_employees
FROM store s
INNER JOIN staff st ON s.store_id = st.store_id
GROUP BY s.store_id;

--15.0
SELECT 
  s.staff_id,
  s.first_name || ' ' || s.last_name AS staff_name,
  COUNT(r.rental_id) AS num_rentals,
  SUM(f.rental_rate) AS total_earnings
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY s.staff_id
ORDER BY num_rentals DESC;