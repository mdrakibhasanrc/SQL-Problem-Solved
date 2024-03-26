use marketing;
/*1. Find the total amount of poster_qty paper ordered in the orders table.*/

select 
    sum(poster_qty) as Total
from orders;

/* 2. Find the total amount of standard_qty paper ordered in the orders table.*/
select 
    sum(standard_qty) as Total
from orders;

/*3. Find the total dollar amount of sales using the total_amt_usd in the 
orders table.*/
select 
    sum(total_amt_usd) as Total
from orders;

/* 4. Find the total amount spent on standard_amt_usd and gloss_amt_usd paper 
for each order in the orders table. This should give a dollar amount for 
each order in the table.*/

select
  (standard_amt_usd+gloss_amt_usd) as Total_anount
from orders;

/* 5. Find the standard_amt_usd per unit of standard_qty paper. Your solution should 
use both an aggregation and a mathematical operator.*/

select
   (standard_amt_usd/standard_qty) as per_unit
from orders;

/* 5. When was the earliest order ever placed? You only need to return the date.*/
select
  min(occurred_at)
from orders;

/* 6. Try performing the same query as the previous one without using an aggregation function.*/

select
    occurred_at
from orders
order by occurred_at asc
limit 1;

/* 7. When did the most recent (latest) web_event occur?*/

select 
   max(occurred_at)
from web_events;

/* 8. Try to perform the result of the previous query without using an aggregation function.*/
select
    occurred_at
from web_events
order by occurred_at asc
limit 1;

/* 9. Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean 
amount of each paper type purchased per order. Your final answer should have 6 values - 
one for each paper type for the average number of sales, as well as the average amount.*/

select
   avg(standard_qty) as avg_standard,
   avg(gloss_qty) as avg_gloss,
   avg(poster_qty) as avg_poster,
   avg(standard_amt_usd) as avg_standard_usd,
   avg(gloss_amt_usd) as avg_gloss_usd,
   avg(poster_amt_usd) as avg_poster_usd
from orders;

/* 10. Which account (by name) placed the earliest order? Your solution 
should have the account name and the date of the order.*/
select
    a.name,
    o.occurred_at
from accounts a
join orders o on a.id=o.account_id
order by o.occurred_at asc
limit 1;

/* 11. Find the total sales in usd for each account. You should include 
two columns - the total sales for each company's orders in usd and 
the company name.*/
select
    a.name,
    sum(o.total_amt_usd) as Total_sales
from accounts a
join orders o on a.id=o.account_id
group by a.name
order by Total_sales desc;

/* 12. Via what channel did the most recent (latest) web_event occur, which 
account was associated with this web_event? Your query should return 
only three values - the date, channel, and account name.*/
select
    a.name,
    w.channel,
    w.occurred_at
from accounts a
join web_events w on w.account_id=a.id
order by w.occurred_at desc
limit 1;


/* 13. Find the total number of times each type of channel from the 
web_events was used. Your final table should have two columns - 
the channel and the number of times the channel was used.*/
select
    channel,
    count(channel) as No_channel
from web_events
group by channel;

/* 14.Who was the primary contact associated with the earliest web_event? */
select
   a.primary_poc,
   w.occurred_at
from accounts a
join web_events w on a.id=w.account_id
order by w.occurred_at asc
limit 1;

/* 15.What was the smallest order placed by each account in terms of total 
usd. Provide only two columns - the account name and the total usd. 
Order from smallest dollar amounts to largest.*/
select
   a.name,
   min(o.total_amt_usd)
from accounts a 
join orders o on a.id=o.account_id
group by a.name
order by o.total_amt_usd asc;







