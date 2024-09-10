
-------------------------------------------------------------------------------------------------
--1. Find out the selling cost AVG for packages developed in Pascal.

SELECT AVG (SCOST) FROM SOFTWARE WHERE DEV_IN LIKE 'PASCAL';

-------------------------------------------------------------------------------------------------
--2. Display Names, Ages of all Programmers.

SELECT NAME AS NAME, FLOOR((SYSDATE-DOB)/365) AS AGE FROM PROGRAMMER;

-------------------------------------------------------------------------------------------------
--3. Display the Names of those who have done the DAP Course.
-------------------------------------------------------------------------------------------------
--4. Display the Names and Date of Births of all Programmers Born in January.

SELECT DOB, NAME FROM PROGRAMMER WHERE TO_CHAR(DOB,'MON') LIKE 'JAN';

-------------------------------------------------------------------------------------------------
--5. What is the Highest Number of copies sold by a Package?
  
  SELECT MAX(SOLD) FROM SOFTWARE;

-------------------------------------------------------------------------------------------------
--6. Display lowest course Fee.

SELECT MIN (CCOST) FROM STUDIES;

-------------------------------------------------------------------------------------------------
--7. How many programmers done the PGDCA Course?
  
  SELECT COUNT (NAME) FROM STUDIES WHERE COURSE LIKE 'PGDCA';

-------------------------------------------------------------------------------------------------
--8. How much revenue has been earned thru sales of Packages Developed in C.
  
  SELECT SUM (SOLD*SCOST) FROM SOFTWARE WHERE DEV_IN LIKE 'C';

-------------------------------------------------------------------------------------------------
--9. Display the Details of the Software Developed by Ramesh.
  
  SELECT * FROM SOFTWARE WHERE NAME='RAMESH';

-------------------------------------------------------------------------------------------------
10. How many Programmers Studied at Sabhari?
      SELECT COUNT (NAME) AS NOPROGRAMMERS FROM STUDIES WHERE SPLACE='SABHARI';

-------------------------------------------------------------------------------------------------
11. Display details of Packages whose sales crossed the 2000 Mark.
      SELECT * FROM SOFTWARE WHERE (SOLD*SCOST)>20000;

-------------------------------------------------------------------------------------------------
12. Display the Details of Packages for which Development Cost have been recovered.
      SELECT * FROM SOFTWARE WHERE (SOLD*SCOST)>DCOST;

-------------------------------------------------------------------------------------------------
13. What is the cost of the costliest software development in Basic?
SELECT MAX (SCOST) FROM SOFTWARE WHERE DEV_IN LIKE 'BASIC';

-------------------------------------------------------------------------------------------------
14. How many Packages Developed in DBASE?
      SELECT COUNT (TITLE) AS TOTAL FROM SOFTWARE WHERE DEV_IN='DBASE';

-------------------------------------------------------------------------------------------------
15. How many programmers studied in Pragathi?
      SELECT COUNT (NAME) FROM STUDIES WHERE SPLACE='PRAGATHI';

-------------------------------------------------------------------------------------------------
16. How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT (NAME) AS NO_OF_PROGRAMMERS FROM STUDIES WHERE CCOST>=5000 AND CCOST<=10000;

-------------------------------------------------------------------------------------------------
17. What is AVG Course Fee
      SELECT AVG (CCOST) AS AVERAGECOST FROM STUDIES;

-------------------------------------------------------------------------------------------------
18. Display the details of the Programmers Knowing C.
SELECT * FROM PROGRAMMER WHERE PROF1='C' OR PROF2='C';

-------------------------------------------------------------------------------------------------
19. How many Programmers know either COBOL or PASCAL.
SELECT COUNT (NAME) AS PROGRAMMERS FROM PROGRAMMER WHERE PROF1 IN ('COBOL' ,'PASCAL' ) OR PROF2 IN ('COBOL' ,'PASCAL' );

-------------------------------------------------------------------------------------------------
20. How many Programmers Don’t know PASCAL and C
SELECT COUNT (NAME) AS PROGRAMMERS FROM PROGRAMMER WHERE PROF1 NOT IN ('C','PASCAL')
AND PROF2 NOT IN ('C','PASCAL');
-------------------------------------------------------------------------------------------------
21. How old is the Oldest Male Programmer.
      SELECT MAX (FLOOR((SYSDATE - DOB)/365)) FROM PROGRAMMER WHERE SEX = ‘M’;

-------------------------------------------------------------------------------------------------
22. What is the AVG age of Female Programmers?
      SELECT AVG (FLOOR((SYSDATE - DOB)/365)) FROM PROGRAMMER WHERE SEX = ‘F’;

-------------------------------------------------------------------------------------------------
23. Calculate the Experience in Years for each Programmer and Display with their
names in Descending order.
SELECT NAME, FLOOR ((SYSDATE - DOJ)/365) AS EXPERIENCE FROM PROGRAMMER ORDER BY NAME DESC;

-------------------------------------------------------------------------------------------------
24. Who are the Programmers who celebrate their Birthday’s During the Current
Month?
      SELECT NAME FROM PROGRAMMER WHERE TO_CHAR (DOB,'MM')=TO_CHAR(SYSDATE,'MM');

-------------------------------------------------------------------------------------------------
25. How many Female Programmers are there?
      SELECT COUNT (NAME) FEMALE_PROG FROM PROGRAMMER WHERE SEX='F';

-------------------------------------------------------------------------------------------------
26. What are the Languages studied by Male Programmers.
SELECT DISTINCT PROF1 LANGUAGES FROM PROGRAMMER WHERE SEX='M' UNION
SELECT DISTINCT PROF2 FROM PROGRAMMERWHERE SEX='M';
-------------------------------------------------------------------------------------------------
27. What is the AVG Salary?
      SELECT AVG (SALARY) AS AVGSAL FROM PROGRAMMER;

-------------------------------------------------------------------------------------------------
28. How many people draw salary 2000 to 4000?
      SELECT NAME FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000;

-------------------------------------------------------------------------------------------------
29. Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT * FROM PROGRAMMER WHERE PROF1 NOT IN ('CLIPPER','COBOL','PASCAL') AND PROF2 NOT IN ('CLIPPER','COBOL','PASCAL');

-------------------------------------------------------------------------------------------------
30. Display the Cost of Package Developed By each Programmer.
      SELECT NAME,SUM(DCOST) AS TOTAL_COST FROM SOFTWARE GROUP BY NAME;

-------------------------------------------------------------------------------------------------
31. Display the sales values of the Packages Developed by the each Programmer.
      SELECT NAME, SUM(SCOST*SOLD) FROM SOFTWARE GROUP BY NAME;

-------------------------------------------------------------------------------------------------
32. Display the Number of Packages sold by Each Programmer.
-------------------------------------------------------------------------------------------------
33. Display the sales cost of the packages Developed by each Programmer Language wise.
      SELECT DEV_IN, SUM(SCOST) FROM SOFTWARE GROUP BY DEV_IN;

-------------------------------------------------------------------------------------------------
34. Display each language name with AVG Development Cost, AVG Selling Cost and
AVG Price per Copy.
      SELECT DEV_IN,AVG(DCOST),AVG(SCOST),AVG(SCOST) FROM SOFTWARE GROUP BY DEV_IN;

-------------------------------------------------------------------------------------------------
35. Display each programmer’s name, costliest and cheapest Packages Developed by him or
her.
      SELECT NAME,MIN(DCOST),MAX(DCOST) FROM SOFTWARE GROUP BY NAME;

-------------------------------------------------------------------------------------------------
36. Display each institute name with number of Courses, Average Cost per Course.
      SELECT SPLACE,COUNT(COURSE), AVG(CCOST) FROM STUDIES GROUP BY SPLACE;

-------------------------------------------------------------------------------------------------
37. Display each institute Name with Number of Students.
      SELECT SPLACE,COUNT(NAME) FROM STUDIES GROUP BY SPLACE;

-------------------------------------------------------------------------------------------------
38. Display Names of Male and Female Programmers. Gender also.
      SELECT NAME,SEX FROM PROGRAMMER ORDER BY SEX;

-------------------------------------------------------------------------------------------------
39. Display the Name of Programmers and Their Packages.
      SELECT NAME,TITLE FROM SOFTWARE ORDER BY NAME;

-------------------------------------------------------------------------------------------------
40. Display the Number of Packages in Each Language Except C and C++.
-------------------------------------------------------------------------------------------------
41. Display the Number of Packages in Each Language for which Development Cost is
less than 1000.
      SELECT COUNT(TITLE),DEV_IN FROM SOFTWARE WHERE DCOST<1000 GROUP BY DEV_IN;

-------------------------------------------------------------------------------------------------
42. Display AVG Difference between SCOST, DCOST for Each Package.
      SELECT DEV_IN,AVG(DCOST - SCOST) FROM SOFTWARE GROUP BY DEV_IN;

-------------------------------------------------------------------------------------------------
43. Display the total SCOST, DCOST and amount to Be Recovered for each
Programmer for Those Whose Cost has not yet been Recovered.
SELECT SUM(SCOST), SUM(DCOST), SUM(DCOST-(SOLD*SCOST)) FROM SOFTWARE GROUP BY NAME
HAVING SUM(DCOST)>SUM(SOLD*SCOST);

-------------------------------------------------------------------------------------------------
44. Display Highest, Lowest and Average Salaries for those earning more than 2000.
      SELECT MAX(SALARY), MIN(SALARY), AVG(SALARY) FROM PROGRAMMER WHERE SALARY > 2000;

-------------------------------------------------------------------------------------------------
45. Who is the Highest Paid C Programmers?
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER 
WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');

-------------------------------------------------------------------------------------------------
46. Who is the Highest Paid Female COBOL Programmer?
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER
WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND SEX LIKE 'F';

-------------------------------------------------------------------------------------------------
47. Display the names of the highest paid programmers for each Language.
SELECT DISTINCT NAME, SALARY, PROF1 FROM PROGRAMMER
WHERE (SALARY,PROF1) IN (SELECT MAX(SALARY),PROF1 FROM PROGRAMMER GROUP BY PROF1);

-------------------------------------------------------------------------------------------------
48. Who is the least experienced Programmer.
SELECT FLOOR((SYSDATE-DOJ)/365) EXP,NAME FROM PROGRAMMER 
WHERE FLOOR((SYSDATE-DOJ)/365) = (SELECT MIN(FLOOR((SYSDATE-DOJ)/365)) FROM PROGRAMMER);

-------------------------------------------------------------------------------------------------
49. Who is the most experienced male programmer knowing PASCAL.
-------------------------------------------------------------------------------------------------
50. Which Language is known by only one Programmer?
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 
HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1)=1 UNION SELECT PROF2 
FROM PROGRAMMER 
GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1;

-------------------------------------------------------------------------------------------------
51. Who is the Above Programmer Referred in 50?
-------------------------------------------------------------------------------------------------
52. Who is the Youngest Programmer knowing DBASE?
SELECT FLOOR((SYSDATE-DOB)/365) AGE, NAME, PROF1, PROF2 FROM PROGRAMMER
WHERE FLOOR((SYSDATE-DOB)/365) = (SELECT MIN(FLOOR((SYSDATE-DOB)/365)) FROM PROGRAMMER 
WHERE PROF1 LIKE 'DBASE' OR PROF2 LIKE 'DBASE');

-------------------------------------------------------------------------------------------------
53. Which Female Programmer earning more than 3000 does not know C, C++,
ORACLE or DBASE?
SELECT * FROM PROGRAMMER WHERE SEX = 'F' AND SALARY >3000 
AND (PROF1 NOT IN('C','C++','ORACLE','DBASE') OR PROF2
NOT IN('C','C++','ORACLE','DBASE'));
-------------------------------------------------------------------------------------------------
54. Which Institute has most number of Students?
SELECT SPLACE FROM STUDIES GROUP BY SPLACE
HAVING COUNT(SPLACE)= (SELECT MAX(COUNT(SPLACE)) FROM STUDIES GROUP BY SPLACE);

-------------------------------------------------------------------------------------------------
55. What is the Costliest course?
SELECT COURSE FROM STUDIES WHERE CCOST = (SELECT MAX(CCOST) FROM STUDIES);

-------------------------------------------------------------------------------------------------
56. Which course has been done by the most of the Students?
SELECT COURSE FROM STUDIES GROUP BY COURSE HAVING COUNT(COURSE)= (SELECT MAX(COUNT(COURSE)) FROM STUDIES GROUP BY COURSE);

-------------------------------------------------------------------------------------------------
57. Which Institute conducts costliest course.
      SELECT SPLACE FROM STUDIES WHERE CCOST = (SELECT MAX(CCOST) FROM STUDIES);

-------------------------------------------------------------------------------------------------
58. Display the name of the Institute and Course, which has below AVG course fee.
-------------------------------------------------------------------------------------------------
59. Display the names of the courses whose fees are within 1000 (+ or -) of the
Average Fee,
SELECT COURSE FROM STUDIES 
WHERE CCOST < (SELECT AVG(CCOST)+1000 FROM STUDIES) 
AND CCOST > (SELECT AVG(CCOST)-1000 FROM STUDIES);
-------------------------------------------------------------------------------------------------
60. Which package has the Highest Development cost?
SELECT TITLE,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

.-------------------------------------------------------------------------------------------------
61. Which course has below AVG number of Students?
SELECT COURSE FROM STUDIES GROUP BY COURSE HAVING COUNT(NAME)<(SELECT AVG(COUNT(NAME)) 
FROM STUDIES GROUP BY COURSE) ;
-------------------------------------------------------------------------------------------------
62. Which Package has the lowest selling cost?
SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

-------------------------------------------------------------------------------------------------
63. Who Developed the Package that has sold the least number of copies?
SELECT NAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE);

-------------------------------------------------------------------------------------------------
64. Which language has used to develop the package, which has the highest
sales amount?

SELECT DEV_IN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE);

-------------------------------------------------------------------------------------------------
65. How many copies of package that has the least difference between
development and selling cost where sold.

SELECT SOLD,TITLE FROM SOFTWARE WHERE TITLE = (SELECT TITLE FROM SOFTWARE 
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE);

-------------------------------------------------------------------------------------------------
66. Which is the costliest package developed in PASCAL.
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) 
FROM SOFTWARE WHERE DEV_IN LIKE 'PASCAL');

-------------------------------------------------------------------------------------------------
67. Which language was used to develop the most number of Packages.
SELECT DEV_IN FROM SOFTWARE GROUP BY DEV_IN HAVING MAX(DEV_IN) = (SELECT MAX(DEV_IN) 
FROM SOFTWARE);

-------------------------------------------------------------------------------------------------
68. Which programmer has developed the highest number of Packages?
SELECT NAME FROM SOFTWARE GROUP BY NAME HAVING MAX(NAME) = (SELECT MAX(NAME) FROM SOFTWARE);
-------------------------------------------------------------------------------------------------
69. Who is the Author of the Costliest Package?
      SELECT NAME,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM   SOFTWARE);

-------------------------------------------------------------------------------------------------
70. Display the names of the packages, which have sold less than the AVG
number of copies.
SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

-------------------------------------------------------------------------------------------------
71. Who are the authors of the Packages, which have recovered more than double the
Development cost?
      SELECT NAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST;

-------------------------------------------------------------------------------------------------
72. Display the programmer Name and the cheapest packages developed by them in
each language.
SELECT NAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) 
FROM SOFTWARE GROUP BY DEV_IN);

-------------------------------------------------------------------------------------------------
73. Display the language used by each programmer to develop the Highest
Selling and Lowest-selling package.
SELECT NAME, DEV_IN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE 
GROUP BY NAME) UNION SELECT NAME, DEV_IN FROM SOFTWARE 
WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY NAME);
-------------------------------------------------------------------------------------------------
74. Who is the youngest male Programmer born in 1965?
SELECT NAME FROM PROGRAMMER WHERE DOB=(SELECT (MAX(DOB)) FROM PROGRAMMER 
WHERE TO_CHAR(DOB,'YYYY') LIKE '1965');

-------------------------------------------------------------------------------------------------
75. Who is the oldest Female Programmer who joined in 1992?
SELECT NAME FROM PROGRAMMER WHERE DOJ=(SELECT (MIN(DOJ)) FROM PROGRAMMER 
WHERE TO_CHAR(DOJ,'YYYY') LIKE '1992');

-------------------------------------------------------------------------------------------------
76. In which year was the most number of Programmers born.
SELECT DISTINCT TO_CHAR(DOB,'YYYY') FROM PROGRAMMER
WHERE TO_CHAR(DOJ,'YYYY') = (SELECT MIN(TO_CHAR(DOJ,'YYYY')) FROM PROGRAMMER);

-------------------------------------------------------------------------------------------------
77. In which month did most number of programmers join?
SELECT DISTINCT TO_CHAR(DOJ,'MONTH') FROM PROGRAMMER
WHERE TO_CHAR(DOJ,'MON') = (SELECT MIN(TO_CHAR(DOJ,'MON')) FROM PROGRAMMER);

-------------------------------------------------------------------------------------------------
78. In which language are most of the programmer’s proficient.
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING COUNT(PROF1)=(SELECT  MAX(COUNT(PROF1))
FROM PROGRAMMER GROUP BY PROF1) OR COUNT(PROF2)=(SELECT MAX(COUNT(PROF2))
FROM PROGRAMMER GROUP BY PROF2)
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING COUNT(PROF1)=(SELECT MAX(COUNT(PROF1)) 
FROM PROGRAMMER   GROUP BY PROF1) OR COUNT(PROF2)=(SELECT MAX(COUNT(PROF2)) 
FROM PROGRAMMERGROUP BY PROF2);

-------------------------------------------------------------------------------------------------
79. Who are the male programmers earning below the AVG salary of
Female Programmers?
SELECT NAME FROM PROGRAMMER WHERE SEX = 'M' AND SALARY < (SELECT(AVG(SALARY))
FROM PROGRAMMER WHERE SEX = 'F');
-------------------------------------------------------------------------------------------------
80. Who are the Female Programmers earning more than the Highest Paid?
SELECT NAME FROM PROGRAMMER WHERE SEX = 'F' AND SALARY > (SELECT(MAX(SALARY)) 
FROM PROGRAMMER WHERE SEX = 'M');

-------------------------------------------------------------------------------------------------
81. Which language has been stated as the proficiency by most of the Programmers?
SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 
HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER);

-------------------------------------------------------------------------------------------------
82. Display the details of those who are drawing the same salary.
select name, salary from programmer where salary = any(select salary from programmer p 
group by salary having salary=p.salary and count(*)>1);
-------------------------------------------------------------------------------------------------
83. Display the details of the Software Developed by the Male Programmers Earning
More than 3000/-.
select software.* from programmer p,software s where p.name=s.name
and salary>3000 and sex='m';

-------------------------------------------------------------------------------------------------
84. Display the details of the packages developed in Pascal by the Female
Programmers.
select s.* from programmer p,software s 
where p.name=s.name and sex='f' and dev_in='pascal';

-------------------------------------------------------------------------------------------------
85. Display the details of the Programmers who joined before 1990
      select * from programmer where to_char(doj,'yy')<90;

-------------------------------------------------------------------------------------------------
86. Display the details of the Software Developed in C By female programmers of
Pragathi.
select s.* from software s,studies st,programmer p where s.name=st.name 
and p.name=s.name and sex='f' and splace='pragathi';
-------------------------------------------------------------------------------------------------
87. Display the number of packages, No. of Copies Sold and sales value of
each programmer institute wise.
Select studies.splace, count(software.dev_in), count(software.sold), sum(software.sold*software.scost)
from software,studies
where software.name=studies.name group by studies.splace;
-------------------------------------------------------------------------------------------------
88. Display the details of the software developed in DBASE by Male Programmers, who
belong to the institute in which most number of Programmers studied.

select software.* from programmer,software,studies 
where programmer.name=software.name and software.name=studies.name 
and programmer.name=studies.name and sex='m' and dev_in='dbase' 
and splace= (select splace from studies 
group by splace having count(splace) =(select max(count(splace))from studies 
group by splace));

-------------------------------------------------------------------------------------------------
89. Display the details of the software Developed by the male programmers Born
before 1965 and female programmers born after 1975.

select software.* from programmer p,software s where s.name=p.name and sex='m' 
and to_char(dob,'yy')<64 or sex='f' and To_char(dob,'yy')>75);
-------------------------------------------------------------------------------------------------
90. Display the details of the software that has developed in the language which is
neither the first nor the second proficiency of the programmers.
-------------------------------------------------------------------------------------------------
91. Display the details of the software developed by the male students of Sabhari.
select s.* from programmer p,software s,studies st where p.name=s.name
and s.name=st.name and sex='m' and splace='sabhari';
-------------------------------------------------------------------------------------------------
92. Display the names of the programmers who have not developed any packages.
      select name from programmer where name not in(select name from software);

-------------------------------------------------------------------------------------------------
93. What is the total cost of the Software developed by the programmers of Apple?
select sum(scost) from software s,studies st where s.name=st.name and splace='apple';

-------------------------------------------------------------------------------------------------
94. Who are the programmers who joined on the same day?
select a.name,a.doj from programmer a,programmer b where a.doj=b.doj and a.name <> b.name;

-------------------------------------------------------------------------------------------------
95. Who are the programmers who have the same Prof2?
select name from programmer where prof2 = any(select prof2 from programmer 
group by prof2 having count(*) >1);

-------------------------------------------------------------------------------------------------
96. Display the total sales value of the software, institute wise.
select studies.splace,sum(software.sold*software.scost) from software,studies 
where studies.name=software.name group by studies.splace;

-------------------------------------------------------------------------------------------------
97. In which institute does the person who developed the costliest package studied.
select splace from software st,studies s where s.name=st.name 
group by splace,dcost having max(dcost)=(select max(dcost) from software);

-------------------------------------------------------------------------------------------------
98. Which language listed in prof1, prof2 has not been used to develop any package.

select prof1 from programmer where prof1 not in(select dev_in from software)
union select prof2 from programmer 
where prof2 not in(select dev_in from software);

-------------------------------------------------------------------------------------------------
99. How much does the person who developed the highest selling package earn and
what course did HE/SHE undergo. 
select p1.salary,s2.course from programmer p1,software s1,studies s2 
where p1.name=s1.name and s1.name=s2.name and scost=(select max(scost) from software);
-------------------------------------------------------------------------------------------------
100. What is the AVG salary for those whose software sales is more than 50,000/-.
select avg(salary) from programmer p,software s where p .name=s.name and sold*scost>50000;

-------------------------------------------------------------------------------------------------
101. How many packages were developed by students, who studied in institute that
charge the lowest course fee?
select count(s.name) from software s,studies st 
where s.name=st.name group by s.name,ccost having min(ccost)=(select min(ccost) 
from studies);

-------------------------------------------------------------------------------------------------
102. How many packages were developed by the person who developed the
cheapest package, where did HE/SHE study?
select count(*) from programmer p,software s where s .name=p.name group by dev_in 
having min(dcost)=(select min(dcost) from software);
-------------------------------------------------------------------------------------------------
103. How many packages were developed by the female programmers earning more
than the highest paid male programmer?
select count(dev_in) from programmer p,software s 
where s.name=p.name and sex='f' and salary>(select max(salary) 
from programmer p,software s where s.name=p.name and sex='m');
-------------------------------------------------------------------------------------------------
104. How many packages are developed by the most experienced programmer form
BDPS.
select count(x.name) from software x, programmer y, studies x
where months_between(sysdate, y.doj)/12) = (select max(months_between(sysdate,y.doj)/12) 
from programmer y, studies = where x.splace = 'BDPS' and y.name = z.name) 
and x.name=y.name andz.splace='BDPS';
-------------------------------------------------------------------------------------------------
105. List the programmers (form the software table) and the institutes they studied.
      select name,splace from studies where name not in(select name from software);

-------------------------------------------------------------------------------------------------
106. List each PROF with the number of Programmers having that PROF and the
number of the packages in that PROF.
select count(*),sum(scost*sold-dcost) "PROFIT" from software
where dev_in in (select prof1 from programmer) group by dev_in;

-------------------------------------------------------------------------------------------------
107. List the programmer names (from the programmer table) and No. Of Packages
each has developed.
select s.name,count(dev_in) from programmer p1,software s where p1.name=s.name group by s.name;
-------------------------------------------------------------------------------------------------