--01. A company is conducting a salary review to identify employees who earn more than ₹5,000 per month.
SELECT employee_id, first_name, job_id, salary 
FROM employees
WHERE salary > 5000;

--02. The HR department wants to prepare a report of employees working in department 50 to review staffing levels.
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id = 50;

--03. The HR manager is preparing a report to identify employees whose salaries fall between ₹3,000 and ₹7,000. 
--The report will help identify employees within this salary range for an internal compensation review.
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 3000 AND 7000;

--04. During a data-quality audit, the HR team discovers that some employee records do not have a department assigned. 
--They want to identify these records before updating the employee database.
SELECT employee_id, first_name, last_name, department_id
FROM employees
WHERE department_id IS NULL;

--05. The HR team is searching for employees whose first names begin with the letter S. They want to prepare a list of these employees for an internal communication.
SELECT employee_id, first_name, last_name
FROM employees
WHERE UPPER(first_name) LIKE 'S%';

--06. The HR manager wants to recognize the five highest-paid employees in the company for a special compensation review.
SELECT employee_id, first_name, last_name, salary
FROM employees
ORDER BY salary DESC
FETCH FIRST 5 ROWS ONLY;

--07. The finance department wants to compare salary expenses across departments. 
--The manager needs a report showing the total salary expenditure for each department that has employees.
SELECT department_id, SUM(salary) as total_salary
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
ORDER BY department_id ASC;

--08. The HR manager wants to identify departments that have more than five employees. This report will help determine which departments may need additional team leaders.
SELECT department_id, COUNT(*) as employee_count
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING COUNT(*) > 5;


--09. The HR team wants to identify departments where the average employee salary is greater than ₹8,000. 
--The report will help management understand which departments have higher salary costs on average.
SELECT department_id, AVG(salary) as average_salary
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING AVG(salary) > 8000
ORDER BY department_id;


--10. The HR team is preparing an employee directory. They need to see each employee's name alongside the name of the department where they work. 
--Employees who have not been assigned to a department should also appear in the report.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;
    
--11. The HR manager wants to identify departments that currently have no employees assigned to them. 
--This report will help management decide whether those departments should remain active.
SELECT d.department_id, d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

--12. The HR manager wants to identify employees whose salaries are higher than the average salary of the department they belong to. 
--This report will help compare individual compensation against departmental salary levels.
SELECT e.employee_id, e.first_name, e.salary, e.department_id
FROM employees e
JOIN (SELECT department_id, AVG(salary) as average_salary
      FROM employees 
      WHERE department_id IS NOT NULL 
      GROUP BY department_id) d
    ON e.department_id = d.department_id
    AND e.salary > d.average_salary
ORDER BY e.department_id ASC, e.salary DESC;

------------------------------------------------------------------------------------------------------------------------------------------
--#BEST
WITH avg_sal_department AS (
    SELECT employee_id, first_name, salary, AVG(salary) OVER (PARTITION BY department_id) as dept_avg_salary, department_id
    FROM employees
)
SELECT employee_id, first_name, salary, department_id
FROM avg_sal_department
WHERE salary > dept_avg_salary
ORDER BY department_id ASC, salary DESC;


--13. During a compensation audit, the HR department wants to identify employees whose salaries are higher than the salaries of the managers they report to. 
--The report should display the employee's ID and name, their salary, the manager's name, and the manager's salary.
SELECT e.employee_id, e.first_name || ' ' || e.last_name as employee_name, e.salary as employee_salary, m.first_name || ' ' || m.last_name as manager_name, m.salary as manager_salary
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

--14. The HR department is auditing reporting relationships to identify employees who joined the company before their respective managers. 
--The report should display the employee's ID, employee name, employee hire date, manager name, and manager hire date.
SELECT e.employee_id, e.first_name || ' ' || e.last_name as employee_name, e.hire_date as employee_hiredate, m.first_name || ' ' || m.last_name as manager_name, m.hire_date as manager_hiredate
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;

--15. The HR manager wants to recognize the highest-paid employee in every department. 
--If multiple employees in a department share the highest salary, all employees earning that salary should be included in the report.
WITH maximum_salary_dept AS (
    SELECT employee_id, first_name, last_name, department_id, salary, MAX(salary) OVER(PARTITION BY department_id) as maximum_salary
    FROM employees
    WHERE department_id IS NOT NULL
)
SELECT employee_id, first_name, last_name, department_id, salary 
FROM maximum_salary_dept
WHERE salary = maximum_salary
ORDER BY department_id ASC;
---------------------------------------------------------------------------------------------------------
--#BEST
WITH ranking_emp AS (
    SELECT employee_id, first_name, last_name, department_id, salary, DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) as rank
    FROM employees
    WHERE department_id IS NOT NULL
)
SELECT employee_id, first_name, last_name, department_id, salary 
FROM ranking_emp
WHERE rank = 1
ORDER BY department_id ASC;


--16. The HR department is preparing a compensation report to identify employees who earn the second-highest distinct salary across the entire company. 
--If multiple employees share that salary, every one of them should appear in the report.
WITH ranking_emp AS (
    SELECT employee_id, first_name, last_name, salary, DENSE_RANK() OVER(ORDER BY salary DESC) as rank
    FROM employees
)
SELECT employee_id, first_name, last_name, salary 
FROM ranking_emp
WHERE rank = 2;


--17. The HR department is organizing employee records by recruitment year. 
--They want to identify all employees hired during 2005 and prepare a report containing each employee's ID, first name, last name, and hire date.
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('01-01-2005', 'DD-MM-YYYY') AND TO_DATE('31-12-2005', 'DD-MM-YYYY')
ORDER BY hire_date;
------------------------------------------------------------------------
--#Safer for date columns containing time
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN DATE '2005-01-01' AND DATE '2005-12-31'
ORDER BY hire_date;


--18. During an organizational structure audit, the HR department wants to identify employees who do not report to any manager. 
--The report should display their employee ID, first name, last name, and manager ID.
SELECT employee_id, first_name, last_name, manager_id
FROM employees
WHERE manager_id IS NULL;


--19. The HR manager wants to identify employees whose individual salaries are higher than the company's overall average salary. 
--The report should display the employee ID, first name, last name, and salary, ordered from highest to lowest salary.
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;


--20. The HR department is preparing a compensation report. They want to identify employees whose salaries exceed the average salary of their respective departments. 
--Employees without an assigned department should not appear in the report.

--#best
WITH avg_sal_dept AS (
    SELECT employee_id, first_name, last_name, department_id, salary, AVG(salary) OVER(PARTITION BY department_id) as avg_salary
    FROM employees
    WHERE department_id IS NOT NULL
)
SELECT employee_id, first_name, last_name, department_id, salary
FROM avg_sal_dept
WHERE salary > avg_salary;

-------------------------------------------------------------------------------------------------------------------------
SELECT e.employee_id, e.first_name, e.last_name, e.department_id, e.salary
FROM employees e
JOIN (SELECT department_id, AVG(salary) as avg_salary
      FROM employees
      GROUP BY department_id) d
   ON e.department_id = d.department_id
   AND e.salary > d.avg_salary
ORDER BY department_id, salary DESC;



--21. The HR manager wants to compare each employee's salary with the total salary paid to employees in their department. 
--The report should show each employee's contribution as a percentage of their department's total salary.
WITH dept_salary AS (
    SELECT employee_id, first_name, department_id, salary, SUM(salary) OVER(PARTITION BY department_id) as department_total
    FROM employees
    WHERE department_id IS NOT NULL
)
SELECT employee_id, first_name, department_id, salary, department_total, ROUND((salary / department_total) * 100, 2) as salary_contribution_percent 
FROM dept_salary
ORDER BY department_id ASC, salary DESC;


--22. The HR manager wants to compare every employee's salary with the highest salary paid in their department. 
--The report should show how much less each employee earns compared with the department's highest-paid employee.
WITH dept_high_salary AS (
    SELECT employee_id, first_name, department_id, salary, MAX(salary) OVER(PARTITION BY department_id) as highest_dept_sal
    FROM employees
    WHERE department_id IS NOT NULL
)
SELECT employee_id, first_name, department_id, salary, highest_dept_sal, (highest_dept_sal - salary) as salary_difference
FROM dept_high_salary
ORDER BY department_id ASC, salary DESC;


--23. The HR manager wants to examine salary changes between consecutive employees when employees are arranged by hire date. 
--The report should show each employee's salary and the salary of the employee hired immediately before them.
WITH prev_emp_sal AS (
    SELECT employee_id, first_name, hire_date, salary, LAG(salary) OVER(ORDER BY hire_date) as previous_salary
    FROM employees
)
SELECT employee_id, first_name, hire_date, salary, previous_salary, (salary - previous_salary) as salary_difference
FROM prev_emp_sal
ORDER BY hire_date, employee_id;


--24. The HR manager wants to see the salary of the employee hired immediately after each employee. 
--Employees should be arranged by hire date, and the report should show the difference between the current employee's salary and the next employee's salary.
WITH next_emp_sal AS (
    SELECT employee_id, first_name, hire_date, salary, LEAD(salary) OVER(ORDER BY hire_date) as next_salary
    FROM employees
)
SELECT employee_id, first_name, hire_date, salary, next_salary, (salary - next_salary) as salary_difference
FROM next_emp_sal
ORDER BY hire_date, employee_id;


----------------------------------------------------------------------------------------------------------

