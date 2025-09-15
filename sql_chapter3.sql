-- Max, Min , Avg, Group by
use moviesdb;
select 
	min(imdb_rating) as min_rating,
    max(imdb_rating) as max_rating,
	round(avg(imdb_rating), 2) as avg_rating
from movies where studio = "Marvel Studios";

-- group by

select industry,count(*) from movies
group by industry;

select studio,count(*) as cnt from movies
group by studio
order by cnt desc;


select studio,
	count(*) as cnt,
    round(avg(imdb_rating) , 1) as avg_rating
from movies
where studio != ""
group by studio
order by avg_rating desc;


