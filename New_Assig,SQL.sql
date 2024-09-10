create table employee(
e_id int not null,
first_name varchar(20),
last_name varchar(20),
salary int,
joining_date datetime,
department varchar(10),
primary key(e_id)
)
use Assigment_23
drop table employee

select * from employee

insert into employee values(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR');
insert into employee values(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin');
insert into employee values(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR');
insert into employee values(4,'Sushant','Singh',500000,'2020-02-17 9:00:00','Admin');
insert into employee values(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin');
insert into employee values(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account');
insert into employee values(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account');
insert into employee values(8,'Channdrika','Chauhan',90000,'2011-04-15 9:00:00','Admin');
-----------------------------------------------------------------------------------------------
create table employeebonus(
Employee_ref_id int,
Bonus_Amount int,
Bonus_Date datetime,
)
select * from employeebonus
insert into employeebonus values(1, 5000, '2020-02-16 0:00:00');
insert into employeebonus values(2, 3000, '2011-06-16 0:00:00');
insert into employeebonus values(3, 4000, '2020-02-16 0:00:00');
insert into employeebonus values(1, 4500, '2020-02-16 0:00:00');
insert into employeebonus values(2, 3500, '2011-06-16 0:00:00');

-----------------------------------------------------------------------------------------------
create table employeetitle(
Employee_ref_id  int,
employee_title varchar(20),
affective_date datetime,
)
select * from employeetitle
drop table employeetitle

insert into employeetitle values(1, 'Manager', '2016-02-20 0:00:00');
insert into employeetitle values(2, 'Executive', '2016-06-11 0:00:00');
insert into employeetitle values(8, 'Executive', '2016-06-11 0:00:00');
insert into employeetitle values(5, 'Manager', '2016-06-11 0:00:00');
insert into employeetitle values(4, 'Asst. Manager', '2016-06-11 0:00:00');
insert into employeetitle values(7, 'Executive', '2016-06-11 0:00:00');
insert into employeetitle values(6, 'Lead', '2016-06-11 0:00:00');
insert into employeetitle values(3, 'Lead', '2016-06-11 0:00:00');


-----------------------------------------------------------------------------------------------
Tasks To Be Performed:
-----------------------------------------------------------------------------------------------
--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.
select first_name as Employee_name from employee
-----------------------------------------------------------------------------------------------

--2 Display “LAST_NAME” from Employee table in upper case.
select upper(last_name) from employee
-----------------------------------------------------------------------------------------------

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct department from employee
-----------------------------------------------------------------------------------------------

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select substring(last_name,1,3) from employee
-----------------------------------------------------------------------------------------------

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
select distinct department and print len(department) from employee 
-----------------------------------------------------------------------------------------------

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a
single column AS FULL_NAME.
 a space char should separate them.
 select first_name+''+last_name as full_name from employee
-----------------------------------------------------------------------------------------------

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
select * from employee order by first_name 
-----------------------------------------------------------------------------------------------

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from employee order by first_name and department desc
-----------------------------------------------------------------------------------------------

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
select * from employee where first_name in('veena','karan')
-----------------------------------------------------------------------------------------------

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select * from employee where department like('Admin')
-----------------------------------------------------------------------------------------------

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
select * from employee where first_name like('v%')
-----------------------------------------------------------------------------------------------

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
select * from employee where salary between 100000 and 500000
-----------------------------------------------------------------------------------------------

--13 Display details of the employees who have joined in Feb-2020.
select * from employee where month('joining_date') in ('2') AND year('joining_date') in ('2020')

-----------------------------------------------------------------------------------------------

--14 Display employee names with salaries >= 50000 and <= 100000.
select * from employee where salary >= 50000 and salary <= 100000
-----------------------------------------------------------------------------------------------

--15 Display the number of Employees for each department in the descenting order.
select department,count(department) as No_of_employee from employee group by department order by No_of_employee desc 
-----------------------------------------------------------------------------------------------

--16 DISPLAY details of the EMPLOYEES who are also Managers.
select employee.e_id, employee.first_name, employee.last_name, employeetitle.employee_ref_id, 
employeetitle.employee_title from employee inner join employeetitle on employee.e_id=employeetitle.employee_ref_id
where employeetitle.employee_title='Manager'
-----------------------------------------------------------------------------------------------
select * from employee
select * from employeebonus
select * from employeetitle

--17 DISPLAY duplicate records having matching data in some fields of a table.
-----------------------------------------------------------------------------------------------

--18 Display only odd rows from a table.
-----------------------------------------------------------------------------------------------
--19 Clone a new table from EMPLOYEE table.

-----------------------------------------------------------------------------------------------

--20 DISPLAY the TOP 2 highest salary from a table.
select top 2(salary ), * from employee
-----------------------------------------------------------------------------------------------

--21. DISPLAY the list of employees with the same salary.
select * from employee where salary
-----------------------------------------------------------------------------------------------

--22 Display the second highest salary from a table.
select max(salary) from employee < (select max(salary) from employee)
-----------------------------------------------------------------------------------------------

--23 Display the first 50% records from a table.
-----------------------------------------------------------------------------------------------

--24. Display the departments that have less than 4 people in it.
select count(department),* from employee group by department having 4
-----------------------------------------------------------------------------------------------

--25. Display all departments along with the number of people in there.
select department,count(1) from employee group by department 
-----------------------------------------------------------------------------------------------

--26 Display the name of employees having the highest salary in each department.
select department, max(salary) from employee group by department
-----------------------------------------------------------------------------------------------

--27 Display the names of employees who earn the highest salary. 
select top 1 (salary),* from employee
-----------------------------------------------------------------------------------------------
--28 Diplay the average salaries for each department
select department, avg(salary) from employee group by department 
 -----------------------------------------------------------------------------------------------

--29 display the name of the employee who has got maximum bonus


-----------------------------------------------------------------------------------------------

--30 Display the first name and title of all the employees 
select employee.first_name,employee.e_id, employeetitle.employee_ref_id,emloyeetitle.employee_title 
from employee inner join employeetitle 
on  employee.e_id=employeetitle.employee_ref_id

select employee.
select * from employee.first_name, employee.last_name, employee.e_id, employeebonus.employee_ref_id, 
employeebonus.bonus_amount from employee inner join employeebonus on employee.e_id=employeebonus.employee_ref_id 
where employeebonus.bonus_amount
select * from employeebonus
select * from employeetitle




