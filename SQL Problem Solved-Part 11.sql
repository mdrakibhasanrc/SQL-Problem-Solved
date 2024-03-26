use marketing;
/* 1. Find the number of sales reps in each region. Your final table should 
have two columns - the region and the number of sales_reps. Order from 
fewest reps to most reps.*/

select
   r.name,
  count( s.name) as Number_of_sales_rep
from region r
join sales_reps s on r.id=s.region_id
group by r.name;

/* 2. For each account, determine the average amount of each type of paper they 
purchased across their orders. Your result should have four columns - one 
for the account name and one for the average quantity purchased for each of 
the paper types for each account.*/

select
   a.name,
   avg(o.standard_qty) as avg_standard_qty,
   avg(o.gloss_qty) as avg_gloss_qty,
   avg(o.poster_qty) as avg_poster_qty
from accounts a
join orders o on o.account_id=a.id
group by a.name;
   
/* 3. For each account, determine the average amount spent per order on each paper 
type. Your result should have four columns - one for the account name and one 
for the average amount spent on each paper type.*/

select
   a.name,
   avg(o.standard_amt_usd) as avg_standard_amt_usd,
   avg(o.gloss_amt_usd) as avg_gloss_amt_usd,
   avg(o.poster_amt_usd) as avg_poster_amt_usd
from accounts a
join orders o on o.account_id=a.id
group by a.name;

/* 4. Determine the number of times a particular channel was used in the web_events 
table for each sales rep. Your final table should have three columns - the 
name of the sales rep, the channel, and the number of occurrences. Order your 
table with the highest number of occurrences first.*/

select 
    s.name,
    w.channel,
    count(w.channel) as no_of_occurences
from sales_reps s
join accounts a on a.sales_rep_id=s.id
join web_events w on a.id=w.account_id
group by s.name,w.channel;

/* 5. Determine the number of times a particular channel was used in the web_events 
table for each region. Your final table should have three columns - the region 
name, the channel, and the number of occurrences. Order your table with the 
highest number of occurrences first. */

select 
    r.name,
    w.channel,
    count(w.channel) as no_of_occurences
from region r
join sales_reps s on r.id=s.region_id
join accounts a on a.sales_rep_id=s.id
join web_events w on a.id=w.account_id
group by r.name,w.channel
order by no_of_occurences desc;

/* 6.Use DISTINCT to test if there are any accounts associated with more than one 
region.*/

SELECT DISTINCT a.name, s.region_id
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
ORDER BY a.name;

/* 7. Have any sales reps worked on more than one account? */

select
   s.name,
   count(a.name) as No
from sales_reps s 
join accounts a on a.sales_rep_id=s.id
group by s.name
order by No asc;

/* 8.How many of the sales reps have more than 5 accounts 
that they manage?*/

select
   s.name,
   count(a.name) as No
from sales_reps s 
join accounts a on a.sales_rep_id=s.id
group by s.name
having  count(a.name) > 5
order by No asc;

/* 9. How many accounts have more than 20 orders?*/

select
   a.name,
   count(o.account_id) as no_of_orders
from accounts a
join orders o on a.id=o.account_id
group by a.name
having count(o.account_id) > 20
order by no_of_orders asc;

/* 10. Which account has the most orders? */

select
   a.name,
   count(o.account_id) as no_of_orders
from accounts a
join orders o on a.id=o.account_id
group by a.name
order by no_of_orders desc
limit 1;

/* 11.. How many accounts spent more than 30,000 usd total 
across all orders? */

select
    a.name,
    sum(o.total_amt_usd) as Total_amt
 from accounts a
 join orders o
 on a.id=o.account_id
group by a.name
having sum(o.total_amt_usd) > 30000
order by Total_amt desc;



/* 12. How many accounts spent less than 1,000 usd total 
across all orders?*/

select
    a.name,
    sum(o.total_amt_usd) as Total_amt
 from accounts a
 join orders o
 on a.id=o.account_id
group by a.name
having sum(o.total_amt_usd) < 1000
order by Total_amt desc;









