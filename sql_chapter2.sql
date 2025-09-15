use moviesdb;
select * from movies where imdb_rating >=6 and imdb_rating <=8;

select * from movies
where release_year = 2022 or release_year = 2019 or release_year = 2018;

-- the same with
select * from movies
where studio in("Marvel Studios", "Zee Studios");


select * from movies
where release_year in(2022, 2019, 2018);


-- null value

select *
from movies where imdb_rating is null;

select *
from movies where industry = "Bollywood"
order by imdb_rating desc
limit 5 offset 1; -- select the first index which is 1 and the show out the next 5 