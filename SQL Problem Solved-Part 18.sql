1. Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

select
   sum(p.population) as total
from city p
join country c on p.countrycode=c.code
where c.continent='Asia';

2. Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

select
    p.name
from city p
join country c on p.countrycode=c.code
where c.continent='Africa';

3. Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

select
   co.continent,
   floor(avg(ci.population)) as avg_num
from country co
join city ci on ci.CountryCode=co.Code
group by co.Continent;

4. Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 

select 
   p.firstName,
   p.lastName,
   a.city,
   a.state
from Person p
left join  Address a 
on p.personID=a.personID;

5. Write an SQL query to find the employees who earn more than their managers.

select
   e.name as Employee
from employee e
inner join employee m on e.managerid=m.id
where e.salary>m.salary;

6. Write an SQL query to report all the duplicate emails.

select
   email
from person
group by email
having count(email) > 1;

7. Write an SQL query to report all customers who never order anything.

select
   c.name as customers
from customers c
left join orders o on c.id=o.customerid
where o.customerId is null; 

