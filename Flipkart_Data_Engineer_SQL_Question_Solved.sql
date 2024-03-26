create database sql_practice;
use sql_practice;

-- Q1.Find Year On Year growth percentage.
CREATE TABLE growth (
    customer VARCHAR(50),
    year INT,
    sales INT
);
INSERT INTO growth VALUES ('cust1', 2014, 2000);
INSERT INTO growth VALUES ('cust1', 2015, 5000);
INSERT INTO growth VALUES ('cust2', 2013, 1000);
INSERT INTO growth VALUES ('cust2', 2014, 1500);
INSERT INTO growth VALUES ('cust2', 2015, 800);

select * from growth;

-- Solution:
SELECT
   year,
   SUM(sales) AS current_year_sales,
   LAG(SUM(sales)) OVER (ORDER BY year) AS previous_year_sales,
   ((SUM(sales) - LAG(SUM(sales)) OVER (ORDER BY year)) / LAG(SUM(sales)) OVER (ORDER BY year)) * 100 as yoy_growth_percentage
FROM 
   growth
GROUP BY 
   year
ORDER BY 
   year ASC;

CREATE TABLE employee (
    eid VARCHAR(10),
    ename VARCHAR(50),
    deptid VARCHAR(10),
    salary INT
);
INSERT INTO employee VALUES ('E1', 'Rahul', 'D1', 20000);
INSERT INTO employee VALUES ('E2', 'Anjali', 'D2', 15000);
INSERT INTO employee VALUES ('E3', 'Rohan', 'D3', 25000);
INSERT INTO employee VALUES ('E4', 'Ramesh', 'D4', 5000);
INSERT INTO employee VALUES ('E5', 'Pooja', 'D1', 10000);
INSERT INTO employee VALUES ('E6', 'Divya', 'D2', 15000);
INSERT INTO employee VALUES ('E7', 'Amir', 'D3', 10000);

select * from employee;

CREATE TABLE department (
    deptid VARCHAR(10),
    deptname VARCHAR(50)
);

INSERT INTO department VALUES ('D1', 'Engineering');
INSERT INTO department VALUES ('D2', 'IT and Networking');
INSERT INTO department VALUES ('D3', 'Customer Support');
INSERT INTO department VALUES ('D4', 'Front Desk');
INSERT INTO department VALUES ('D5', 'Sales');

select * from department;

-- Question: 1 - Department with Highest Salary Expenditure:
SELECT
   d.deptname,
   SUM(e.salary) AS highest_salary
from department d
inner join employee e
    on d.deptid=e.deptid
GROUP BY 
    d.deptname
ORDER BY 
     highest_salary desc
LIMIT 1;
    
    
    
-- Question 2-Employees with the Same Salary:

SELECT
    e1.ename,
    e1.salary
FROM
    employee e1
JOIN
    employee e2 ON e1.salary = e2.salary AND e1.eid <> e2.eid
ORDER BY
    e1.salary, e1.ename;

-- Question 4- Employee with the 4th Highest Salary:
WITH salary AS (SELECT
   ename,
   salary,
   DENSE_RANK() OVER(ORDER BY salary DESC) as rnk
FROM
   employee)
SELECT
    ename,
     salary
FROM 
   salary
WHERE 
   rnk=4;


-- Question 5-  Departments with More Than One Employee:
SELECT
    DISTINCT(deptid)  AS Departments,
    count(DISTINCT eid) as cnt
FROM
    employee
GROUP BY
     Departments
HAVING cnt > 1;

-- Question 6- Departments with No Employees:
SELECT
    distinct (d.deptname)
FROM 
   department d
LEFT JOIN 
   employee e
ON e.deptid=d.deptid
WHERE
   e.eid IS NULL;

-- Question 6 - Departments and Their Employees:

SELECT 
   deptid,
  GROUP_CONCAT(distinct ename) AS dept_employees
FROM 
   employee
GROUP BY
    deptid;

