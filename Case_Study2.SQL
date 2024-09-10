----------------------------------------------------------------------------------------------
create table location(
location_id int not null,
city varchar(20),

primary key (location_id)
)
select * from location
insert into location values(122, 'New York');
insert into location values(123, 'Dallas');
insert into location values(124, 'Chicago');
insert into location values(167, 'Boston');
----------------------------------------------------------------------------------------------
create table department(
Department_id int not null,
Name varchar(20),
Location_Id int,

primary key (Department_id),
)
select * from department
select * from location

insert into department values(10, 'Accounting', 122);
select * from department
insert into department values(20, 'Sales', 124);
insert into department values(30, 'Research', 123);
insert into department values(40, 'Operation', 167);
----------------------------------------------------------------------------------------------
create table Job(
Job_Id int not null,
Designation varchar(20)
)

insert into job values(667, 'Clerk');
insert into job values(668, 'Staff');
insert into job values(669, 'Analyst');
insert into job values(670, 'Sales Person');
insert into job values(671, 'Manager');
insert into job values(672, 'President');

----------------------------------------------------------------------------------------------
create table Employee1(
Employee_id int not null,
Last_name varchar(20),
First_name varchar(20),
Middle_name varchar(20),
Job_id int,
Manager_id int,
Hire_Date Date,
Salary int,
Comm varchar(20),
Department_ID int
)
select * from Employee1
drop table employee1
insert into employee1 values(7369, 'SMITH', 'JOHN','Q',667,7902,'17-Dec-84',800,'NULL',20);
insert into employee1 values(7499, 'ALLEN', 'KEVIN','J',670,7698,'20-Feb-85',1600,'300',30);
insert into employee1 values(7505, 'DOYLE', 'JEAN','K',671,7839,'04-April-85',2850,'NULL',30);


insert into employee1 values(7506,'DENNIS','LYNN','S',671,7839,'15-May-85',2750,'NULL',30);
insert into employee1 values(7507,'BAKER','LESLIE','D',671,7839,'10-JUNE-1985',2200,'NULL',40);
insert into employee1 values(7521,'WARK','CYNTHIA','D',670,7698,'22-Feb-85',1250,500,30);

----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
SIMPLE QUERIES:

1. LIST ALL THE EMPLOYEE DETAILS.
select * from employee1

use assigment_23

2. LIST ALL THE DEPARTMENT DETAILS
select * from department

3. LIST ALL JOB DETAILS.
select * from job

4. LIST ALL THE LOCATIONS.
select * from location1

5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.
select first_name, ast_name, salary, comm from employee1

6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS
EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE",
DEPARTMENTID AS "DEP_ID".
select employee_id as 'ID OF THE EMPLOYEE', ast_name as 'NAME OF THE EMPLOYEE', department_id as 'DEP_ID' from employee1 

7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.
select first_name+ast_name as Employee_name, salary*12 as Annual_salary from employee1
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
WHERE CONDITION:
1. LIST THE DETAILS ABOUT "SMITH"
select * from employee1 where ast_name='smith'

2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.
select * from employee1 where department_id=20

3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.
select * from employee1 where salary between 3000 and 4500

4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.
select * from employee1 where department_id in (10,20)

5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.
select * from employee1 where department_id not in(10,20)

6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.
select * from employee1 where first_name like 's%' 

7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.
select * from employee1 where first_name like 's%' and like '%h'
8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.

9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE
SALARIES MORE THAN 3500.
select * from employee1 where department_id=10 AND salary >3500

10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.
select * from employee1 where comm in('null')
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
ORDER BY CLAUSE:
1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.
select employee_id, last_name from employee1 order by employee_id

2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.
select employee_id, first_name+' '+last_name from employee1 order by salary

3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER
select * from employee1 order by last_name

4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND
THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
select * from employee1 order by last_name,department_id desc
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
GROUP BY & HAVING CLAUSE
1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.

select count(*) from employee1 group by department_id
-----------------------------------------------------------------------------------------------

2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF
THE EMPLOYEES.
select department_id,max(salary) as max_sal, min(salary) as min_sal, avg(salary) as avg_sal from employee1 group by department_id
select * from employee1

-----------------------------------------------------------------------------------------------

3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE
EMPLOYEES.

select job_id,max(salary) as max_sal, min(salary) as min_sal, avg(salary) as avg_sal 
from employee1 group by job_id

-----------------------------------------------------------------------------------------------

4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.

select Month(Hire_Date) as Joining_Month,* from employee1 order by Month(Hire_Date)

-----------------------------------------------------------------------------------------------

5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING
ORDER BASED ON THE YEAR, MONTH.

SELECT YEAR(Hire_Date), MONTH(Hire_Date), COUNT(Employee_ID) FROM Employee1
GROUP BY YEAR(Hire_Date), MONTH(Hire_Date) ORDER BY YEAR(Hire_Date), MONTH(Hire_Date)

-----------------------------------------------------------------------------------------------

6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.

select count(employee_id), department_id from employee1 
group by department_id having count(department_id)>=4

-----------------------------------------------------------------------------------------------

7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.

select * from employee1 where MONTH(Hire_Date) in(1)

-----------------------------------------------------------------------------------------------
8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.

SELECT MONTH(Hire_Date), COUNT(Employee_ID) FROM Employee1
GROUP BY MONTH(Hire_Date) HAVING MONTH(Hire_Date) IN (1,9)

-----------------------------------------------------------------------------------------------
9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
select count(employee_id) from employee1 where YEAR(hire_date) in (1985)

-----------------------------------------------------------------------------------------------
10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
SELECT MONTH(Hire_Date),COUNT(Employee_ID) from Employee1 
GROUP BY MONTH(Hire_Date) HAVING YEAR(Hire_Date) IN (1985)

select * from employee1
-----------------------------------------------------------------------------------------------
11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?
select count(employee_id) from employee1 where MONTH(Hire_Date) in (3) AND YEAR(Hire_Date) in (1985) 

-----------------------------------------------------------------------------------------------
12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN
APRIL 1985?

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
JOINS
1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
select employee1.employee_id, employee1.first_name, employee1.ast_name, employee1.department_id,
department.department_id, department.name from employee1 left join department
on employee1.department_id=department.department_id

-----------------------------------------------------------------------------------------------
2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
select employee1.first_name, employee1.ast_name, employee1.job_id,job.job_id, job.designation 
from employee1 left join job 
on employee1.job_id=job.job_id

-----------------------------------------------------------------------------------------------
3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
select location.location_id, location.city, department.Location_Id,department.Name 
from department right join location on  department.Location_Id=location.location_id

select location.location_id, location.city, department.Location_Id,department.Name 
from department full join location on  department.Location_Id=location.location_id



select * from Employee1
select * from job
select * from department
select * from location
-----------------------------------------------------------------------------------------------
4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT NAMES.
select department.name, department.location_id,location.location_id, location.city 
from department right join 
location on department.location_id=location.location_id

select department.name, department.location_id,location.location_id, location.city 
from department left join 
location on department.location_id=location.location_id

select department.name, department.location_id,location.location_id, location.city 
from department inner join 
location on department.location_id=location.location_id

select department.name, department.location_id,location.location_id, location.city 
from department full join 
location on department.location_id=location.location_id 

-----------------------------------------------------------------------------------------------
5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
--5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.

SELECT E.*,Name FROM (SELECT Department_ID,COUNT(1) AS EMPCNT 
FROM Employee1 GROUP BY Department_ID )AS E

INNER JOIN Department AS D ON E.Department_ID=D.Department_ID

WHERE Name='Sales'

-----------------------------------------------------------------------------------------------
6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EMPLOYEES AND
DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.

-----------------------------------------------------------------------------------------------
7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
SELECT E.*,Name FROM (SELECT Department_ID,COUNT(1) AS EMPCNT 
FROM Employee1 GROUP BY Department_ID )AS E

INNER JOIN Department AS D ON E.Department_ID=D.Department_ID

WHERE Name='Sales'
select employee1.job_id, job.job_id, job.designation
from employee1 right join job on employee1.job_id=job.job_id

-----------------------------------------------------------------------------------------------
8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
select l.City, count(e.employee_id) as countemp from employee e
inner join department d
on e.edepartment_id = d.Department_Id
inner join Location l
on d.DLocation_ID = l.location_id
where l.City = 'dallas'
group by l.City

SELECT E.*,Name FROM (SELECT Department_ID,COUNT(1) AS EMPCNT 
FROM Employee1 GROUP BY Department_ID )AS E

INNER JOIN Department AS D ON E.Department_ID=D.Department_ID

WHERE Name='Sales'



-----------------------------------------------------------------------------------------------
9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
select *,(case when salary>2000 then 'grade A' 
When salary >1000 then 'grade B' else 'grade C' end) from employee1
select * from employee1

-----------------------------------------------------------------------------------------------
10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
select *,(case when department_id=10 then 'Grade A' when department_id=20 then 'Grade B' when department_id=30 then 'Grade C' else 'Grade D' end) from employee1

-----------------------------------------------------------------------------------------------
11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.
select *,(case when salary>2000 then 'grade A' 
When salary >1000 then 'grade B' else 'grade C' end) from employee1
select * from employee1 
----------------------------------------------------------------------------------------------
12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
14. SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.
15. DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
----------------------------------------------------------------------------------------------
16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
select employee1.first_name, employee1.last_name,
employee1.department_id,department.department_id,
department.name from employee1 right join department
on employee1.department_id=department.department_id where name in (('sales') OR ('operation'))
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
SET OPERATORS
1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.

select employee1.first_name,employee1.last_name,employee1.job_id,employee1.department_id,job.Job_Id,Job.Designation,
department.Department_id,department.Name from employee1 inner join Job on employee1.job_id=Job.Job_Id inner join department 
on employee1.department_id=department.Department_id where department.Name in('sales','Accounting')
-----------------------------------------------------------------------------------------------
2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select Employee1.first_name, Employee1.last_name, Employee1.department_id, department.department_id, department.name 
from employee1 right join department on Employee1.department_id=department.department_id where Name in('sales')

----------------------------------------------------------------------------------------------
3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER.

select employee1.first_name,employee1.last_name,employee1.job_id,employee1.department_id,job.Job_Id,Job.Designation,
department.Department_id,department.Name from employee1 inner join Job on employee1.job_id=Job.Job_Id inner join department 
on employee1.department_id=department.Department_id where department.Name in('Research','Accounting')

----------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------
SUB QUERIES
1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.
select top(5) salary,first_name,last_name from employee1 order by salary
-----------------------------------------------------------------------------------------------
2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select * from employee where (select * from department where name= 'sales')

-----------------------------------------------------------------------------------------------
3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
select (select * from job where designation in ('clerk')) as clerk, * from empployee1

-----------------------------------------------------------------------------------------------
4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
select employee1.first_name, employee1.last_name,department.Department_id, department.Location_Id, department.Name, 

-----------------------------------------------------------------------------------------------
5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.
select department.Department_id, department.Name, employee1.department_id, 

-----------------------------------------------------------------------------------------------
6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.

-----------------------------------------------------------------------------------------------
7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.

-----------------------------------------------------------------------------------------------
8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select max(salary) from employee1 where salary<(select max(salary) from employee1)

-----------------------------------------------------------------------------------------------
9. DISPLAY THE 'N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select top(6)salary from employee1 order by salary

-----------------------------------------------------------------------------------------------
10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
select top(5)salary, first_name, last_name from employee1 where department_id in (30)

-----------------------------------------------------------------------------------------------
11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
select max(salary) from epmloyee1 < select max(salary) from employee1

-----------------------------------------------------------------------------------------------
12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
--select department.Department_id, employee1.department_id from department d left join employee1 e
--on d.Department_id=e.department_id where e.department_id is null

-----------------------------------------------------------------------------------------------
13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
select department_id,count(employee_id) from employee1 group by department_id having department_id=0

-----------------------------------------------------------------------------------------------
14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR
DEPARTMENT.
select avg(salary) from employee1 where salary>avg(salary)


























