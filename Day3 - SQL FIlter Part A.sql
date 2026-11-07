CREATE TABLE departments (
    department_id NUMBER(4) PRIMARY KEY,
    department_name VARCHAR2(30),
    manager_id NUMBER(6),
    location_id NUMBER(4)
);

INSERT INTO departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO departments VALUES (30, 'Purchasing', 114, 1700);
INSERT INTO departments VALUES (40, 'Human Resources', 203, 2400);
INSERT INTO departments VALUES (50, 'Shipping', 121, 1500);
INSERT INTO departments VALUES (60, 'IT', 103, 1400);
INSERT INTO departments VALUES (70, 'Public Relations', 204, 2700);
INSERT INTO departments VALUES (80, 'Sales', 145, 2500);
INSERT INTO departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO departments VALUES (100, 'Finance', 108, 1700);
INSERT INTO departments VALUES (110, 'Accounting', 205, 1700);

CREATE TABLE employees (
    employee_id NUMBER(6) PRIMARY KEY,
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(25),
    phone_number VARCHAR2(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR2(10) NOT NULL,
    salary NUMBER(8,2),
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6),
    department_id NUMBER(4),
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', DATE '1987-06-17', 'AD_PRES', 24000, NULL, NULL, 90);
INSERT INTO employees VALUES (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', DATE '1989-09-21', 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', DATE '1993-01-13', 'AD_VP', 17000, NULL, 100, 90);
INSERT INTO employees VALUES (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', DATE '1990-01-03', 'IT_PROG', 9000, NULL, 102, 60);
INSERT INTO employees VALUES (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', DATE '1991-05-21', 'IT_PROG', 6000, NULL, 103, 60);
INSERT INTO employees VALUES (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', DATE '1997-06-25', 'IT_PROG', 4800, NULL, 103, 60);
INSERT INTO employees VALUES (106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', DATE '1998-02-05', 'IT_PROG', 4800, NULL, 103, 60);
INSERT INTO employees VALUES (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', DATE '1999-02-07', 'IT_PROG', 4200, NULL, 103, 60);
INSERT INTO employees VALUES (108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', DATE '1994-08-17', 'FI_MGR', 12000, NULL, 101, 100);
INSERT INTO employees VALUES (109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', DATE '1994-08-16', 'FI_ACCOUNT', 9000, NULL, 108, 100);
INSERT INTO employees VALUES (110, 'John', 'Chen', 'JCHEN', '515.124.4269', DATE '1997-09-28', 'FI_ACCOUNT', 8200, NULL, 108, 100);
INSERT INTO employees VALUES (111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', DATE '1997-09-30', 'FI_ACCOUNT', 7700, NULL, 108, 100);
INSERT INTO employees VALUES (112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', DATE '1998-03-07', 'FI_ACCOUNT', 7800, NULL, 108, 100);
INSERT INTO employees VALUES (113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', DATE '1999-12-07', 'FI_ACCOUNT', 6900, NULL, 108, 100);
INSERT INTO employees VALUES (114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', DATE '1994-12-07', 'PU_MAN', 11000, NULL, 100, 30);
INSERT INTO employees VALUES (115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', DATE '1995-05-18', 'PU_CLERK', 3100, NULL, 114, 30);
INSERT INTO employees VALUES (116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', DATE '1997-12-24', 'PU_CLERK', 2900, NULL, 114, 30);
INSERT INTO employees VALUES (117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', DATE '1997-07-24', 'PU_CLERK', 2800, NULL, 114, 30);
INSERT INTO employees VALUES (118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', DATE '1998-11-15', 'PU_CLERK', 2600, NULL, 114, 30);
INSERT INTO employees VALUES (119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', DATE '1999-08-10', 'PU_CLERK', 2500, NULL, 114, 30);
INSERT INTO employees VALUES (120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', DATE '1996-07-18', 'ST_MAN', 8000, NULL, 100, 50);
INSERT INTO employees VALUES (121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', DATE '1997-04-10', 'ST_MAN', 8200, NULL, 100, 50);
INSERT INTO employees VALUES (122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', DATE '1995-05-01', 'ST_MAN', 7900, NULL, 100, 50);
INSERT INTO employees VALUES (123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', DATE '1997-10-10', 'ST_MAN', 6500, NULL, 100, 50);
INSERT INTO employees VALUES (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', DATE '1999-11-16', 'ST_MAN', 5800, NULL, 100, 50);
INSERT INTO employees VALUES (145, 'John', 'Russell', 'JRUSSELL', '011.44.1344.429268', DATE '1996-10-01', 'SA_MAN', 14000, 0.40, 100, 80);
INSERT INTO employees VALUES (146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', DATE '1997-01-05', 'SA_MAN', 13500, 0.30, 145, 80);
INSERT INTO employees VALUES (147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', DATE '1997-03-10', 'SA_MAN', 12000, 0.30, 145, 80);
INSERT INTO employees VALUES (148, 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', DATE '1999-10-15', 'SA_MAN', 11000, 0.30, 145, 80);
INSERT INTO employees VALUES (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', DATE '2000-01-29', 'SA_MAN', 10500, 0.20, 145, 80);
INSERT INTO employees VALUES (150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', DATE '1997-01-30', 'SA_REP', 10000, 0.30, 145, 80);
INSERT INTO employees VALUES (151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.129269', DATE '1997-03-24', 'SA_REP', 9500, 0.25, 145, 80);
INSERT INTO employees VALUES (152, 'Peter', 'Hall', 'PHALL', '011.44.1344.129270', DATE '1997-08-20', 'SA_REP', 9000, 0.25, 145, 80);
INSERT INTO employees VALUES (153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.129271', DATE '1998-03-30', 'SA_REP', 8000, 0.20, 145, 80);
INSERT INTO employees VALUES (154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.129272', DATE '1998-12-09', 'SA_REP', 7500, 0.20, 145, 80);
INSERT INTO employees VALUES (155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.129273', DATE '1999-11-23', 'SA_REP', 7000, 0.15, 145, 80);
INSERT INTO employees VALUES (156, 'Janette', 'King', 'JKING', '011.44.1344.129274', DATE '1996-01-30', 'SA_REP', 10000, 0.35, 146, 80);
INSERT INTO employees VALUES (157, 'Patrick', 'Sully', 'PSULLY', '011.44.1344.129275', DATE '1996-03-04', 'SA_REP', 9500, 0.35, 146, 80);
INSERT INTO employees VALUES (158, 'Allan', 'McEwen', 'AMCEWEN', '011.44.1344.129276', DATE '1996-08-01', 'SA_REP', 9000, 0.35, 146, 80);
INSERT INTO employees VALUES (159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1344.129277', DATE '1997-03-10', 'SA_REP', 8000, 0.30, 146, 80);
INSERT INTO employees VALUES (160, 'Louise', 'Doran', 'LDORAN', '011.44.1344.129278', DATE '1997-12-15', 'SA_REP', 7500, 0.30, 146, 80);
INSERT INTO employees VALUES (161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1344.129279', DATE '1998-11-03', 'SA_REP', 7000, 0.25, 146, 80);
INSERT INTO employees VALUES (162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1344.129280', DATE '1997-11-11', 'SA_REP', 10500, 0.25, 146, 80);
INSERT INTO employees VALUES (163, 'Danielle', 'Greene', 'DGREENE', '011.44.1344.129281', DATE '1999-03-19', 'SA_REP', 9500, 0.25, 146, 80);
INSERT INTO employees VALUES (164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1344.129282', DATE '2000-01-24', 'SA_REP', 7200, 0.10, 146, 80);
INSERT INTO employees VALUES (165, 'David', 'Lee', 'DLEE', '011.44.1344.129283', DATE '1998-02-23', 'SA_REP', 6800, 0.10, 146, 80);
INSERT INTO employees VALUES (166, 'Sundar', 'Ande', 'SANDE', '011.44.1344.129284', DATE '2000-03-24', 'SA_REP', 6400, 0.10, 146, 80);
INSERT INTO employees VALUES (167, 'Amit', 'Banda', 'ABANDA', '011.44.1344.129285', DATE '2000-04-21', 'SA_REP', 6200, 0.10, 146, 80);
INSERT INTO employees VALUES (168, 'Lisa', 'Ozer', 'LOZER', '011.44.1344.129286', DATE '2000-03-11', 'SA_REP', 11500, 0.25, 147, 80);
INSERT INTO employees VALUES (169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1344.129287', DATE '1998-03-23', 'SA_REP', 10000, 0.20, 147, 80);
INSERT INTO employees VALUES (170, 'Tayler', 'Fox', 'TFOX', '011.44.1344.129288', DATE '1998-01-24', 'SA_REP', 9600, 0.20, 147, 80);
INSERT INTO employees VALUES (171, 'William', 'Smith', 'WSMITH', '011.44.1344.129289', DATE '1999-02-23', 'SA_REP', 7400, 0.15, 147, 80);
INSERT INTO employees VALUES (172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1344.129290', DATE '1997-03-24', 'SA_REP', 7300, 0.15, 147, 80);
INSERT INTO employees VALUES (173, 'Sundar', 'Ande', 'SANDE2', '011.44.1344.129291', DATE '1998-04-24', 'SA_REP', 6500, 0.10, 147, 80);
INSERT INTO employees VALUES (174, 'Ellen', 'Abel', 'EABEL', '011.44.1344.129292', DATE '1996-05-11', 'SA_REP', 11000, 0.30, 149, 80);
INSERT INTO employees VALUES (175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1344.129293', DATE '1997-03-19', 'SA_REP', 8800, 0.25, 149, 80);
INSERT INTO employees VALUES (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1344.129294', DATE '1998-03-24', 'SA_REP', 8600, 0.20, 149, 80);
INSERT INTO employees VALUES (177, 'Jack', 'Livingston', 'JLIVING', '011.44.1344.129295', DATE '1998-04-23', 'SA_REP', 8400, 0.20, 149, 80);
INSERT INTO employees VALUES (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1344.129296', DATE '1999-05-24', 'SA_REP', 7000, 0.15, 149, 80);
INSERT INTO employees VALUES (179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1344.129297', DATE '2000-01-04', 'SA_REP', 6200, 0.10, 149, 80);
INSERT INTO employees VALUES (180, 'Winston', 'Taylor', 'WTAYLOR', '011.44.1344.129298', DATE '1998-01-24', 'SH_CLERK', 3200, NULL, 120, 50);
INSERT INTO employees VALUES (181, 'Jean', 'Fleaur', 'JFLEAUR', '011.44.1344.129299', DATE '1998-02-23', 'SH_CLERK', 3100, NULL, 120, 50);
INSERT INTO employees VALUES (182, 'Martha', 'Sullivan', 'MSULLIV', '011.44.1344.129300', DATE '1999-06-21', 'SH_CLERK', 2500, NULL, 120, 50);
INSERT INTO employees VALUES (183, 'Girard', 'Geoni', 'GGEONI', '011.44.1344.129301', DATE '2000-02-03', 'SH_CLERK', 2800, NULL, 120, 50);
INSERT INTO employees VALUES (184, 'Nandita', 'Sarchand', 'NSARCHAN', '011.44.1344.129302', DATE '1996-01-27', 'SH_CLERK', 4200, NULL, 121, 50);
INSERT INTO employees VALUES (185, 'Alexis', 'Bull', 'ABULL', '011.44.1344.129303', DATE '1997-02-20', 'SH_CLERK', 4100, NULL, 121, 50);
INSERT INTO employees VALUES (186, 'Julia', 'Dellinger', 'JDELLING', '011.44.1344.129304', DATE '1998-06-24', 'SH_CLERK', 3400, NULL, 121, 50);
INSERT INTO employees VALUES (187, 'Anthony', 'Cabrio', 'ACABRIO', '011.44.1344.129305', DATE '1999-02-07', 'SH_CLERK', 3000, NULL, 121, 50);
INSERT INTO employees VALUES (188, 'Kelly', 'Chung', 'KCHUNG', '011.44.1344.129306', DATE '1997-06-14', 'SH_CLERK', 3800, NULL, 122, 50);
INSERT INTO employees VALUES (189, 'Jennifer', 'Dilly', 'JDILLY', '011.44.1344.129307', DATE '1998-08-17', 'SH_CLERK', 3600, NULL, 122, 50);
INSERT INTO employees VALUES (190, 'Timothy', 'Gates', 'TGATES', '011.44.1344.129308', DATE '1999-07-11', 'SH_CLERK', 2900, NULL, 122, 50);
INSERT INTO employees VALUES (191, 'Randall', 'Perkins', 'RPERKINS', '011.44.1344.129309', DATE '2000-12-19', 'SH_CLERK', 2500, NULL, 122, 50);
INSERT INTO employees VALUES (192, 'Sarah', 'Bell', 'SBELL', '011.44.1344.129310', DATE '1996-02-04', 'SH_CLERK', 4000, NULL, 123, 50);
INSERT INTO employees VALUES (193, 'Britney', 'Everett', 'BEVERETT', '011.44.1344.129311', DATE '1997-03-03', 'SH_CLERK', 3900, NULL, 123, 50);
INSERT INTO employees VALUES (194, 'Samuel', 'McCain', 'SMCCAIN', '011.44.1344.129312', DATE '1998-07-01', 'SH_CLERK', 3200, NULL, 123, 50);
INSERT INTO employees VALUES (195, 'Vance', 'Jones', 'VJONES', '011.44.1344.129313', DATE '1999-03-17', 'SH_CLERK', 2800, NULL, 123, 50);
INSERT INTO employees VALUES (196, 'Alana', 'Walsh', 'AWALSH', '011.44.1344.129314', DATE '1997-04-24', 'SH_CLERK', 3100, NULL, 124, 50);
INSERT INTO employees VALUES (197, 'Kevin', 'Feeney', 'KFEENEY', '011.44.1344.129315', DATE '1998-05-23', 'SH_CLERK', 3000, NULL, 124, 50);
INSERT INTO employees VALUES (198, 'Donald', 'OConnell', 'DOCONNEL', '011.44.1344.129316', DATE '1999-06-21', 'SH_CLERK', 2600, NULL, 124, 50);
INSERT INTO employees VALUES (199, 'Douglas', 'Grant', 'DGRANT', '011.44.1344.129317', DATE '2000-01-13', 'SH_CLERK', 2600, NULL, 124, 50);



--1. Display the first name and department ID of all employees whose last name is 'De Haan'.
--Table(s): EMPLOYEES
SELECT first_name, department_id FROM employees
WHERE last_name = 'De Haan';


--2. Display all columns from the DEPARTMENTS table for the department named 'Sales'.
--Table(s): DEPARTMENTS
SELECT * FROM departments 
WHERE department_name = 'Sales';


--3. Display first name, last name, department ID, and salary for employees earning more than 9,700.
--Table(s): EMPLOYEES
SELECT first_name, last_name, department_id, salary FROM employees
WHERE salary > 9700;


--4. Display all employee details for employees hired before January 1, 1992.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE hire_date < TO_DATE('01-JAN-1992', 'DD-MON-YYYY');


--5. Display employee ID, first name, job ID, and department ID for employees in departments 20, 60, or 80.
--Table(s): EMPLOYEES
SELECT employee_id, first_name, job_id, department_id FROM employees
WHERE department_id IN (20, 60, 80);


--6. Display employee ID, first name, job ID, and department ID for employees who are not in departments 20, 60, or 80.
--Table(s): EMPLOYEES
SELECT employee_id, first_name, job_id, department_id FROM employees
WHERE department_id NOT IN (20, 60, 80);


--7. Display last name, phone number, salary, and manager ID for employees whose manager ID is 100, 102, or 103.
--Table(s): EMPLOYEES
SELECT last_name, phone_number, salary, manager_id FROM employees
WHERE manager_id IN (100, 102, 103);


--8. Display first name and salary for employees whose first name ends with the letter 'e'.
--Table(s): EMPLOYEES
SELECT first_name, salary FROM employees
WHERE first_name LIKE '%e';


--9. Display last name and department ID for employees whose last name has 'i' as the second character.
--Table(s): EMPLOYEES
SELECT last_name, department_id FROM employees
WHERE last_name LIKE '_i%';


--10. Display all employee details for employees whose last name contains L, J, or H. Sort by salary from highest to lowest.
--Table(s) : EMPLOYEES
SELECT * FROM employees
WHERE UPPER(last_name) LIKE '%L%' 
   OR UPPER(last_name) LIKE '%J%' 
   OR UPPER(last_name) LIKE '%H%'
ORDER BY salary DESC;


--11. Display first name, hire date, salary, and department ID for employees whose first name does not contain the letter 'A'. Sort by department ID ascending.
--Table(s): EMPLOYEES
SELECT first_name, hire_date, salary, department_id FROM employees
WHERE UPPER(first_name) NOT LIKE '%A%' 
ORDER BY department_id ASC;


--12. Display all employee details for employees who are not assigned to any department.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE department_id IS NULL;


--13. Display full name and salary for employees whose salary is outside the range 7,000 to 15,000. 
--Show full name as first name + space + last name and sort by full name ascending.
--Table(s): EMPLOYEES
SELECT first_name || ' ' || last_name AS full_name, salary FROM employees
WHERE salary NOT BETWEEN 7000 AND 15000
ORDER BY full_name ASC;


--14. Display FULL_NAME, CONTACTS, and SAL for employees earning between 5,000 and 10,000. FULL_NAME = first name + space + last name. CONTACTS = phone number + ' - ' + email.
--Table(s): EMPLOYEES
SELECT first_name || ' ' || last_name AS full_name, phone_number || ' - ' || email AS contacts, salary AS sal FROM employees
WHERE salary BETWEEN 5000 AND 10000;


--15. Display all employee details where either: 
--(a) salary is between 6,000 and 8,000 and commission is not null, OR 
--(b) department ID is not in 80, 90, 110 and hire date is before January 1, 1990. Use parentheses to make the logic explicit.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE (salary BETWEEN 6000 AND 8000 AND commission_pct IS NOT NULL)
      OR (department_id NOT IN (80, 90, 110) AND hire_date < TO_DATE('01-JAN-1990', 'DD-MON-YYYY'));
      
      
--16. Display last name, job ID, and hire date for employees hired between December 12, 1995 and April 17, 1998. Sort by hire date ascending.
--Table(s): EMPLOYEES
SELECT last_name, job_id, hire_date FROM employees
WHERE hire_date BETWEEN TO_DATE('12-DEC-1995', 'DD-MON-YYYY') AND TO_DATE('17-APR-1998', 'DD-MON-YYYY')
ORDER BY hire_date ASC;


--17. Display full name, hire date, commission percentage, phone number, and salary for employees whose salary is greater than 10,000 OR whose third phone-number character is 5. 
--Sort by first name descending.
--Table(s): EMPLOYEES
SELECT first_name || ' ' || last_name AS full_name, hire_date, commission_pct, phone_number, salary FROM employees
WHERE salary > 10000 OR phone_number LIKE '__5%'
ORDER BY first_name DESC;


--18. Display last name and salary for employees earning more than 12,000.
--Table(s): EMPLOYEES
SELECT last_name, salary FROM employees
WHERE salary > 12000;


--19. Display last name and department ID for employees in department 50 or 80. Solve it twice: first with OR, then with IN.
--Table(s): EMPLOYEES
SELECT last_name, department_id FROM employees
WHERE department_id = 50 OR department_id = 80;

SELECT last_name, department_id FROM employees
WHERE department_id IN (50,80);


--20. Display first name and salary for employees who do not earn commission.
--Table(s): EMPLOYEES
SELECT first_name, salary FROM employees
WHERE commission_pct IS NULL;


--21. Display first name, salary, and manager ID for employees whose manager ID is not null.
--Table(s): EMPLOYEES
SELECT first_name, salary, manager_id FROM employees
WHERE manager_id IS NOT NULL;


--22. Display employee ID, first name, salary, and department ID for employees earning at least 8,000 but less than 15,000.
--Table(s): EMPLOYEES
SELECT employee_id, first_name, salary, department_id FROM employees
WHERE salary >= 8000 AND salary < 15000;


--23. Display employees whose last name starts with 'S' and whose salary is greater than 6,000.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE UPPER(last_name) LIKE 'S%' AND salary > 6000;


--24. Display employees whose job ID is not 'IT_PROG' and not 'SA_REP'. Solve once with NOT IN.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE job_id NOT IN ('IT_PROG', 'SA_REP');


--25. Display employees hired in the year 1997 using an appropriate date range.
--Table(s): EMPLOYEES
SELECT * FROM employees 
WHERE hire_date >= TO_DATE('01-JAN-1997', 'DD-MON-YYYY') AND hire_date < TO_DATE('01-JAN-1998', 'DD-MON-YYYY');
   
    
--26. Display employees who have commission but do not belong to department 80.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE commission_pct IS NOT NULL AND department_id <> 80;


--27. Display employees whose first name begins with A, D, or S. Sort by first name ascending.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE UPPER(first_name) LIKE 'A%'
   OR UPPER(first_name) LIKE 'D%'
   OR UPPER(first_name) LIKE 'S%'
ORDER BY first_name ASC;


--28. Display employees with salary less than 5,000 or greater than 15,000.
--Table(s): EMPLOYEES
SELECT * FROM employees
WHERE salary < 5000 OR salary > 15000;


--29. Display employee ID, last name, department ID, and manager ID for employees who have both a department and a manager assigned.
--Table(s): EMPLOYEES
SELECT employee_id, last_name, department_id, manager_id FROM employees
WHERE department_id IS NOT NULL AND manager_id IS NOT NULL;


