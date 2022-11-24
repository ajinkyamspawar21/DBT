1. Write an SQL query to fetch “FIRST_NAME” from Worker table 
using the alias name as <WORKER_NAME>.

		SELECT FIRST_NAME "WORKER_NAME" FROM WORKER;


2. Write an SQL query to fetch “FIRST_NAME” from Worker table in 
upper case.

		SELECT UPPER(FIRST_NAME) "FIRST_NAME" FROM WORKER;


3. Write an SQL query to fetch unique values of DEPARTMENT from 
Worker table.


		SELECT DISTINCT DEPARTMENT FROM WORKER;


4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
		
		SELECT SUBSTR(FIRST_NAME, 1,3) "FIRST_NAME"
		FROM WORKER;


5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
		
		SELECT INSTR(FIRST_NAME, 'a') "POSITION"
		FROM Worker 
		WHERE FIRST_NAME = 'Amitabh';


6. Write an SQL query to print the FIRST_NAME , departmentname from Worker table separated by white space.

		SELECT CONCAT(FIRST_NAME,CONCAT(' ', DEPARTMENT)) "DETAILS"
		FROM WORKER;


7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

		SELECT LTRIM(DEPARTMENT) "Dept."
		FROM WORKER;

8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.


		SELECT DISTINCT DEPARTMENT, LENGTH(DEPARTMENT) "Size"
		FROM WORKER;

9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.


		SELECT REPLACE(FIRST_NAME,'a','A') "a->A"
		FROM WORKER;


10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

		SELECT CONCAT(CONCAT(FIRST_NAME,' '), LAST_NAME) "COMPLETE_NAME"
		FROM WORKER;

11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending


		SELECT * FROM WORKER ORDER BY FIRST_NAME;


12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

		SELECT * FROM WORKER 
		ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;


13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

		SELECT * FROM WORKER
		WHERE FIRST_NAME = 'Vipul' or FIRST_NAME = 'Satish';


14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

		SELECT * FROM WORKER
		WHERE FIRST_NAME != 'Vipul' and FIRST_NAME != 'Satish';


15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”. 


		SELECT * FROM WORKER
		WHERE DEPARTMENT = 'Admin';


16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.


		SELECT * FROM WORKER
		WHERE REGEXP_LIKE(FIRST_NAME,'.*a.*');

		Select * from Worker where FIRST_NAME like '%a%';


17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.


		SELECT * FROM WORKER
		WHERE REGEXP_LIKE(FIRST_NAME,'.*a$');		

18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

		SELECT * FROM WORKER
		WHERE LENGTH(FIRST_NAME) = 6 
		AND 
		REGEXP_LIKE(FIRST_NAME,'.*h$');


19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

		SELECT * FROM WORKER
		WHERE SALARY BETWEEN 50000 AND 100000;


20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

		SELECT * FROM WORKER
		WHERE EXTRACT(YEAR FROM JOINING_DATE) = 2020 
		AND 
		EXTRACT(MONTH FROM JOINING_DATE) = 2;


21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.


		SELECT COUNT(*) "Employees in Admin"
		FROM WORKER
		WHERE DEPARTMENT = 'Admin';

22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

		SELECT FIRST_NAME
		FROM WORKER
		WHERE SALARY >= 50000 AND SALARY <=100000;

23. Write an SQL query to fetch the no. of workers for each department in the descending order.

		SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
		FROM WORKER 
		GROUP BY DEPARTMENT 
		ORDER BY No_Of_Workers DESC;

24. Write an SQL query to print details of the Workers who are also Managers.		

		SELECT * 
		FROM WORKER
		WHERE WORKER_ID = any(
						SELECT WORKER_REF_ID
						FROM TITLE
						WHERE WORKER_TITLE = 'Manager'
					);



25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.


		SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
		FROM Title
		GROUP BY WORKER_TITLE, AFFECTED_FROM
		HAVING COUNT(*) > 1;


26. Write an SQL query to show only odd rows from a table.

		SELECT * FROM WORKER
		WHERE MOD(WORKER_ID,2)!=0;D


	SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;
 27. Write an SQL query to show only even rows from a table.
 

 		SELECT * FROM WORKER
 		WHERE MOD(WORKER_ID, 2)=0;


28. Write an SQL query to clone a new table from another table.

		CREATE TABLE CLONE_WORKER
		AS 
		SELECT * FROM 
		WORKER;

29. Write an SQL query to fetch intersecting records of two tables.
 
 		TABLE1 INTERSETCT TABLE2

 		(SELECT * FROM WORKER)
		INTERSECT
		(SELECT * FROM CLONE_WORKER);


30. Write an SQL query to show records from one table that another table does not have.

		SELECT * FROM WORKER
		MINUS
		SELECT * FROM CLONE_WORKER;


31. Write an SQL query to show the current date and time

		SQL> SELECT CURRENT_TIMESTAMP FROM DUAL;

		CURRENT_TIMESTAMP
		----------------------------------------
		23-NOV-22 04.24.36.504000 PM +05:30


32. Write an SQL query to show the top n (say 10) records of a table

		SELECT * FROM WORKER WHERE ROWNUM <= 3;


33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

		SELECT SALARY
		FROM WORKER W1
		WHERE 4 = (
					SELECT COUNT(DISTINCT SALARY)
					FROM WORKER W2
					WHERE W2.SALARY > W1.SALARY);

		SELECT * FROM WORKER
		ORDER BY SALARY DESC;					

34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.		


		SELECT SALARY
		FROM WORKER W1
		WHERE 4 = (
					SELECT COUNT(DISTINCT SALARY)
					FROM WORKER W2
					WHERE W2.SALARY > W1.SALARY);

35. Write an SQL query to fetch the list of employees with the same salary					

		SELECT W1.*
		FROM WORKER W1, WORKER W2
		WHERE W1.SALARY = W2.SALARY 
		AND W1.WORKER_ID != W2.WORKER_ID;

36. Write an SQL query to show the second highest salary from a table.
		
		SELECT MAX(SALARY)
		FROM WORKER;

37. Write an SQL query to show one row twice in results from a table.

		SELECT W1.* 
		FROM WORKER W1
		UNION ALL
		SELECT W2.*
		FROM WORKER W2;

 38. Write an SQL query to fetch intersecting records of two tables.
 
 		CREATE TABLE WORKER_NAMES
		AS 
		SELECT FIRST_NAME, LAST_NAME FROM 
		WORKER;

		(SELECT * FROM WORKER_NAMES)
		INTERSECT
		(SELECT FIRST_NAME, LAST_NAME FROM WORKER);



39. Write an SQL query to fetch the first 50% records from a table.

		SELECT *
		FROM WORKER
		WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM WORKER);


		SELECT * 
		FROM WORKER
		WHERE ROWNUM BETWEEN 1 AND (SELECT COUNT(ROWNUM)/2 FROM WORKER);

40. Write an SQL query to fetch the departments that have less than five people in it.		

		SELECT DEPARTMENT
		FROM WORKER
		GROUP BY DEPARTMENT
		HAVING COUNT(WORKER_ID) < 4;


41. Write an SQL query to show all departments along with the number of people in there.

		SELECT DEPARTMENT "Dept" , COUNT(WORKER_ID) "Worker Count"
		FROM WORKER
		GROUP BY DEPARTMENT;


		select worker_id, rowid, rownum
		from worker;

42. Write an SQL query to show the last record from a table.
 
 		SELECT * FROM WORKER
 		WHERE WORKER_ID = (
 							SELECT MAX(WORKER_ID)
 							FROM WORKER);


43. Write an SQL query to fetch the first row of a table. 	

		SELECT * FROM WORKER
 		WHERE WORKER_ID = (
 							SELECT MIN(WORKER_ID)
 							FROM WORKER);

		
44. Write an SQL query to fetch the last five records from a table.		
		

		SELECT *
		FROM (select * from worker ORDER BY worker_id DESC) w2
		WHERE rownum <= 5;

45. Write an SQL query to print the name of employees having the highest salary in each department.		

		select max(salary) "Top Salaries" 
		from worker
		group by department;


46. Write an SQL query to fetch three max salaries from a table.
 
 		SELECT * FROM (SELECT * FROM WORKER
 						ORDER BY SALARY DESC)
 		WHERE ROWNUM <= 3
 		ORDER BY SALARY DESC;

47. Write an SQL query to fetch three min salaries from a table. 

		
		SELECT * FROM (SELECT * FROM WORKER
 						ORDER BY SALARY)
 		WHERE ROWNUM <= 3
 		ORDER BY SALARY;

48. Write an SQL query to fetch nth max salaries from a table
 
 		====== N ======

 		SELECT SALARY
		FROM WORKER W1
		WHERE N-1 = (
					SELECT COUNT(DISTINCT SALARY)
					FROM WORKER W2
					WHERE W2.SALARY > W1.SALARY);

49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

		
		SELECT DEPARTMENT, SUM(SALARY)
		FROM WORKER
		GROUP BY DEPARMENT;

50. Write an SQL query to fetch the names of workers who earn the highest salary 		

		
		SELECT FIRST_NAME, SALARY 
		FROM WORKER
		WHERE SALARY = (
						SELECT MAX(SALARY)
						FROM WORKER);