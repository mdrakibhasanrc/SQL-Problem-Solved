1. List all the Canadian cities and their populations.

SELECT 
   City,
   population
from North_american_cities
where
   country='Canada'

2. Order all the cities in the United States by their latitude from north to south.

SELECT
  city, latitude
FROM north_american_cities
WHERE 
  country = "United States"
ORDER BY 
   latitude DESC;

3. List all the cities west of Chicago, ordered from west to east.

SELECT
 city, longitude
FROM north_american_cities
WHERE 
  longitude < -87.629798
ORDER BY
    longitude ASC;

4. List the two largest cities in Mexico (by population).

select
  *
from North_american_cities
where
   country='Mexico'
order by
  Population desc
 limit 2;
  

5. List the third and fourth largest cities (by population) in the United States and their population.

SELECT 
  city,
  population
FROM north_american_cities
WHERE
 country LIKE "United States"
ORDER BY 
  population DESC
LIMIT 2 OFFSET 2;


6. Write a query to return the name of the store and its manager, that generated the most sales.

select
  store,
  manager
from sales_by_store
order by
  total_sales desc
 limit 1;

7. Write a query to find the top 3 film categories that generated the most sales.

select
  category
 from sales_by_film_category
order by
   total_sales desc
limit 3;


8. Write a query to return the titles of the 5 shortest movies by duration.

select
   title
 from film
 order by
    length asc
limit 5;

9. Write a SQL query to return this staff's first name and last name.
Picture field contains the link that points to a staff's profile image.
There is only one staff who doesn't have a profile picture.
Use colname IS NULL to identify data that are missing.

select
  first_name,
  last_name
from staff
where 
  picture is null;

10. SELECT 
    EXTRACT(YEAR FROM payment_ts) AS year,
    EXTRACT(MONTH FROM payment_ts) AS mon,
    SUM(amount) as rev
FROM payment
GROUP BY year, mon
ORDER BY year, mon;

