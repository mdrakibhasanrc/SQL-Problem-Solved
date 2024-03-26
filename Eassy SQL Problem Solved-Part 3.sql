1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

select 
  *
from CITY
where
  CountryCode='USA' and
  population > 100000;

2.Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

select
   name
from CITY
where
   CountryCode='USA'
and Population > 120000;


3.Query all columns (attributes) for every row in the CITY table.

select 
   *
 from CITY;
 

4. Query all columns for a city in CITY with the ID 1661.

select
  *
from CITY
where
  ID=1661;

5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

select
  *
from City
where
   CountryCode='JPN';

6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

select
  Name
from City
where
  CountryCode='JPN'

7. Query a list of CITY and STATE from the STATION table.

select
  City,
  State
from Station;

8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

select
   distinct(city)
from station
where
  ID%2=0;

9. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

select 
   count(CITY)- count(distinct CITY) 
from STATION;

10. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

select CITY, length(CITY) from STATION order by length(CITY), CITY limit 1;
select CITY, length(CITY) from STATION order by length(CITY) desc, CITY limit 1;



11. Find the title of each film.

SELECT 
   title
FROM movies;

12. Find the director of each film.

SELECT 
   director
FROM movies;

13.Find the title and director of each film.

SELECT 
   director,
   title
FROM movies;

14.Find the title and year of each film.

SELECT 
   title,
   year
FROM movies;

15. Find all the information about each film.

SELECT 
   *
FROM movies;

16. Find the movie with a row id of 6.

SELECT 
   *
FROM movies
where 
   id=6;

17. Find the movies released in the years between 2000 and 2010.

SELECT 
   *
FROM movies
where 
   year between 2000 and 2010;

18. Find the movies not released in the years between 2000 and 2010.

SELECT 
   *
FROM movies
where 
   year not between 2000 and 2010;

19. Find the first 5 Pixar movies and their release year.

SELECT 
   title,
   year
FROM movies
limit 5;

20. Find all the Toy Story movies.
SELECT 
   title,
   director 
FROM movies 
WHERE
   title LIKE "Toy Story%";

21. Find all the movies directed by John Lasseter.

SELECT
   *
from movies
where 
   Director like 'John Lasseter';

22.Find all the movies (and director) not directed by John Lasseter.

SELECT
   *
from movies
where 
   Director not like 'John Lasseter';

23. Find all the WALL-* movies.
SELECT 
   *
FROM movies 
WHERE 
   title LIKE "WALL-_";

24. List all directors of Pixar movies (alphabetically), without duplicates.

SELECT
 DISTINCT director
FROM movies
ORDER BY
   director ASC;

25. List the last four Pixar movies released (ordered from most recent to least).

SELECT 
   *
FROM movies
ORDER BY 
    Year DESC
limit
     4;


26.List the first five Pixar movies sorted alphabetically.

SELECT 
   *
FROM movies
ORDER BY 
    Title asc
limit
     5;

27. List the next five Pixar movies sorted alphabetically.

SELECT 
   title
FROM movies
ORDER BY
    title ASC
LIMIT 5 OFFSET 5; 