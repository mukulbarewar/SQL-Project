--1. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmer
**
select software.* from programmer,software,studies
where programmer.Pname=software.Pname and software.Pname=studies.Pname 
and programmer.Pname=studies.Pname and GENDER='m' and DEVELOPIN='dbase' 
and INSTITUTE= (select INSTITUTE from studies 
group by INSTITUTE having count(INSTITUTE) =(select max(count(INSTITUTE))
from studies group by INSTITUTE));

------------------------------------------------------------------------------------------------
--2. In which language are most of the programmer’s proficient?
**
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING COUNT(PROF1)=(SELECT  MAX(COUNT(PROF1)) 
FROM PROGRAMMER GROUP BY PROF1) OR COUNT(PROF2)=(SELECT MAX(COUNT(PROF2))
FROM PROGRAMMER GROUP BY PROF2)
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(PROF1)=(SELECT MAX(COUNT(PROF1)) 
FROM PROGRAMMER   GROUP BY PROF1) OR COUNT(PROF2)=(SELECT MAX(COUNT(PROF2)) 
FROM PROGRAMMERGROUP BY PROF2);

------------------------------------------------------------------------------------------------
--3. In which month did the most number of programmers join?
**
SELECT DISTINCT TO_CHAR(DOJ,'MONTH') FROM PROGRAMMER 
WHERE TO_CHAR(DOJ,'MON') = (SELECT MIN(TO_CHAR(DOJ,'MON')) FROM PROGRAMMER);

------------------------------------------------------------------------------------------------
--4. In which year was the most number of Programmers born.
**
SELECT DISTINCT TO_CHAR(DOB,'YYYY') FROM PROGRAMMER 
WHERE TO_CHAR(DOJ,'YYYY') = (SELECT MIN(TO_CHAR(DOJ,'YYYY')) FROM PROGRAMMER);

------------------------------------------------------------------------------------------------
--5. Which programmer has developed the highest number of Packages?

SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING MAX(PNAME) = (SELECT MAX(PNAME) FROM SOFTWARE);

------------------------------------------------------------------------------------------------

--6. Which language was used to develop the most number of Packages.

SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN HAVING MAX(DEVELOPIN) = (SELECT MAX(DEVELOPIN) 
FROM SOFTWARE);

------------------------------------------------------------------------------------------------
--7. Which course has below average number of Students?
**
SELECT COURSE FROM STUDIES GROUP BY COURSE HAVING COUNT(PNAME)<(SELECT AVG(COUNT(PNAME)) 
FROM STUDIES GROUP BY COURSE) ;

------------------------------------------------------------------------------------------------
--8. Which course has been done by the most of the Students?
**
SELECT COURSE FROM STUDIES GROUP BY COURSE HAVING COUNT(COURSE)= (SELECT MAX(COUNT(COURSE)) 
FROM STUDIES GROUP BY COURSE);

------------------------------------------------------------------------------------------------
--9. Which Institute has the most number of Students?
CREATE TABLE #InstStudNo (InsNam VARCHAR(20), StdNo INT)

INSERT INTO #InstStudNo
SELECT INSTITUTE,COUNT(PNAME) FROM studies GROUP BY INSTITUTE

SELECT InsNam,StdNo AS COUNT_OF_STUDENTS FROM #InstStudNo WHERE StdNo = 
(SELECT MAX(StdNo) FROM #InstStudNo)


------------------------------------------------------------------------------------------------
--10. Who is the Above Programmer Referred in 50?
CREATE TABLE #PSLang(PROF VARCHAR(20))

INSERT INTO #PSLang 
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer INNER JOIN #PSLang ON
PROF=PROF1 OR PROF=PROF2

------------------------------------------------------------------------------------------------
--11. Display the names of the highest paid programmers for each Language.
**
SELECT DISTINCT PNAME, SALARY, PROF1 FROM PROGRAMMER 
WHERE (SALARY,PROF1) IN (SELECT MAX(SALARY),PROF1 FROM PROGRAMMER GROUP BY PROF1);


https://www.cliffsnotes.com/file/188945063/Assignment-SQL-Queriesdocx/
