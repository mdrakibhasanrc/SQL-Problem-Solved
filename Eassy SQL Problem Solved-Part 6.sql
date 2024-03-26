use org;

/*Q-1. Write an SQL query to fetch the count of employees working in the department ‘Admin’.*/

select
   count(*) as Count
from worker
where
    DEPARTMENT='Admin';
    
/*Q-2. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.*/

select
   concat(FIRST_NAME,' ',LAST_NAME) as Full_name,
   Salary
from worker
where
   SALARY >= 50000 and SALARY <= 100000;
   
/*Q-3. Write an SQL query to fetch the no. of workers for each department in the descending order.*/

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

/*Q-4. Write an SQL query to show only odd rows from a table.*/

select
  *
from worker
where
   worker_ID%2 <>0;

/*Q-5. Write an SQL query to show only even rows from a table.*/
select
  *
from worker
where
   worker_ID%2 = 0;
   
/*Q-6. Write an SQL query to fetch intersecting records of two tables.*/
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);


/*Q-7. Write an SQL query to show the current date and time.*/

  select curdate() as Today;
  select curtime() as Time;
  
/*Q-8. Write an SQL query to show the top n (say 10) records of a table.*/
select
   *
from worker
limit 10;


/*Q-9. Write an SQL query to determine the nth (say n=5) highest salary from a table.*/

select
   *
from worker
order by
    salary desc
limit 5;

/*Q-10. Write an SQL query to show all departments along with the number of people in there.*/

select
   DEPARTMENT,
   count(DEPARTMENT) as No
from worker
group by DEPARTMENT
order by
  No Desc;