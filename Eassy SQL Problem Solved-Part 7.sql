1.Weather Observation Station 06:

select 
   distinct city
 from station
 where city like 'a%' or
       city like 'e%'  or
       city like 'i%'  or
       city like 'o%'  or
       city like 'u%' ;

2.Weather Observation Station 06:

select 
   distinct city
 from station
 where city like '%a' or
       city like '%e'  or
       city like '%i'  or
       city like '%o'  or
       city like '%u' ;

3. Weather Observation Station 08:

select 
   distinct city 
from station 
    where left(city,1) in('a','e','i','o','u') and
    right(city,1) in('a','e','i','o','u') 
;

4. Weather Observation Station 09:

select 
   distinct city 
from station 
    where left(city,1) not in('a','e','i','o','u');

5. Weather Observation Station 10:

select 
   distinct city 
from station 
    where right(city,1) not in('a','e','i','o','u');

6. Weather Observation Station 11:

select 
   distinct city 
from station 
    where left(city,1) not in('a','e','i','o','u') or
    right(city,1) not in('a','e','i','o','u');

7. Weather Observation Station 12:

select 
   distinct city 
from station 
    where left(city,1)not in('a','e','i','o','u') and
    right(city,1) not in('a','e','i','o','u') 
;

8. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

select
   name
from students
 where 
    marks >75
order by right(name,3) asc,ID asc;

9. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

select
  name
from employee
order by 
    name asc;

10. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.

select
  name
from employee
where
  salary > 2000 and months <10
order by 
    employee_id asc;

