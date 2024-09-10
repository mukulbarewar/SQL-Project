------------------------------------------------------------------------------------------------

--1. What is the cost of the costliest software development in Basic?
SELECT MAX (SCOST) FROM SOFTWARE WHERE DEVELOPIN LIKE 'BASIC';

------------------------------------------------------------------------------------------------
--2. Display details of Packages whose sales crossed the 2000 Mark.
      SELECT * FROM SOFTWARE WHERE (SOLD*SCOST)>20000;

------------------------------------------------------------------------------------------------
--3. Who are the Programmers who celebrate their Birthdays during the Current Month?
  **
  SELECT NAME FROM PROGRAMMER WHERE TO_CHAR (DOB,'MM')=TO_CHAR(SYSDATE,'MM');

------------------------------------------------------------------------------------------------
---4. Display the Cost of Package Developed By each Programmer.

      SELECT PNAME,SUM(DCOST) AS TOTAL_COST FROM SOFTWARE GROUP BY PNAME;

------------------------------------------------------------------------------------------------
--5. Display the sales values of the Packages Developed by each Programmer.

      SELECT PNAME, SUM(SCOST*SOLD) FROM SOFTWARE GROUP BY PNAME;

------------------------------------------------------------------------------------------------
--6. Display the Number of Packages sold by Each Programmer.
SELECT PNAME,SUM(SOLD) AS TotalSold FROM software GROUP BY PNAME

------------------------------------------------------------------------------------------------
--7. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
      SELECT PNAME,MIN(DCOST),MAX(DCOST) FROM SOFTWARE GROUP BY PNAME;

------------------------------------------------------------------------------------------------
--8. Display each institute name with the number of Courses, Average Cost per Course.

      SELECT INSTITUTE,COUNT(COURSE), AVG(COURSE_FEE) FROM STUDIES GROUP BY INSTITUTE;

------------------------------------------------------------------------------------------------
--9. Display each institute Name with Number of Students.
      SELECT INSTITUTE,COUNT(PNAME) FROM STUDIES GROUP BY INSTITUTE;

------------------------------------------------------------------------------------------------
--10. List the programmers (form the software table) and the institutes they studied.
------------------------------------------------------------------------------------------------
--11. How many packages were developed by students, who studied in institute that charge the lowest course fee?
SELECT PNAME, COUNT(TITLE) FROM software WHERE PNAME IN
(
SELECT PNAME FROM studies WHERE INSTITUTE =
(SELECT DISTINCT INSTITUTE FROM studies WHERE COURSE_FEE = (SELECT MIN(COURSE_FEE) FROM Studies))
)
GROUP BY PNAME

------------------------------------------------------------------------------------------------
--12. What is the AVG salary for those whose software sales is more than 50,000/-.
------------------------------------------------------------------------------------------------
--13. Which language listed in prof1, prof2 has not been used to develop any package.
SELECT DISTINCT PROF1 FROM programmer WHERE PROF1 NOT IN (SELECT DEVELOPIN FROM software) UNION
SELECT DISTINCT PROF2 FROM programmer WHERE PROF2 NOT IN (SELECT DEVELOPIN FROM software)

------------------------------------------------------------------------------------------------
--14. Display the total sales value of the software, institute wise.

select studies.INSTITUTE,sum(software.sold*software.scost) from software,studies
where studies.Pname=software.Pname group by studies.INSTITUTE;

------------------------------------------------------------------------------------------------
--15. Display the details of the Software Developed in C By female programmers of Pragathi.
select s.* from software s,studies st,programmer p 
where s.pname=st.pname and p.pname=s.pname and GENDER='f' and INSTITUTE='pragathi';
------------------------------------------------------------------------------------------------
--16. Display the details of the packages developed in Pascal by the Female Programmers.

select s.* from programmer p,software s where p.pname=s.pname and GENDER='f' and DEVELOPIN='pascal';

------------------------------------------------------------------------------------------------
--17. Which language has been stated as the proficiency by most of the Programmers?
CREATE TABLE #PCNT (PR VARCHAR(20), CNT INT)
CREATE TABLE #PsCNT (PRs VARCHAR(20), sCNT INT)

INSERT INTO #PCNT
SELECT PROF1, COUNT(PROF1) FROM programmer GROUP BY PROF1 UNION ALL
SELECT PROF2, COUNT(PROF2) FROM programmer GROUP BY PROF2

INSERT INTO #PsCNT
SELECT PR, SUM(CNT) FROM #PCNT GROUP BY PR

SELECT PRs, sCNT FROM #PsCNT WHERE sCNT = 
(SELECT MAX(sCNT) FROM #PsCNT)

------------------------------------------------------------------------------------------------
--18. Who is the Author of the Costliest Package?
      SELECT PNAME,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM   SOFTWARE);

------------------------------------------------------------------------------------------------
--19. Which package has the Highest Development cost?

SELECT TITLE,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

------------------------------------------------------------------------------------------------
--20. Who is the Highest Paid Female COBOL Programmer?

SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER 
WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND GENDER LIKE 'F';
------------------------------------------------------------------------------------------------
--21. Display the Name of Programmers and Their Packages.
      SELECT PNAME,TITLE FROM SOFTWARE ORDER BY PNAME;

------------------------------------------------------------------------------------------------
--22. Display the Number of Packages in Each Language Except C and C++.
     **
	 SELECT DEVELOPIN LANGUAGE,COUNT(TITLE) NO_of_PACK FROM SOFTWARE Where not like(C, C++)GROUP BY DEVELOPIN;


------------------------------------------------------------------------------------------------
--23. Display AVG Difference between SCOST, DCOST for Each Package.
      SELECT DEVELOPIN,AVG(DCOST - SCOST) FROM SOFTWARE GROUP BY DEVELOPIN;

------------------------------------------------------------------------------------------------
--24. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
SELECT SUM(SCOST), SUM(DCOST), SUM(DCOST-(SOLD*SCOST)) FROM SOFTWARE GROUP BY PNAME
HAVING SUM(DCOST)>SUM(SOLD*SCOST);

------------------------------------------------------------------------------------------------
--25. Who is the Highest Paid C Programmers?
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');

------------------------------------------------------------------------------------------------
--26. Who is the Highest Paid Female COBOL Programmer?
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER 
WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND GENDER LIKE 'F';