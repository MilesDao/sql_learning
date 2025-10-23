# Calculate columns


select curdate(); #give a current date()
select *, 
year(curdate())- birth_year as age
from actors;

select *,
(revenue - budget) as profit from financials;

select *,
if(currency = 'USD', revenue *77, revenue) as revenue_inr
 from financials;
 # if currency = usd then revenue *77 if not just revenue
 #if(condition, true, false)
 
 
 # billions rev * 1000
 # thousands rev /1000
 # million rev
 # case end in sql
 select distinct unit from financials;
 select *,
 case 
	when unit = 'Billions' then revenue * 1000
    when unit = 'Thousands' then revenue /1000
    else revenue
 end as revenue_mln
 
from financials;