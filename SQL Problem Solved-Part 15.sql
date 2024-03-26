1. Find the longest time that an employee has been at the studio.

SELECT
   name,
   years_employed
FROM employees
order by years_employed desc
limit 1;

2. For each role, find the average number of years employed by employees in that role.

SELECT
   name,
   role,
   avg(years_employed) as avg_years
FROM employees
group by role
order by years_employed desc;

3. Find the total number of employee years worked in each building .

SELECT
building,
   sum(Years_employed) as total
FROM employees
group by building;

4. Find the number of Artists in the studio.

SELECT 
    count(Role)as count
FROM employees
where Role='Artist';

5. Find the number of Employees of each role in the studio.

SELECT 
    role,
    count(Role)as count
FROM employees
group by role;

6. Find the total number of years employed by all Engineers.

SELECT 
    role,
    sum(years_employed) as total
FROM employees
where role='Engineer'
group by role;

7. Find the number of movies each director has directed.

SELECT 
    director,
    count(title)
from movies
group by director;

8. Find the total domestic and international sales that can be attributed to each director.

SELECT 
    m.director,
    sum(b.Domestic_sales+b.International_sales) as total
from movies m
join boxoffice b on m.id=b.movie_id
group by director;

9. Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table.

INSERT INTO boxoffice
VALUES (4, 8.7, 340000000, 270000000);

10. The director for A Bug's Life is incorrect, it was actually directed by John Lasseter.

UPDATE movies
SET director = "John Lasseter"
WHERE id = 2;

11. The year that Toy Story 2 was released is incorrect, it was actually released in 1999

update movies
set year=1999
where id=3;

12. Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich 

UPDATE movies
SET title = "Toy Story 3", director = "Lee Unkrich"
WHERE id = 11;
