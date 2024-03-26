use practice;
/*1. Select customer name together with each order the customer made*/
select
    c.CustomerName,
    o.OrderID
from customers c
inner join orders o on c.CustomerID=o.CustomerID;

/*2. Select order id together with name of employee who handled the order*/
select
    o.OrderID,
    e.FirstName
from orders o
inner join employees e on e.EmployeeID=o.EmployeeID;

/*3. Select customers who did not placed any order yet*/
   
select
    c.CustomerName,
    o.OrderID
from customers c
left join orders o on c.CustomerID=o.CustomerID
where o.OrderID is null;

/*4. Select order id together with the name of products*/
SELECT o.OrderID, p.ProductID, p.ProductName
FROM orders o
JOIN order_details od ON o.OrderID = od.OrderID
JOIN products p ON p.ProductID = od.ProductID
ORDER BY o.OrderID;



/*5. Select products that no one bought*/
SELECT
    p.ProductID,
    p.ProductName,
    od.OrderID
FROM products p
LEFT JOIN order_details od ON p.ProductID = od.ProductID
WHERE od.OrderID IS NULL;

/*6. Select customer together with the products that he bought*/

select
   c.CustomerName,
   o.OrderID,
   o.ProductID
from customers c
inner join orders od on od.CustomerID=c.CustomerID
inner join order_details o on o.OrderID=od.OrderID;


/*7. Select product names together with the name of corresponding category*/
select
   p.ProductName,
   c.CategoryName
from products p
inner join categories c on c.CategoryID=p.CategoryID;

/*8. Select orders together with the name of the shipping company*/
select
    o.OrderID,
    o.OrderDate,
    s.ShipperName
from orders o
inner join shippers s on s.ShipperID= s.ShipperID;

/*9. Select customers with id greater than 50 together with each order they made*/
select
  c.CustomerID,
  c.CustomerName,
  o.OrderID
from customers c
inner join orders o on o.CustomerID=c.CustomerID
where c.CustomerID>50;

/*10. Select employees together with orders with order id greater than 10400*/
select
  e.EmployeeID,
  e.FirstName,
  o.OrderID
from orders o
inner join employees e on e.EmployeeID=o.EmployeeID
where o.OrderID >10400;
