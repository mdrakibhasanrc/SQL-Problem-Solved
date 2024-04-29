select * from movies;
select * from reviews;

with cte as (select
   m.genre,
   m.title,
   avg(r.rating) as avg_rating,
   row_number() over(partition by m.genre order by avg(r.rating) desc) as rnk
 from movies m
 inner join reviews r on m.id=r.movie_id
 group by m.genre,m.title
 order by avg_rating)
 
 select
     genre,
	 title,
	 round(avg_rating,0),
	 REPEAT('★', ROUND(avg_rating,0)::int) AS star
from cte 
where rnk=1;
 
 