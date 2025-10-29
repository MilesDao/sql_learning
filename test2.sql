use northwind;
-- ex 1
select id as product_id, product_name from products;
-- ex 2
select id as product_id, product_name, list_price from northwind.products
order by list_price asc
limit 4;
-- ex 3
select id as product_id, product_name, list_price from northwind.products
where list_price between 15 and 25
having product_name is not null;
-- ex 4
select id , concat(first_name , last_name)as full_name from employees;

-- ex 5
select id , concat(first_name , last_name)as full_name 
from employees
where first_name like 'A%';

-- ex 6
select count(distinct city) as count from employees;

-- ex 7
select distinct ship_name from orders;

-- ex 8
select max(list_price) , min(list_price) from products;

-- ex 9
select count(discontinued) from products
where discontinued = 0;

-- ex 10 
select avg(list_price), stddev(list_price) from products;

-- ex 11
select product_name, list_price, average_price
from (
	select product_name , list_price, (select avg(list_price) from products) as average_price 
    from products
) as hehe
where list_price > average_price and product_name is not null;

-- ex 12
Insert into Suppliers(company, last_name , first_name , city , country_region)
Values('Habeco','Nguyễn', 'Hồng Linh', 'Hà Nội', 'Việt Nam');

-- ex 13
select * from products;
Insert into products(product_code, supplier_ids, list_price , discontinued, category)
values('TBTrucBach', (select(id) from suppliers where company = 'Habeco'), 22, 0, 'Beverages');

delete from products
where product_code = 'TBTrucBach';
-- ex 14
update products
set standard_cost = 18
where product_code = 'TBTrucBach';

-- ex 15
delete from Suppliers
where company = 'Habeco' and first_name = 'Nguyễn' and last_name = 'Hồng Linh';

delete from products
where product_code = 'TBTrucBach' and category = 'Beverages' and list_price = 22;