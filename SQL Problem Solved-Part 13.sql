
/* 1. What are the different channels used by account id 1001? Your final table should have 
only 2 columns: account name and the different channels. You can try SELECT DISTINCT 
to narrow down the results to only the unique values.*/

select 
     distinct w.channel,
   a.name
from accounts a 
join web_events w on w.account_id=a.id
where a.id=1001;

/* 2. Provide a table that provides the region for each sales_rep along with their associated 
accounts. This time only for the Midwest region. Your final table should include three 
columns: the region name, the sales rep name, and the account name. Sort the accounts 
alphabetically (A-Z) according to account name.*/

select 
   r.name as region_name,
   s.name as sales_rep_name,
   a.name as account_name
from sales_reps s
join region r on r.id=s.region_id
join accounts a on a.sales_rep_id=s.id
where r.name='Midwest'
order by a.name asc;


/* 3. Provide a table that provides the region for each sales_rep along with their associated 
accounts. This time only for accounts where the sales rep has a first name starting with 
S and in the Midwest region. Your final table should include three columns: the region 
name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) 
according to account name. */

select 
   r.name as region_name,
   s.name as sales_rep_name,
   a.name as account_name
from sales_reps s
join region r on r.id=s.region_id
join accounts a on a.sales_rep_id=s.id
where r.name='Midwest' and s.name like "s%"
order by a.name asc;

/* 3.Provide a table that provides the region for each sales_rep along with their associated 
accounts. This time only for accounts where the sales rep has a last name starting with 
K and in the Midwest region. Your final table should include three columns: the region 
name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) 
according to account name.*/

select 
   r.name as region_name,
   s.name as sales_rep_name,
   a.name as account_name
from sales_reps s
join region r on r.id=s.region_id
join accounts a on a.sales_rep_id=s.id
where r.name='Midwest' and s.name like "k%"
order by a.name asc;

/* 4. Provide the name for each region for every order, as well as the account name and the 
unit price they paid (total_amt_usd/total) for the order. However, you should only 
provide the results if the standard order quantity exceeds 100. Your final table should 
have 3 columns: region name, account name, and unit price. In order to avoid a division 
by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).*/

select
    r.name as region_name,
    a.name as account_name,
    (o.total_amt_usd/o.total) as unit_price
from accounts a
join orders o on a.id=o.account_id
join sales_reps s on s.id=a.sales_rep_id
join region r on r.id=s.region_id
where standard_qty>100
order by a.name asc;

/* 5. Provide the name for each region for every order, as well as the account name and the 
unit price they paid (total_amt_usd/total) for the order. However, you should only 
provide the results if the standard order quantity exceeds 100 and the poster order 
quantity exceeds 50. Your final table should have 3 columns: region name, account name, 
and unit price. Sort for the smallest unit price first. In order to avoid a division by 
zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01). */

select
    r.name as region_name,
    a.name as account_name,
    (o.total_amt_usd/o.total) as unit_price
from accounts a
join orders o on a.id=o.account_id
join sales_reps s on s.id=a.sales_rep_id
join region r on r.id=s.region_id
where standard_qty>100 and poster_qty >50
order by a.name asc;

/* 11. Provide the name for each region for every order, as well as the account name and the 
unit price they paid (total_amt_usd/total) for the order. However, you should only 
provide the results if the standard order quantity exceeds 100 and the poster order 
quantity exceeds 50. Your final table should have 3 columns: region name, account name, 
and unit price. Sort for the largest unit price first. In order to avoid a division by 
zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
*/
select
    r.name as region_name,
    a.name as account_name,
    (o.total_amt_usd/o.total) as unit_price
from accounts a
join orders o on a.id=o.account_id
join sales_reps s on s.id=a.sales_rep_id
join region r on r.id=s.region_id
where standard_qty>100 and poster_qty >50
order by a.name asc,unit_price desc;






