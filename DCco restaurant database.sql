drop database if exists restaurant_DB;

Create Database restaurant_DB;
USE restaurant_DB;
Create table Employees(
employeeid int primary key auto_increment,
first_name varchar(20),
last_name varchar(20),
phone varchar(15) unique,
position varchar(100),
salary decimal(10, 2) check (salary >= 0)
);

Create table Customers(
customerid int not null primary key,
first_name varchar(60),
last_name varchar(60),
payment_method ENUM('credit_card', 'cash', 'momo'),
vip_status ENUM('standard', 'gold', 'platinum'),
price decimal(6, 2) check (price >= 0) 
);

Create table Menu(
menuid int not null primary key,
itemname varchar(90),
price decimal(6, 2) check (price >= 0) 
);

Create table OrderDetails(
orderdetailsid int not null primary key,
price decimal(6, 2) check (price >= 0),
quantity int,
orderdate date
);
Insert into Employees (employeeid, first_name, last_name ,phone,
position, salary )
values (11, 'Mason', 'Asante' ,  098-987-6754, 'chef', 10000.00),
(22, 'Alice', 'Matte' ,  308-667-8344, 'accountant', 6000.00),
(33, 'Kwadwo', 'Baffoe' ,  148-987-3756, 'waiter', 5500.00),
(44, 'Leslie', 'Akoto' ,  205-777-6754, 'waiter', 5500.00),
(55, 'Ama', 'Asana' ,  438-999-8516, 'janitor', 2000.00),
(66, 'Cane', 'Reel' ,  428-999-8546, 'bartender', 6100.00),
(77, 'Simon', 'Sing' ,  738-999-8546, 'janitor', 2000.00),
(88, 'Peter', 'Cook' ,  438-979-8546, 'general manager', 15000.00),
(99, 'Samuel', 'Adjei' ,  438-909-8546, 'host', 7000.00),
(110, 'May', 'Bel' ,  092-117-3321, 'barista', 9500.00);

Insert into Customers (customerid, first_name, last_name ,payment_method, vip_status, price )
values (1, 'Cindy', 'Johnson' ,'credit_card', 'platinum', 400),
(2, 'Jake', 'Miller' ,'cash', 'standard', 678),
(3, 'Lala', 'Garcia' ,'momo', 'standard', 240),
(4, 'Sam', 'Davis' ,'cash', 'standard', 665),
(5, 'Jinho', 'Lane' ,'credit_card', 'platinum', 200),
(6, 'Jinho', 'Lane' ,'credit_card', 'platinum', 340),
(7, 'Kim', 'Lane' ,'credit_card', 'platinum', 115),
(8, 'Jisoo', 'Lane' ,'credit_card', 'platinum', 105),
(9, 'Hyung', 'Jin' ,'credit_card', 'platinum', 234),
(10, 'Kofi', 'Breko' ,'credit_card', 'gold', 720);


Insert into Menu (menuid, itemname, price)
values (51, 'lightsoup', 10),
(62, 'calamari', 130),
(43, 'chicken_pizza', 420),
(84, 'waakye', 380),
(45, 'jollof', 250),
(96, 'cinnamon rolls', 25),
(07, 'spring rolls', 25),
(89, 'steak', 90),
(09, 'ugali', 70),
(103, 'friedrice', 80);

Insert into OrderDetails (orderdetailsid, price, quantity ,orderdate)
values 
(17, 400, 2, '2023-8-10'),
(23, 678, 4 ,'2023-8-16'),
(39, 240, 6 ,'2023-7-20'),
(45, 665, 11 ,'2023-9-03'),
(85, 200, 22 ,'2023-1-23'),
(68, 340, 2 ,'2023-5-09'),
(67, 115, 7 ,'2023-5-19'),
(18, 105, 9 ,'2023-5-03'),
(29, 234, 4 ,'2023-6-23'),
(104, 720 ,5 ,'2023-8-24');


##employees earning 5000 or more
Select * from employees where salary >= 5000;

##employee salary by position
Select position, AVG(salary) AS averagesalary from employees
group by position;

##selects all customers with a first name or last name containing the pattern "La"
Select * from customers where first_name or last_name LIKE '%La%';

##Returns records that have matching values in both tables
SELECT OrderDetails.orderdetailsid, OrderDetails.quantity, OrderDetails.Orderdate,
 customers.customerid,  customers.first_name,  customers.last_name , customers.payment_method,  customers.vip_status
FROM OrderDetails
INNER JOIN  customers ON  OrderDetails.price=customers.price;


