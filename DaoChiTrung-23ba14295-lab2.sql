use northwind;
-- ex 1
select id, product_name from products;


-- ex2
select id, product_name, list_price from products
order by list_price desc
limit 4;

-- ex3

select id, product_name, list_price from products 
where list_price between 15 and 25;


select id, product_name, list_price from products 
where 15<= list_price and list_price <=25;

-- ex4


select id, concat(first_name,' ', last_name) as full_name from employees;

-- ex5

select id, concat(first_name,' ', last_name) as full_name from employees
where first_name like "A%";

-- ex6
select count(distinct city) as number_of_city from employees;

-- ex7
select distinct ship_name from orders;

-- ex8
select max(list_price) as max_price,min(list_price) as min_price from products;


-- ex9
select count(id) as number_of_current from products
where discontinued = 0;



-- ex10 
select round(avg(list_price), 2) as average, 
round(std(list_price),2) as standard 
from products;

-- ex11
select product_name, list_price, round(avg_price,2) as avg_price
from (
		select product_name, list_price, (select avg(list_price) from products) as avg_price
        from products
) as T
where list_price >= avg_price;
                    
-- ex12


insert into Suppliers(company, last_name, first_name, city, country_region)
values ("Habeco", "Nguyễn", "Hồng Linh", "Hanoi", "Vietnam");




-- ex13 


insert into products(product_code, id, list_price, discontinued, category)
values ("TBTruc Bach", (select id from Suppliers where company = "Habeco") , 22, 0, "Beverages");


-- ex 14
update products
set standard_cost = 18
where product_code = "TBTruc Bach";

-- ex 15
delete from Suppliers where company = "Habeco";

