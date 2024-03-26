1. Query a count of the number of cities in CITY having a Population larger than 100000.

select
    count(*) as No_city
from city
where population > 100000;

2. Query the total population of all cities in CITY where District is California.

Select
   sum(Population) as Total_population
 from city
 where district ='California';

3. Query the average population of all cities in CITY where District is California.

Select
   avg(Population) as Total_population
 from city
 where district ='California';

4. Query the average population for all cities in CITY, rounded down to the nearest integer.

Select
   round(avg(Population)) as Total_population
 from city;

5. Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

select
   sum(population) as Total_population
  from city
  where
     countrycode='JPN';

6. Query the difference between the maximum and minimum populations in CITY.

select
   (max(population)-min(population)) as Total_population
  from city;

7. Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

select ceil(avg(salary) - avg(replace(salary, '0', ''))) from employees;

8. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

select
   (months*salary) as Earning,
   count(*)
  from Employee
  group by earning
  order by Earning desc
  limit 1;

9. Weather Observation Station 12

select
   round(sum(LAT_N),2),
   round(sum(Long_W),2)
 from station;

10. Weather Observation Station 13:-

select
   TRUNCATE(sum(LAT_N),4)
 from station 
 where LAT_N > 38.7880 and LAT_N < 137.2345;

11. Weather Observation Station 14

select
   TRUNCATE((LAT_N),4)
 from station 
 where  LAT_N < 137.2345
 order by LAT_N desc
 limit 1;

12. Weather Observation Station 15:-

SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

13. Weather Observation Station 16:-

SELECT ROUND(LAT_N,4)
FROM STATION
WHERE LAT_N > 38.7780
order by LAT_N asc
limit 1;

14. Weather Observation Station 17:-

SELECT ROUND(LONG_W,4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);

