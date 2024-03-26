1. Find the longest time that an employee has been at the studio.

SELECT 
   MAX(years_employed) as Max_years_employed
FROM employees;

2. For each role, find the average number of years employed by employees in that role.

SELECT 
    role,
   avg(years_employed) as Avg_years_employed
FROM employees
group by role;

3. Find the total number of employee years worked in each building.

SELECT 
    building,
   sum(years_employed) as total_years_employed
FROM employees
group by building;

4. Find the number of Artists in the studio (without a HAVING clause).

SELECT 
    count(*) as number_of_artist
FROM employees
where
  role='Artist';

5. Find the number of Employees of each role in the studio.

SELECT 
    role,
    count(*) as number_of_employe
FROM employees
group by role;

6. Find the total number of years employed by all Engineers.

SELECT 
    role,
    sum(years_employed) as number_of_employe
FROM employees
where role='Engineer';

7. Select the maximum price of any item ordered in the items_ordered table. Hint: Select the maximum price only.

select
   max(price)
 from ITEMS_ORDERED;

8. Select the average price of all of the items ordered that were purchased in the month of Dec.

select
   avg(price) as avg_price
 from ITEMS_ORDERED
 where 
   order_date like '%dec%';

9. What are the total number of rows in the items_ordered table?

select
   count(*) as total_no
 from ITEMS_ORDERED;

10. For all of the tents that were ordered in the items_ordered table, what is the price of the lowest tent? Hint: Your query should return the price only.

select
   min(price) as lowest_price
 from ITEMS_ORDERED
 where item='Tent';

11. How many people are in each unique state in the customers table? Select the state and display the number of people in each.

SELECT state, count(state)
FROM customers
GROUP BY state;

12. From the items_ordered table, select the item, maximum price, and minimum price for each specific item in the table.

SELECT 
   item,
   max(price) as max_price,
   min(price) as min_price
FROM ITEMS_ORDERED
GROUP BY item;

13. How many orders did each customer make? Use the items_ordered table. Select the customerid, number of orders they made, and the sum of their orders.

SELECT 
   customerid,
   count(customerid),
   sum(price)
FROM ITEMS_ORDERED
group by customerid;
