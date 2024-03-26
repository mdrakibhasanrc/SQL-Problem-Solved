# Write your MySQL query statement below

select
   actor_id,
   director_id
from ActorDirector
group by actor_id,director_id
having count(*)>=3;

2. Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.

select
   id,
   movie,
   description,
   rating
from Cinema
where id%2!=0 and description !='boring'
order by rating desc;

3. Write an SQL query to report the first login date for each player.

Return the result table in any order.

select
   player_id,
   min(event_date) as first_login
from Activity
group by player_id;

4. Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

select
    e.id
from Weather as e,Weather as m

where datediff(e.recordDate,m.recordDate)=1 and e.temperature>m.temperature;