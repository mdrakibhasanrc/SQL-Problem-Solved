1.Find the domestic and international sales for each movie.

SELECT
   m.title,
   b.Domestic_sales,
   b.International_sales
 from Movies m
 join Boxoffice b on m.id=b.Movie_id;

2. Show the sales numbers for each movie that did better internationally rather than domestically.

SELECT 
   title, 
   domestic_sales, 
   international_sales
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;

3. List all the movies by their ratings in descending order.

SELECT 
   m.title, 
   b.Rating
FROM movies m
  JOIN boxoffice b
    ON m.id = b.movie_id
order by Rating desc;

4. Find the list of all buildings that have employees.

SELECT 
 DISTINCT building
 FROM employees;

5.Find the list of all buildings and their capacity.

SELECT 
  Building_name,
  Capacity
from Buildings;


6.List all buildings and the distinct employee roles in each building.

SELECT DISTINCT building_name, role 
FROM buildings 
  LEFT JOIN employees
    ON building_name = building;


7.Find the name and role of all employees who have not been assigned to a building.

SELECT 
    name,
    role
FROM employees
where building is null;

8. Find the names of the buildings that hold no employees.

SELECT DISTINCT building_name
FROM buildings 
  LEFT JOIN employees
    ON building_name = building
WHERE role IS NULL;

9. List all movies and their combined sales in millions of dollars.

select
  m.title,
  (b.Domestic_sales+b.International_sales)/100000 as Gross_sale_milion
 from movies m
 join Boxoffice b on m.id=b.Movie_id;

10. List all movies and their ratings in percent.

select
  m.title,
  (b.rating*10) as Gross_sale_milion
 from movies m
 join Boxoffice b on m.id=b.Movie_id;

11. List all movies that were released on even number years.

SELECT 
   title,
   year
FROM movies
WHERE year % 2 = 0;