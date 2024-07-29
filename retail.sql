-- Create customer table
create database retailer;

-- connect to retailer database
use retailer;

-- create Customer Table
CREATE TABLE customer
(
cus_id int primary key,
Customer_name varchar(200)
);

-- Create Payment table 
CREATE TABLE payment
(
cus_id int primary key,
amount numeric,
FOREIGN KEY (cus_id) REFERENCES customer(cus_id)
);

-- insert date into customer table
insert into customer
values(1,'Juliet Egbule'), (2,'Tony Taylor'),(3,'Sam Smith'),(4,'Tina Turner'),
(5, 'Martin Payne'),(6,'Brian Hart'),(7,'Fernando Toures'),
(8,'Emeka Ani'),(9,'Jaleel White'),(10,'Fortune Raymond');

-- retrieve all data in the customers table
select * from customer;

-- Rename amount column to paid
alter table payment
rename column amount to paid;

-- insert into payment only the customers that have made payment
insert into payment
values(1, 6000),(8,3500), (4,5500);

-- get the names of those who have paid 
select c.customer_name, p.paid
from customer as c
inner join payment as p
on c.cus_id = p.cus_id;

-- solution 2 with subquery
select customer_name from customer
where cus_id in (
select cus_id from payment);


-- solution 3
select c.customer_name, paid
from customer as c
full  outer join payment as p
on c.cus_id = p.cus_id
where p.paid is not null;


-- select the names of those who have not paid

select customer_name from customer
where cus_id not in (
select cus_id from payment);

-- solution 2
select c.customer_name, paid
from customer as c
full outer join payment as p
on c.cus_id = p.cus_id
where p.paid is null;


-- solution 3
select c.customer_name, paid
from customer as c
full outer join payment as p
on c.cus_id = p.cus_id
where c.cus_id not in (select cus_id from payment);


-- two users just made a payment, 
-- please update the table by adding them to the payment table (Tony Taylor(10000) 
-- and Sam Smith 7000)
-- first find the cus_id of both customers

select * from customer 
where customer_name in ('Tony Taylor', 'Sam Smith');

insert into payment
values(2,100000),(3, 7000);

-- check the payment table to be sure 
select * from payment;

-- tony paid 10000 and not 100000. please update his payment
update payment
set paid = 10000
where cus_id  =2 ;

-- check list of customers that their payment is above the avg payment
select avg(paid) from payment;
select cus_id from payment where paid > 6400;

-- better with subquery
	
select cus_id, paid from payment
where paid > (select avg(paid) from payment)

-- select the name of the customer with the highest payment
select cus_id, paid from payment
where paid = (select max(paid) from payment);

-- solution 2
select c.customer_name, max(paid)
from customer as c
inner join payment as p
on c.cus_id = p.cus_id
group by 1
order by 2 desc
limit 1;

-- check the second customer with the highest payment

select c.customer_name, max(paid)
from customer as c
inner join payment as p
on c.cus_id = p.cus_id
group by 1
order by 2 desc
limit 1 offset 1;


