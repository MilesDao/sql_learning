# from --> where --> group by --> having --> order by
select release_year, 
count(*) as movies_count
from movies
where imdb_rating > 6
group by release_year
having movies_count >2
order by movies_count desc;