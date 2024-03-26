use org;
/*Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.*/
select
   FIRST_NAME as Worker_name
from worker;

/*Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.*/

select
   upper(FIRST_NAME) as Worker_name
from worker;

/*Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.*/

select
   distinct(DEPARTMENT)
from worker;

/*Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.*/

select
   left(FIRST_NAME,3)
from worker;

/*Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.*/

select
  instr(FIRST_NAME,Binary'a')
from worker
where
  FIRST_NAME='Amitabh';

/*Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.*/

select
   rtrim(FIRST_NAME)
from worker;

/*Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.*/

select
   ltrim(DEPARTMENT)
from worker;

/*Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.*/

select
  DEPARTMENT,
   length(DEPARTMENT) as Length
from worker;


/*Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.*/

select
   FIRST_NAME,
   replace(FIRST_NAME,'a','A')
from worker;

/*Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.*/

select
   FIRST_NAME,
   LAST_NAME,
   concat(FIRST_NAME,' ',LAST_NAME) as Full_Name
from worker;

/*Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.*/

select
  *
from worker 
 order by
     FIRST_NAME asc;

/*Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.*/

select
  *
from worker 
 order by
     FIRST_NAME asc,
     DEPARTMENT desc;
     
/*Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.*/

Select
   * from Worker
where
   FIRST_NAME in ('Vipul','Satish');
   
/*Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.*/

Select
   * from Worker
where
   FIRST_NAME not in ('Vipul','Satish');
   
/*Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.*/

Select
   * 
from Worker
where
   DEPARTMENT like 'Admin%';

/*Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.*/

select
  *
from worker
where 
   FIRST_NAME like 'a%';
   

/*Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.*/

select
  *
from worker
where 
   FIRST_NAME like '%a';
   
/*Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.*/

select
  *
from worker
where 
   FIRST_NAME like '______h';
   
/*Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.*/

select
    *
from worker
where
   salary between 100000 and 500000;


/*Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.*/

select
  *
from worker
where
    year(JOINING_DATE)=2014 and month(JOINING_DATE)=2;
    











   

   
   
   
   
   
   
   
   
   
   

   




















