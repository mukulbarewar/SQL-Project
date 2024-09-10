
select * from programmer
select * from studies
select * from software
-----------------------------------------------------------------------------------------------
--1. How many Programmers Don’t know PASCAL and C
 
 SELECT COUNT(PNAME) AS PROGRAMMER FROM PROGRAMMER 
 WHERE PROF1!='C' AND PROF1!='PASCAL' AND PROF2!='C' AND PROF2!='PASCAL' 

-----------------------------------------------------------------------------------------------

--2. Display the details of those who don’t know Clipper, COBOL or PASCAL.

SELECT * FROM programmer WHERE 
'CLIPPER' NOT IN (PROF1,PROF2) AND   
'COBOL' NOT IN (PROF1,PROF2) AND     
'PASCAL' NOT IN (PROF1,PROF2)

-----------------------------------------------------------------------------------------------
--3. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
     
	 SELECT DEVELOPIN,AVG(DCOST),AVG(SCOST),AVG(SCOST) FROM SOFTWARE GROUP BY DEVELOPIN;

-----------------------------------------------------------------------------------------------
--4. List the programmer names (from the programmer table) and No. Of Packages each has developed.
-----------------------------------------------------------------------------------------------
--5. How many packages were developed by the female programmers earning more than the highest paid male programmer?

select * from software



-----------------------------------------------------------------------------------------------
--6. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
select p1.salary,s2.course from programmer p1,software s1,studies s2 
where p1.name=s1.name and s1.name=s2.name and scost=(select max(scost) from software);
-----------------------------------------------------------------------------------------------
--7. In which institute did the person who developed the costliest package study?

select INSTITUTE from software st,studies s where s.pname=st.pname group by INSTITUTE,dcost 
having max(dcost)=(select max(dcost) from software);
select * from Programmer
select * from Software
select * from Studies

-----------------------------------------------------------------------------------------------
--8. Display the names of the programmers who have not developed any packages.
 
 select pname from Programmer where pname not in(select pname from software);

-----------------------------------------------------------------------------------------------
--9. Display the details of the software that has developed in the language which is neither the first
nor the second proficiency


-----------------------------------------------------------------------------------------------
--10. Display the details of the software Developed by the male programmers Born before 1965
and female programmers born after 1975

select software.* from programmer p,software s 
where s.name=p.name and sex='m' and to_char(dob,'yy')<64 or sex='f' and To_char(dob,'yy')>75);

-----------------------------------------------------------------------------------------------
--11. Display the number of packages, No. of Copies Sold and sales value of each programmer
-----institute wise.

select software.* from programmer p,software s 
where s.pname=p.pname and GENDER='m' and to_char(dob,'yy')<64 or GENDER='f' and To_char(dob,'yy')>75);

-----------------------------------------------------------------------------------------------
--12. Display the details of the Software Developed by the Male Programmers Earning More than 3000/
select s.* from programmer p,software s,studies st 
where p.Pname=s.Pname and s.Pname=st.Pname and Gender='M' and salary>3000;

select software.* from programmer p,software s 
where p.name=s.name and salary>3000 and sex='m';

-----------------------------------------------------------------------------------------------
--13. Who are the Female Programmers earning more than the Highest Paid male?

SELECT PNAME FROM PROGRAMMER 
WHERE GENDER = 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER
WHERE GENDER = 'M');

-----------------------------------------------------------------------------------------------

--14. Who are the male programmers earning below the AVG salary of Female Programmers?
SELECT PNAME
FROM PROGRAMMER
WHERE GENDER LIKE 'M'
AND SALARY < (SELECT(AVG(SALARY)) FROM PROGRAMMER WHERE GENDER LIKE 'F') 

-----------------------------------------------------------------------------------------------
--15. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT PNAME, DEVELOPIN FROM SOFTWARE 
WHERE SOLD IN (SELECT MAX(SOLD) 
FROM SOFTWARE GROUP BY PNAME) UNION SELECT PNAME, DEVELOPIN FROM SOFTWARE 
WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);

-----------------------------------------------------------------------------------------------
--16. Display the names of the packages, which have sold less than the AVG number of copies.

SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

-----------------------------------------------------------------------------------------------
--17. Which is the costliest package developed in PASCAL.
SELECT TITLE, DCOST, DEVELOPIN FROM Software
WHERE  DCOST=(SELECT MAX(DCOST) FROM Software WHERE DEVELOPIN='PASCAL')


-----------------------------------------------------------------------------------------------
--18. How many copies of the package that has the least difference between development and selling cost were sold.
--SELECT SOLD,TITLE FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE 
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) 
FROM SOFTWARE)

-----------------------------------------------------------------------------------------------
--19.Which language has been used to develop the package, which has the highest sales amount?
SELECT DEVELOPIN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE);

-----------------------------------------------------------------------------------------------
--20. Who Developed the Package that has sold the least number of copies?

SELECT PNAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE);

-----------------------------------------------------------------------------------------------
--21. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
select * from Studies
SELECT COURSE FROM STUDIES 
WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) AND COURSE_FEE > (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES);
-----------------------------------------------------------------------------------------------
--22. Display the name of the Institute and Course, which has below AVG course fee.

SELECT INSTITUTE,COURSE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES);

-----------------------------------------------------------------------------------------------
--23. Which Institute conducts costliest course.
  
  SELECT INSTITUTE FROM STUDIES WHERE COURSE_FEE = (SELECT MAX(COURSE_FEE) FROM STUDIES);

-----------------------------------------------------------------------------------------------
--24. What is the Costliest course?

SELECT MAX(Course) FROM STUDIES
