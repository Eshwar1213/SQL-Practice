--Part 1 – Basic Usage – HR Schema

--1. Display the lowest last name alphabetically (Employees table).
SELECT MIN(last_name) 
FROM employees;


--2. Display the highest last name alphabetically (Employees table).
SELECT MAX(last_name)
FROM employees;


--3. Display the number of rows in Employees table.
SELECT COUNT(*)
FROM employees;


--4. Display the number of values (exclude NULLs) in commission_pct column (Employees table).
SELECT COUNT(commission_pct)
FROM employees;


--5. Display the number of NULL values in commission_pct column (Employees table).
SELECT COUNT(*)
FROM employees
WHERE commission_pct IS NULL;

--6. Display the highest, lowest, and average salary.
SELECT MAX(salary) as highest_salary, MIN(salary) as lowest_salary, AVG(salary) as average_salary
FROM employees;



--Part 2 – GROUP BY and HAVING clauses

--1. Average salary per department
--      i. Display the department number and average salary for each department.
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

--      ii. Modify your query to display the results only for departments 50 or 80.
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING department_id IN (50,80);


--2. Number of employees per job id
--      i. Display the job id and the number of employees for each job id.
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

--      ii. Modify your query to display the results only for employees whose salary is greater the 10000.
SELECT job_id, COUNT(*)
FROM employees
WHERE salary > 10000
GROUP BY job_id;

--      iii. Modify your query again, this time display the results only for jobs with more than 2 people.
SELECT job_id, COUNT(*)
FROM employees
WHERE salary > 10000
GROUP BY job_id
HAVING COUNT(*) > 2;


--3. Display the department number, job id, and the average salary for each department and job id.
SELECT department_id, job_id, AVG(salary)
FROM employees
GROUP BY department_id, job_id;


--4. Managers and highest salary
--      i. Display the manager number and the highest salary for each manager number.
SELECT manager_id, MAX(salary)
FROM employees
GROUP BY manager_id;

--      ii. Modify your query to display the results only for employees whose salary is greater than 10000.
SELECT manager_id, MAX(salary)
FROM employees
GROUP BY manager_id
HAVING MAX(salary) > 10000;


--5. Display the job id and minimum salary for each job id, for all jobs whose minimum salary is greater than 7000.
SELECT job_id, MIN(salary)
FROM employees
GROUP BY job_id
HAVING MIN(Salary) > 7000;


--6. Display the department number, and the average salary for each department, 
--for all departments whose number is in the range of 20 and 80, and their average salary is greater than 9000
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING (department_id BETWEEN 20 AND 80) AND AVG(salary) > 9000;


