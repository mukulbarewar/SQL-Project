create table employee (
Employee_id int,
First_name varchar(30),
Last_name varchar(30),
Salary int,
Joining_date datetime,
Department varchar(30)
primary key(Employee_id)
)




insert into employee values

(1, 'Anika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
(2, 'Veena', 'Verma',  80000, '2011-06-15 09:00:00', 'Admin'),
(3 , 'Vishal', 'Singhal', 300000, '2020-02-16 09:00:00', 'HR'),
(4 , 'Sushanth', 'Singh', 500000, '2020-02-17 09:00:00', 'Admin'),
(5 , 'Bhupal', 'Bhati', 500000, '2011-06-18 09:00:00', 'Admin'),
(6 , 'Dheeraj', 'Diwan', 200000, '2011-06-19 09:00:00', 'Account'),
(7 , 'Karan', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
(8 , 'Chandrika', 'Chauhan', 90000, '2011-04-15 09:00:00', 'Admin')


create table employee_bonus (
Employee_ref_id int,
Bonus_amount int,
Bonus_date datetime, 
foreign key (Employee_ref_id) references employee(Employee_id))



insert into employee_bonus values 
(1, 5000, '2020-02-16 00:00:00'),
(2, 3000, '2011-06-16 00:00:00'),
(3, 4000, '2020-02-16 00:00:00'),
(1, 4500, '2020-02-16 00:00:00'),
(2, 3500, '2011-06-16 00:00:00')

select * from employee_bonus


create table employee_title (
Employee_ref_id int,
Employee_title varchar(50),
Effective_date datetime)


insert into employee_title values 
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(5, 'Manager', '2016-06-11 00:00:00'),
(4, 'Ass. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00'),
(6, 'Lead', '2016-06-11 00:00:00'),
(3, 'Lead', '2016-06-11 00:00:00')

select * from employee_bonus
select * from employee
