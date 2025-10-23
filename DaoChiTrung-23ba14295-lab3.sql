use northwind;
-- Ex1

use northwind;
select * from orders
where order_date > '2006-03-24';

-- ex2

select product_id, unit_price, quantity, (unit_price * quantity *(1 - discount))as value
from order_details
where order_id = 31;
-- ex3

select * from customers;
select o.id, o.order_date, c.company, (od.unit_price * od.quantity *(1 - od.discount))as value
from orders as o, customers as c, order_details as od
where o.order_date > '2006-03-24' and o.customer_id = c.id;

-- ex 4
select o.id, 
o.order_date, 
c.company,
sum(od.unit_price * od.quantity *(1 - od.discount))as sub_total
from orders as o , customers as c, order_details as od
where order_date > '2006-03-24' and o.customer_id = c.id
group by o.id, o.order_date, c.company;


-- ex5

select o.id, 
o.order_date, 
c.company,
sum(od.unit_price * od.quantity *(1 - od.discount))as sub_total
from orders as o, customers as c, order_details as od
where o.order_date > '2006-03-24' and c.id = o.customer_id
group by o.id, o.order_date, c.company
having sub_total >= 800;


-- ex 6

select concat(first_name, last_name) as full_name,
sum(od.unit_price * od.quantity *(1 - od.discount))as sale

from employees as e, order_details as od, orders as o
where o.employee_id = e.id
GROUP BY e.first_name, e.last_name
having sale > 1000 order by sale desc;

-- ex7
select distinct category
from products
order by category;

-- ex8
select max(standard_cost) as max, 
min(standard_cost) as min,
avg(standard_cost) as avg,
stddev(standard_cost) as stddev,
variance(standard_cost) as variance
from products;

-- ex9
select distinct category,
avg(list_price)as avg
from products
group by category;

-- ex10
select max(shipping_fee) as max,
avg(shipping_fee) as average,
ship_city
from orders
group by ship_city;

-- ex11
DELIMITER $$
create procedure GetTopNCategories(in n int)
begin

	select category , avg(list_price) as average_price
	from products
	group by category
	order by average_price desc
    limit n;
    
end$$
DELIMITER ;
CALL GetTopNCategories(5);
drop procedure GetTopNCategories;

-- ex 12
select avg(list_price) as average_price
from products
group by category
order by average_price asc
limit 1;

-- ex13
select 
	p.id,
    concat(e.first_name,e.last_name) as person_approving,
    concat(s.first_name,s.last_name) as person_creating
from purchase_orders as p 
join employees as e on p.created_by = e.id
join suppliers as s on p.supplier_id = s.id;


-- ex 14
select distinct company , 
concat(last_name, first_name) as full_name,
email_address,
'C' as type
from customers

union all

select distinct company,
concat(last_name, first_name) as full_name,
email_address,
'S' as type
from suppliers;

-- ex 15
select distinct
    p.id as product_id, 
    p.product_code, 
    p.product_name
from products as p
join purchase_order_details as pod 
    on pod.product_id = p.id
where not exists (
    SELECT 1
    from order_details as od
    where od.product_id = p.id
)
order by p.id ASC;
