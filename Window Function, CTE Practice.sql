--Basic Window Functions (Ranking & Numbering)
--1. Write a query to assign a dense rank to employees based on their salary in descending order across the entire company.
SELECT employee_id, first_name, salary, DENSE_RANK() OVER(ORDER BY salary DESC) as rank 
FROM employees;


--2. Use a CTE to find the top 3 highest-paid employees in each DEPARTMENT_ID.
WITH top_3_high_pay_emp AS(
    SELECT employee_id, first_name, salary, department_id, DENSE_RANK() OVER(PARTITION BY department_id ORDER by salary DESC) as rank
    FROM employees
)
SELECT employee_id, first_name, salary, department_id, rank
FROM top_3_high_pay_emp
WHERE rank <= 3;


--3. Assign a unique sequential row number to each employee within their department, ordered by HIRE_DATE from oldest to newest.
SELECT employee_id, first_name, hire_date, department_id, ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY hire_date ASC) as row_num
FROM employees;


--4. Write a query using PERCENT_RANK() to find the percentile ranking of each employee's salary within the company.
SELECT employee_id, first_name, salary, PERCENT_RANK() OVER(ORDER BY salary) as rank
FROM employees
ORDER BY salary DESC;


--5. Identify the employee with the lowest salary in each department using the FIRST_VALUE() function.
SELECT first_name, department_id, salary, FIRST_VALUE(first_name) OVER (PARTITION BY department_id ORDER BY salary ASC) AS LowestPaidEmployee
FROM Employees;


--Aggregations as Window Functions
--6. Calculate the average salary per department and display it as a new column alongside each employee's individual SALARY.
SELECT employee_id, first_name, department_id, salary, ROUND(AVG(salary) OVER(PARTITION BY department_id),2) as average_salary
FROM employees;


--7. Compute the difference between each employee's SALARY and their department's average salary.
WITH average_sal AS (
    SELECT employee_id, first_name, department_id, salary, ROUND(AVG(salary) OVER(PARTITION BY department_id),2) as average_salary
    FROM employees
)
SELECT employee_id, first_name, department_id, salary, abs(salary - average_salary) as avg_sal_difference
FROM average_sal;


--8. Calculate the total sum of salaries for each department, but display it as a running total ordered by EMPLOYEE_ID.
SELECT employee_id ,first_name, salary, department_id,
        SUM(salary) OVER(
                        PARTITION BY department_id 
                        ORDER BY employee_id
                        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                        ) as running_total
FROM employees;


--9. Determine what percentage of their department's total salary each individual employee earns.
WITH dept_total_sal AS (
    SELECT employee_id, first_name, salary, department_id, SUM(salary) OVER(PARTITION BY department_id) as total_salary
    FROM employees
)
SELECT employee_id, first_name, department_id, salary, ROUND((salary / total_salary) * 100, 2) as percent_individual
FROM dept_total_sal;


--10. Find the maximum salary within each JOB_ID category and display it alongside the employee's details.
SELECT employee_id, first_name, job_id, salary, MAX(salary) OVER(PARTITION BY job_id) as max_salary
FROM employees
ORDER BY salary DESC;

--Lead and Lag (Sequential Analysis)
--11. Use the LAG() function to compare each employee's salary with the salary of the employee hired immediately before them in the company.


--12. Calculate the difference in days between an employee's HIRE_DATE and the next employee's HIRE_DATE within the same department using LEAD().

--13. Write a CTE to identify employees who earn at least $1,000 more than the person hired immediately after them in their specific department.

--14. Display the previous, current, and next salary for employees within the IT department (Department 60), ordered by salary descending.

--15. Use a CTE to find departments where the salary gap between the highest earner and the second-highest earner is greater than $2,000.


--Percentiles, Quartiles, and Distribution
--16. Use the NTILE(4) function to divide all employees into 4 salary quartiles based on their compensation.

--17. Write a CTE to isolate employees who fall into the top quartile (Quartile 1) of earners in the Sales department.

--18. Calculate the cumulative distribution (CUME_DIST()) of salaries within each department to see where each employee falls in the distribution.

--19. Group employees into 3 tiers (using NTILE(3)) based on their HIRE_DATE to categorize them as senior, mid-level, or junior tenure.

--20. Use a CTE to filter for employees whose salary places them in the top 10% of the entire company.


--Recursive CTEs (Hierarchical Data)
--21. Create a recursive CTE to display the complete management hierarchy starting from the President (Steven King, EMPLOYEE_ID 100).

--22. Use a recursive CTE to determine the organizational depth (level) of each employee, where the President is Level 1.

--23. Write a recursive CTE to find the total number of direct and indirect reports for the manager of the Marketing department.

--24. Use a recursive CTE to generate a sequence of all dates in the year 2012, then left join it with HIRE_DATE to find days when no one was hired.

--25. Create a CTE that builds a hierarchical path string (e.g., "King -> Kochhar -> Whalen") for every employee in the Administration department.


--Moving Averages and Rolling Totals
--26. Calculate a 3-employee rolling average salary (current employee and the two preceding) ordered by HIRE_DATE.

--27. Compute a cumulative sum of salaries ordered by HIRE_DATE restricted strictly to employees within the Executive department (Department 90).

--28. Find the moving maximum salary within each department considering the current employee and all preceding employees based on hire date.

--29. Calculate the running total count of employees hired over time across the entire company.

--30. Write a CTE to isolate employees hired between 2013 and 2015, then calculate a rolling sum of their salaries ordered by EMPLOYEE_ID.


--Filtering with Window Functions (Using CTEs)
--31. Use a CTE and the COUNT() window function to identify and list all employees who work in a department with fewer than 5 total employees.

--32. Write a query utilizing a CTE and ROW_NUMBER() to select only the first employee hired in each department.

--33. Use a CTE to calculate both the MIN() and MAX() salary per department as window functions, then filter out the employees earning exactly those amounts.

--34. Find departments where the average employee salary is actually higher than the salary of the manager of that department (MANAGER_ID from the departments table).

--35. Write a CTE to find employees who earn exactly the median salary of their respective department using PERCENTILE_CONT(0.5).


--Complex Joins with Window Functions
--36. Join the employees and departments tables, then use a window function to rank departments by their total aggregate salary expenditure.

--37. Use a CTE to join the tables and find the single employee who earns the most within each distinct LOCATION_ID.

--38. Calculate the exact salary difference between every employee and the specific manager of their department.

--39. Write a CTE that identifies the average salary of all departments located in LOCATION_ID 1700, then lists employees who earn more than that regional average.

--40. Use a CTE to find the department with the most recent hire, then use a window function to rank all employees within that specific department by their compensation.
