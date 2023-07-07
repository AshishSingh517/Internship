--1.0
SELECT a.first_name, a.last_name,c.title
FROM actor a
join film_actor f on a.actor_id=f.actor_id
join film c on f.film_id=c.film_id
where c.title ='LOST BIRD';

--2.0
SELECT title
FROM film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id=c.category_id
where c.name like'%Sci-Fi%';

--3.0
SELECT a.first_name, a.last_name,c.title
FROM actor a
join film_actor f on a.actor_id=f.actor_id
join film c on f.film_id=c.film_id
where a.first_name='PENELOPE'
AND a.last_name='GUINESS';

--4.0
SELECT a.first_name,a.last_name,f.title,c.name 
FROM actor a
JOIN film_actor fa on a.actor_id = fa.actor_id
JOIN film f on fa.film_id=f.film_id 
JOIN film_category fc on f.film_id = fc.film_id 
JOIN category c on fc.category_id=c.category_id ;
--5.0
SELECT distinct title
from film f 
join inventory i on f.film_id=i.film_id
order by title;

--6.0
SELECT c.name AS genre, f.title AS film_title, cu.first_name || ' ' || cu.last_name AS name
FROM inventory i
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN customer cu ON r.customer_id = cu.customer_id
ORDER BY c.name, f.title;

--7.0
SELECT DISTINCT ON (c.customer_id) c.customer_id, c.first_name || ' ' || c.last_name AS customer_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c2 ON fc.category_id = c2.category_id
WHERE c2.name = 'Horror'
ORDER BY c.customer_id, r.rental_date 
LIMIT 5;

--8.0
SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_name, COUNT(r.rental_id) AS rental_count
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id
ORDER BY rental_count DESC
LIMIT 5;

--9.0
SELECT c.name AS Genrename, COUNT(r.rental_id) AS Rentalcount
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY rentalcount DESC;

--10.0
SELECT c.name AS Genrename, f.title AS movie_title, COUNT(i.inventory_id) AS inventory_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
GROUP BY c.name, f.title
ORDER BY COUNT(i.inventory_id) DESC, c.name, f.title
limit 10;

--11.0
SELECT concat(first_name, ' ',last_name)
from actor a 
left join film_actor f on a.actor_id=f.actor_id
where f.film_id is null;

--12.0
select title 
from film f 
left join inventory i on f.film_id= i.film_id
where i.inventory_id is null;

--13.0
SELECT a.actor_id, concat(first_name,' ',last_name) as name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN inventory i ON fa.film_id = i.film_id
WHERE i.film_id IS NULL;

--14.0  
SELECT a.actor_id, a.first_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN (
  SELECT DISTINCT i.film_id
  FROM inventory i
) i ON fa.film_id = i.film_id
LEFT JOIN (
  SELECT DISTINCT s.store_id, i.film_id
  FROM inventory i
  INNER JOIN store s ON i.store_id = s.store_id
) si ON fa.film_id = si.film_id
WHERE si.store_id IS NULL;

-- 15.0
SELECT s.staff_id, s.first_name
FROM staff s
LEFT JOIN rental r ON s.staff_id = r.staff_id
WHERE r.rental_id IS NULL;

-- 16.0
SELECT c.category_id, c.name
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
WHERE fc.film_id IS NULL;

-- 17.0
SELECT a.actor_id, a.first_name,a.last_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name
HAVING COUNT(DISTINCT c.category_id) = (SELECT COUNT(*) FROM category);

-- 18.0
SELECT a.actor_id, a.first_name,a.last_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film_category fc ON fa.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY a.actor_id, a.first_name
HAVING COUNT(DISTINCT c.category_id) < (SELECT COUNT(*) FROM category);

--19.0
SELECT store_id, address, address2, city, country
FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

 --20.0.
select 	s.store_id
from store s
left join inventory i on s.store_id = i.store_id
where i.inventory_id is null;

--21.0
select 	c.customer_id,first_name
from customer c
left join rental r on c.customer_id = r.customer_id
where r.rental_id is null;

--22.0
SELECT customer_id, first_name, address, address2, city, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country  like'%India%';

-- 23.0
SELECT customer_id, first_name, address, address2, city, country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id

--24.0.
SELECT film_id, title, name AS language
FROM film
JOIN language ON film.language_id = language.language_id
WHERE language.name IN ('Japanese', 'Mandarin');

--25.0
SELECT language.name AS language
FROM language
LEFT JOIN film ON language.language_id = film.language_id
WHERE film.film_id IS NULL;
















