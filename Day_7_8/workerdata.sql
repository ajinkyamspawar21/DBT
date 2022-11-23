CREATE DATABASE if not exists test;

USE test;

CREATE TABLE Worker (
	WORKER_ID NUMBER(4) NOT NULL PRIMARY KEY ,
	FIRST_NAME VARCHAR2(25),
	LAST_NAME VARCHAR2(25),
	SALARY NUMBER(15),
	JOINING_DATE DATE,
	DEPARTMENT VARCHAR2(25)
);

INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(001, 'Monika', 'Arora', 100000, '14-FEB-20', 'HR');
INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(002, 'Niharika', 'Verma', 80000, '14-JUN-11', 'Admin');
INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(003, 'Vishal', 'Singhal', 300000, '14-FEB-20', 'HR');
INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(004, 'Amitabh', 'Singh', 500000, '14-FEB-20', 'Admin');
INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(005, 'Vivek', 'Bhati', 500000, '14-JUN-11', 'Admin');
INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(006, 'Vipul', 'Diwan', 200000, '14-JUN-11', 'Account');
INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(007, 'Satish', 'Kumar', 75000, '14-JAN-20', 'Account');
INSERT INTO Worker  (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES(008, 'Geetika', 'Chauhan', 90000, '14-APR-11', 'Admin');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Bonus1 (
	WORKER_REF_ID number(4),
	BONUS_AMOUNT NUMBER(10),
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus1 (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-FEB-2022');
INSERT INTO Bonus1 (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(002, 3000, '11-JUN-2016');
INSERT INTO Bonus1 (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(003, 4000, '16-FEB-2016');
INSERT INTO Bonus1 (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(004, 4500, '16-FEB-2016');
INSERT INTO Bonus1 (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(005, 3500, '16-JUN-2016');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Title (
	WORKER_REF_ID NUMBER,
	WORKER_TITLE VARCHAR2(25),
	AFFECTED_FROM DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '20-FEB-2016');
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (002, 'Executive', '11-JUN-2016');
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (008, 'Executive', '11-JUN-2016');
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (005, 'Manager', '11-JUN-2016');
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (004, 'Asst. Manager', '11-JUN-2016');
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (007, 'Executive', '11-JUN-2016');
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (006, 'Lead', '11-JUN-2016');
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (003, 'Lead', '11-JUN-2016');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

1. Write an SQL query to fetch “FIRST_NAME” from Worker table 
using the alias name as <WORKER_NAME>.

SELECT w.FIRST_NAME
FROM WORKER W;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
 2. Write an SQL query to fetch “FIRST_NAME” from Worker table in 
upper case.
SELECT upper(w.FIRST_NAME)
FROM WORKER W;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
 3. Write an SQL query to fetch unique values of DEPARTMENT from 
Worker table.
select distinct department
from worker;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

 4. Write an SQL query to print the first three characters 
of FIRST_NAME from Worker table.

select substr(FIRST_NAME,1,3)
from worker;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 5. Write an SQL query to find the position of the alphabet (‘a’) in the 
first name column ‘Amitabh’ from Worker table.

select instr('Amitabh','a')from dual;


or 


select distinct instr('Amitabh','a')from worker;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 6. Write an SQL query to print the FIRST_NAME , departmentname 
from Worker table separated by white space.

select concat(concat(FIRST_NAME,' '),department)
from worker;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 7. Write an SQL query to print the DEPARTMENT from Worker table 
after removing white spaces from the left side.

select  ltrim(department)
from worker;

select  LENGTH(department),LENGTH(rtrim(department))
from worker;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

8. Write an SQL query that fetches the unique values of DEPARTMENT 
from Worker table and prints its length.

SELECT DISTINCT DEPARTMENT,LENGTH(DEPARTMENT)
FROM WORKER;

 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 9. Write an SQL query to print the FIRST_NAME from Worker table 
after replacing ‘a’ with ‘A’.
 select  first_name , replace(first_name,'a','A')
 from worker ;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 10. Write an SQL query to print the FIRST_NAME and LAST_NAME 
from Worker table into a single column COMPLETE_NAME. A space 
char should separate them.
  select concat(first_name,last_name) "COMPLETE_NAME. "
  from Worker;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 11. Write an SQL query to print all Worker details from the Worker 
table order by FIRST_NAME Ascending.

select *
from worker
order by first_name;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 12. Write an SQL query to print all Worker details from the Worker 
table order by FIRST_NAME Ascending and DEPARTMENT 
Descending.


select *
from worker
order by first_name asc, Department desc;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 13. Write an SQL query to print details for Workers with the first 
name as “Vipul” and “Satish” from Worker table.

select * from worker
where First_name='Vipul' or first_name='Satish';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 14. Write an SQL query to print details of workers excluding first 
names, “Vipul” and “Satish” from Worker table.
select * from worker
where FIRST_NAME not in (select FIRST_NAME
		              from worker
		              where First_name='Vipul' or first_name='Satish');
	      

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------



 15. Write an SQL query to print details of Workers with 
DEPARTMENT name as “Admin”.

select * 
from worker 
where department='Admin';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 16. Write an SQL query to print details of the Workers whose 
FIRST_NAME contains ‘a’.

select * 
from worker
where FIRST_NAME like'%a%';
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 17. Write an SQL query to print details of the Workers whose 
FIRST_NAME ends with ‘a’.

select * 
from worker
where FIRST_NAME like'%a';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 18. Write an SQL query to print details of the Workers whose 
FIRST_NAME ends with ‘h’ and contains six alphabets.

select *  
from worker
where length(first_name)=6 and regexp_like(first_name,'.*h$');


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 19. Write an SQL query to print details of the Workers whose 
SALARY lies between 100000 and 500000.

select * 
from worker
where salary between 100000 and 500000; 




----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 20. Write an SQL query to print details of the Workers who have 
joined in Feb’2014.

select * 
from worker 
where joining_Date between '1-Feb-20' and '28-Feb-20';


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 21. Write an SQL query to fetch the count of employees working in 
the department ‘Admin’.

select count(First_name)
from worker
where department='Admin'; 


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 22. Write an SQL query to fetch worker names with salaries >= 50000 
and <= 100000.

select * 
from worker 
where salary between 50000 and 100000;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 23. Write an SQL query to fetch the no. of workers for each 
department in the descending order.

select department,count(*)
from worker 
group by department 
order by count(*) desc;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 24. Write an SQL query to print details of the Workers who are also 
Managers.

select * 
from worker
where worker_id in(select worker_ref_id
		    from title
		    where worker_title='Manager');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 25. Write an SQL query to fetch duplicate records having matching 
data in some fields of a table. (Display what is repeating in a department)


select 
from worker
where 

????????

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 26. Write an SQL query to show only odd rows from a table.

select * 
from worker 
where  mod(rowid,2)=1; ?????
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 27. Write an SQL query to show only even rows from a table.
????
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 28. Write an SQL query to clone a new table from another table.
create table new_table
as 
select * 
from bonus;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 29. Write an SQL query to fetch intersecting records of two tables.
select w.worker_id
from worker w
intersect 
select t.worker_ref_id
from title t;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 30. Write an SQL query to show records from one table that another 
table does not have.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 31. Write an SQL query to show the current date and time.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 32. Write an SQL query to show the top n (say 10) records of a table.


select * 
from worker 
where rownum<=5;

or by 
where mod(worker_id,2)=1;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
 33. Write an SQL query to determine the nth (say n=5) highest salary 
from a table.
 34. Write an SQL query to determine the 5th highest salary without 
using TOP or limit method.
 35. Write an SQL query to fetch the list of employees with the same 
salary.
 36. Write an SQL query to show the second highest salary from a 
table.
 37. Write an SQL query to show one row twice in results from a table.
 38. Write an SQL query to fetch intersecting records of two tables.
 39. Write an SQL query to fetch the first 50% records from a table.
 40. Write an SQL query to fetch the departments that have less than 
five people in it.
 
 41. Write an SQL query to show all departments along with the 
number of people in there.
 42. Write an SQL query to show the last record from a table.
 43. Write an SQL query to fetch the first row of a table.
 44. Write an SQL query to fetch the last five records from a table.
 45. Write an SQL query to print the name of employees having the 
highest salary in each department.
 46. Write an SQL query to fetch three max salaries from a table.
 47. Write an SQL query to fetch three min salaries from a table.
 48. Write an SQL query to fetch nth max salaries from a table.
 49. Write an SQL query to fetch departments along with the total 
salaries paid for each of them.
 50. Write an SQL query to fetch the names of workers who earn the 
highest salary.