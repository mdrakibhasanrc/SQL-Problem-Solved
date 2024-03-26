use marketing;
/* 1. Which account has spent the most with us? */
select
   a.name,
   sum(o.total_amt_usd) as total_spent
from accounts a 
join orders o on a.id=o.account_id
group by a.name
order by o.total_amt_usd desc
limit 1;

/* 2. Which account has spent the least with us?*/
select
   a.name,
   sum(o.total_amt_usd) as total_spent
from accounts a 
join orders o on a.id=o.account_id
group by a.name
order by o.total_amt_usd asc
limit 1;

/* 3. Which accounts used facebook as a channel to 
contact customers more than 6 times?*/

select
    a.name,
    w.channel,
    count(w.channel) as count
from accounts a
join web_events w on a.id=w.account_id
where w.channel="facebook"
group by a.name
having count >6
order by count desc;

/* 4. Which account used facebook most as a channel? */

select
    a.name,
    w.channel,
    count(w.channel) as count
from accounts a
join web_events w on a.id=w.account_id
where w.channel="facebook"
group by a.name
order by count desc
limit 1;

/* 5. Which channel was most frequently used by most 
accounts?*/

select
    a.name,
    w.channel,
    count(w.channel) as count
from accounts a
join web_events w on a.id=w.account_id
group by a.name,w.channel
order by count desc;

/* 6. Try pulling all the data from the accounts table, and all the data from the 
orders table.*/
select
   a.*,
   o.*
from accounts a 
 JOIN  orders o on a.id=o.account_id;

/* 7. Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, 
and the website and the primary_poc from the accounts table.*/

select
   a.name,
   a.primary_poc,
   o.standard_qty,
   o.gloss_qty,
   o.poster_qty
from accounts a 
join orders o on a.id=o.account_id;

/* 8. Provide a table for all web_events associated with account name of Walmart. 
There should be three columns. Be sure to include the primary_poc, time of the 
event, and the channel for each event. Additionally, you might choose to add a 
fourth column to assure only Walmart events were chosen.*/

select a.name,a.primary_poc,
       w.occurred_at,w.channel
from accounts a
join web_events w
on a.id=w.account_id
where a.name ="Walmart";

/* 9. Provide a table that provides the region for each sales_rep along with their 
associated accounts. Your final table should include three columns: the region name, 
the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) 
according to account name. */

select
   r.name,
   s.name,
   a.name
from region r
join sales_reps s on r.id=s.region_id
join accounts a on s.id=a.sales_rep_id
group by 
      r.name,
      s.name,
      a.name
order by a.name asc;

/* 5. Provide the name for each region for every order, as well as the account name 
and the unit price they paid (total_amt_usd/total) for the order. Your final table 
should have 3 columns: region name, account name, and unit price. */

select
   a.name,
   r.name as Region_name,
   (o.total_amt_usd/o.total) as unit_price
from accounts a
join orders o on a.id=o.account_id
join sales_reps s on s.id=a.sales_rep_id
join region r on r.id=s.region_id
group by a.name;







