select * from programmer 
select * from studies 
select * from software
-------------------------------------------------------------------------------------------------
--1) What is the Highest Number of copies sold by a Package?
      SELECT MAX(SOLD) FROM SOFTWARE;

-------------------------------------------------------------------------------------------------
--2) Display lowest course Fee.
select min(course_fee) from studies
-------------------------------------------------------------------------------------------------
--3) How old is the Oldest Male Programmer.

SELECT MAX (FLOOR((SYSDATE - DOB)/365)) FROM PROGRAMMER WHERE GENDER = 'M'

select max(DOB) from Programmer where GENDER='M'
-------------------------------------------------------------------------------------------------
--4) What is the AVG age of Female Programmers?

select avg(age) from programmer where Gender like (F)
-------------------------------------------------------------------------------------------------
--5) Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
--SELECT PNAME, FLOOR ((SYSDATE - DOJ)/365) AS EXPERIENCE
FROM PROGRAMMER ORDER BY PNAME DESC;
-------------------------------------------------------------------------------------------------
--6) How many programmers have done the PGDCA Course?
select * from studies where course in('pgdca')
-------------------------------------------------------------------------------------------------
--7) How much revenue has been earned thru sales of Packages Developed in C.
    
	SELECT SUM (SOLD*SCOST) FROM SOFTWARE WHERE DEVELOPIN LIKE 'C';

-------------------------------------------------------------------------------------------------
--8) How many Programmers Studied at Sabhari?
select COUNT(institute) from Studies where INSTITUTE=''
-------------------------------------------------------------------------------------------------
--9) How many Packages Developed in DBASE?

select count(title) from Programmer p, Software s 
where s.PNAME=p.PNAME and GENDER='F' and salary >(select max(salary) from programmer 
where GENDER='M')

-------------------------------------------------------------------------------------------------
--10) How many programmers studied in Pragathi?
select * from Studies  where INSTITUTE in('pragathi')
-------------------------------------------------------------------------------------------------
select * from studies 
--11) How many Programmers Paid 5000 to 10000 for their course?
select count(pname) as no_of_programmer from studies where course_fee > 5000 and course_fee <10000
-------------------------------------------------------------------------------------------------
--12) How many Programmers know either COBOL or PASCAL?

SELECT COUNT(PNAME) AS PROGRAMMERS FROM PROGRAMMER 
WHERE PROF1='COBOL' OR PROF1='PASCAL' OR PROF2='COBOL' OR PROF2='PASCAL' 

-------------------------------------------------------------------------------------------------
--13) How many Female Programmers are there?

select count('F') from programmer

-------------------------------------------------------------------------------------------------
--14) What is the AVG Salary?

select avg(salary) as Avg_Sal from programmer

-------------------------------------------------------------------------------------------------
--15) How many people draw salary 2000 to 4000?

select * from programmer where salary >2000 and salary <4000

-------------------------------------------------------------------------------------------------
--16) Display the sales cost of the packages Developed by each Programmer Language wise

      SELECT DEVELOPIN, SUM(SCOST) FROM SOFTWARE GROUP BY DEVELOPIN;


-------------------------------------------------------------------------------------------------
--17) Display the details of the software developed by the male students of Sabhari.

--select s.* from programmer p,software s,studies st
where p.pname=s.pname and s.pname=st.pname and sex='m' and splace='sabhari';

-------------------------------------------------------------------------------------------------
--18) Who is the oldest Female Programmer who joined in 1992?

SELECT PNAME,DOB,YEAR(DOJ) FROM Programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
(SELECT MAX(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE YEAR(DOJ) ='1992');

-------------------------------------------------------------------------------------------------
--19) Who is the youngest male Programmer born in 1965?
SELECT PNAME, DOB FROM programmer WHERE DATEDIFF(DD,DOB,GETDATE())=
(SELECT MIN(DATEDIFF(DD,DOB,GETDATE())) FROM Programmer WHERE  year(DOB)=1965 AND GENDER='M')

--SELECT NAME FROM PROGRAMMER WHERE DOB=(SELECT (MAX(DOB)) FROM PROGRAMMER 
WHERE TO_CHAR(DOB,'YYYY') LIKE '1965');

-------------------------------------------------------------------------------------------------
--20) Which Package has the lowest selling cost?

SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

-------------------------------------------------------------------------------------------------
--21) Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?

SELECT * FROM PROGRAMMER 
WHERE GENDER = 'F' AND SALARY >3000 AND (PROF1 NOT IN('C','C++','ORACLE','DBASE') 
OR PROF2 NOT IN('C','C++','ORACLE','DBASE'));

-------------------------------------------------------------------------------------------------
--22) Who is the Youngest Programmer knowing DBASE?

--SELECT FLOOR((SYSDATE-DOB)/365) AGE, NAME, PROF1, PROF2 FROM PROGRAMMER 
WHERE FLOOR((SYSDATE-DOB)/365) = (SELECT MIN(FLOOR((SYSDATE-DOB)/365)) FROM PROGRAMMER 
WHERE PROF1 LIKE 'DBASE' OR PROF2 LIKE 'DBASE');

-------------------------------------------------------------------------------------------------
--23) Which Language is known by only one Programmer?

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 
NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 UNION SELECT PROF2 FROM PROGRAMMER 
GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1;

-------------------------------------------------------------------------------------------------
--24) Who is the most experienced male programmer knowing PASCAL?
Select PNAME As Name,GENDER,year(getdate())-year(DOJ)As Exp from Programmer
Where year(getdate())-year(DOJ)=(Select max(year(getdate())-year(DOJ))from Programmer) and
GENDER='M'and Prof1='Pascal'and Prof2='Pascal'
-------------------------------------------------------------------------------------------------
--25) Who is the least experienced Programmer?

SELECT PNAME, DATEDIFF(YY,DOJ,GETDATE()) AS EXPRNCE FROM programmer
WHERE DATEDIFF(YY,DOJ,GETDATE()) = (SELECT MIN(DATEDIFF(YY,DOJ,GETDATE()))FROM programmer)

-------------------------------------------------------------------------------------------------
--26) Display the Number of Packages in Each Language for which Development Cost is less than 1000.
      
	  SELECT COUNT(TITLE),DEVELOPIN FROM SOFTWARE WHERE DCOST<1000 GROUP BY DEVELOPIN;

-------------------------------------------------------------------------------------------------
--27) Display Highest, Lowest and Average Salaries for those earning more than 2000
      
	  SELECT MAX(SALARY), MIN(SALARY), AVG(SALARY) FROM PROGRAMMER WHERE SALARY > 2000;
