select pname, age(dob) from Programmer
select * from Programmer
select * from Studies
select * from Software

--Problem Statement: Consider yourself to be Sam and you have been given the below tasks to complete using the Table – STUDIES, SOFTWARE & PROGRAMMER.

--1. Find out the selling cost AVG for packages developed in Pascal.
SELECT AVG (SCOST) as Avg_SCOST FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL';

----------------------------------------------------------------------------------------------
--2. Display Names, Ages of all Programmers.
select pname from programmer 

----------------------------------------------------------------------------------------------
--3. Display the Names of those who have done the DAP Course.

   select pname from studies where course='dap'

----------------------------------------------------------------------------------------------
--4. Display the Names and Date of Births of all Programmers Born in January.

Select PNAME,DOB,DATENAME(Month,DOB)Month from Programmer where DATENAME(Month,DOB)='JANUARY'
----------------------------------------------------------------------------------------------

--5. Display the Details of the Software Developed by Ramesh.

SELECT *
FROM SOFTWARE
WHERE PNAME='RAMESH'

----------------------------------------------------------------------------------------------

--6. Display the Details of Packages for which Development Cost have been recovered.

  SELECT * FROM SOFTWARE WHERE (SOLD*SCOST)>DCOST;

----------------------------------------------------------------------------------------------

--7. Display the details of the Programmers Knowing C.
select * from Software where developin= 'c'

----------------------------------------------------------------------------------------------
--8. What are the Languages studied by Male Programmers?


select Programmer.PNAME, Programmer.GENDER, Studies.COURSE from programmer inner join Studies
on programmer.PNAME=studies.PNAME where GENDER='M'

----------------------------------------------------------------------------------------------
--9. Display the details of the Programmers who joined before 1990.
	  select * from PROGRAMMER where year(doj)< 1990
	  SELECT * FROM Programmer WHERE YEAR(DOJ)<1990;

----------------------------------------------------------------------------------------------
--10. Who are the authors of the Packages, which have recovered more than double the Development cost?
Select PNAME from Software where SOLD*SCOST>2*DCOST

----------------------------------------------------------------------------------------------
select * from Programmer
select * from Studies
select * from Software






