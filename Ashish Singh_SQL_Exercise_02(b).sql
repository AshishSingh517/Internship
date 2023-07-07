-- Actor Table
-- 1.0
SELECT first_name,last_name FROM actor;

--2.0
SELECT first_name,last_name FROM actor
limit 5;

--3.0
SELECT first_name,last_name, 
last_update
from actor
order by last_update
asc
limit 5;
 
--4.0
SELECT last_name, COUNT(last_name) as totalrepetitions
FROM  actor
GROUP BY last_name
ORDER BY totalrepetitions DESC
LIMIT 5;

--5.0
SELECT first_name,COUNT(first_name) as totalrepetitions
FROM actor
GROUP BY first_name
ORDER BY totalrepetitions DESC
LIMIT 6;

--Film Table
--6.0
SELECT COUNT(*) FROM film

--7.0
SELECT 
AVG(length) as avglength
FROM film;

 --8.0
 SELECT rating, COUNT(*) FROM Film 
GROUP BY rating
 
 --9.0
 select *from film 
WHERE categories LIKE '%HORROR%'
 --10.0
 SELECT title FROM film WHERE title LIKE '%CAT%'
 
 --Category
 --11.0
 SELECT COUNT(*) 
 FROM  category;
 select * from category
 
 --12.0
SELECT name, COUNT(*) FROM category 
GROUP BY name
HAVING COUNT(name) > 1 ;

--Country & City
 --13.0
SELECT 
    COUNT(distinct country) as num_countries,
    COUNT(city) as num_cities
FROM 
    country b
LEFT JOIN 
    city c ON b.country_id = c.country_id;

--14.0
SELECT
    distinct country as countries,
    array_agg(city) as cities
FROM 
    country b
LEFT JOIN 
    city c ON b.country_id = c.country_id
Group by countries
order by countries;
--15.0
SELECT first_name,last_name,active 
FROM customer where active=1;
--16.0
 select email, count(concat(first_name,' ',last_name))as name from customer 
 group by email ;

--17.0
Select last_name, from customer
group by last_name;

--film_category
--18.0
select count(*) from film_category

--19.0
SELECT COUNT(*) FROM inventory;