--1. Display the names of the highest paid programmers for each Language.

SELECT * FROM PROGRAMMER
WHERE SALARY=(SELECT MAX(SALARY)
FROM PROGRAMMER
WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL'))
------------------------------------------------------------------------------------------------
--2. Display the details of those who are drawing the same salary.

select pname, salary from programmer where salary = any(select salary from programmer p 
group by salary having salary=p.salary and count(*)>1);

------------------------------------------------------------------------------------------------
--3. Who are the programmers who joined on the same day?

select a.pname,a.doj from programmer a,programmer b where a.doj=b.doj and a.pname <> b.pname;

------------------------------------------------------------------------------------------------
--4. Who are the programmers who have the same Prof2?

select pname from programmer where prof2 = any(select prof2 from programmer
group by prof2 having count(*) >1);

------------------------------------------------------------------------------------------------
--5. How many packages were developed by the person who developed the cheapest package,
where did he/she study?

select count(*) from programmer p,software s 
where s.pname=p.Pname group by DEVELOPIN having min(dcost)=(select min(dcost) from software);
