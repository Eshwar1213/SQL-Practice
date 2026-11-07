-- 1. Salesman Table
CREATE TABLE Salesman (
    salesman_id NUMBER(4) PRIMARY KEY,
    name         VARCHAR2(30),
    city         VARCHAR2(30),
    commission   NUMBER(4,2)
);

INSERT INTO Salesman VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO Salesman VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO Salesman VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO Salesman VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO Salesman VALUES (5003, 'Lauson Hen', 'San Jose', 0.12);
INSERT INTO Salesman VALUES (5007, 'Paul Adam', 'Rome', 0.13);
INSERT INTO Salesman VALUES (5004, 'Alice Doe', 'America', 0.15);
-- Add a salesperson who has no assigned customers:
INSERT INTO salesman (salesman_id, name, city, commission)
VALUES (5008, 'Riya Sen', 'Chennai', 0.10);

SELECT * FROM Salesman;


-- 2. Customer Table
CREATE TABLE Customer (
    customer_id NUMBER(4) PRIMARY KEY,
    cust_name   VARCHAR2(30),
    city        VARCHAR2(30),
    grade       NUMBER(3),
    salesman_id NUMBER(4),
    CONSTRAINT fk_customer_salesman FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

INSERT INTO Customer VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO Customer VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO Customer VALUES (3001, 'Brad Guzan', 'London', 100, 5005);
INSERT INTO Customer VALUES (3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO Customer VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO Customer VALUES (3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO Customer VALUES (3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO Customer VALUES (3003, 'Jozy Altidor', 'Moncow', 200, 5007);
-- Add one unassigned customer and one customer with no orders:
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3010, 'Mira Shah', 'Mumbai', 200, NULL);
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES (3011, 'Omar Khan', 'Pune', 100, 5001);

SELECT * FROM Customer;

-- 3. Orders Table
CREATE TABLE Orders (
    ord_no       NUMBER(5) PRIMARY KEY,
    purch_amt    NUMBER(10,2),
    ord_date     DATE,
    customer_id  NUMBER(4),
    salesman_id  NUMBER(4),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    CONSTRAINT fk_orders_salesman FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
);

INSERT INTO Orders VALUES (70001, 150.50, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO Orders VALUES (70009, 270.65, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3001, 5005);
INSERT INTO Orders VALUES (70002,  65.26, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO Orders VALUES (70004, 110.50, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO Orders VALUES (70007, 948.50, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO Orders VALUES (70005, 2400.60, TO_DATE('2012-07-27', 'YYYY-MM-DD'), 3007, 5001);
INSERT INTO Orders VALUES (70008, 5760.00, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO Orders VALUES (70010, 1983.43, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3004, 5006);
INSERT INTO Orders VALUES (70003, 2480.40, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO Orders VALUES (70012, 250.45, TO_DATE('2012-06-27', 'YYYY-MM-DD'), 3008, 5002);
INSERT INTO Orders VALUES (70011,  75.29, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3003, 5007);
INSERT INTO Orders VALUES (70013, 3045.60, TO_DATE('2012-04-25', 'YYYY-MM-DD'), 3002, 5001);

SELECT * FROM Orders;



--01. Display the salesman name, salesman city, customer name, and customer city for salesman–customer pairs located in the same city.
SELECT s.name as salesman_name, s.city as salesman_city, c.cust_name, c.city as customer_city 
FROM salesman s
INNER JOIN customer c
ON s.salesman_id = c.salesman_id
WHERE c.city = s.city;


--02. List the order number, purchase amount, customer name, and customer city for orders with amounts between 500 and 2,000 (inclusive).
SELECT o.ord_no, o.purch_amt, c.cust_name, c.city as customer_city
FROM orders o
INNER JOIN customer c
ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 and 2000;


--03. Display each customer name and the name of the salesperson assigned to that customer.
SELECT c.cust_name, s.name as salesman_name FROM customer c
INNER JOIN salesman s
ON c.salesman_id = s.salesman_id;


--04. List customers assigned to a salesperson whose commission rate is strictly greater than 12%. Include customer name, salesperson name, and commission rate.
SELECT c.cust_name, s.name as salesman_name, s.commission
FROM customer c
INNER JOIN salesman s
ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;


--05. List customers whose assigned salesperson lives in a different city and earns a commission rate strictly greater than 12%. Show both cities.
SELECT c.cust_name, c.city as customer_city, s.name as salesman_name, s.city as salesman_city, s.commission 
FROM customer c 
INNER JOIN salesman s
ON c.salesman_id = s.salesman_id
WHERE (c.city <> s.city) and (s.commission > 0.12);


--06. For every order, show order number, date, purchase amount, customer name, salesperson name, commission rate, and commission amount earned on that order.
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, s.name as salesman_name, s.commission, (o.purch_amt * s.commission) as commission_amount
FROM orders o
INNER JOIN customer c
ON o.customer_id = c.customer_id
INNER JOIN salesman s
ON o.salesman_id = s.salesman_id;


--07. Combine salesman, customer, and orders to return only matching rows. Display salesman_id and customer_id once each, along with salesperson, customer, order number, and order amount.
SELECT s.salesman_id, c.customer_id, s.name as salesman_name, c.cust_name, o.ord_no, o.purch_amt FROM orders o
INNER JOIN customer c
ON o.customer_id = c.customer_id
INNER JOIN salesman s
ON o.salesman_id = s.salesman_id;


--08. List all customers in alphabetical order, including customers who have no assigned salesperson. Show customer name and salesperson name (NULL if unassigned).
SELECT c.cust_name, s.name as salesman_name FROM customer c
LEFT JOIN salesman s
ON c.salesman_id = s.salesman_id
ORDER BY c.cust_name ASC;


--09. List all customers with grade less than 300, including any without an assigned salesperson. Sort by customer name.
SELECT c.cust_name, c.grade, s.name as salesman_name FROM customer c
LEFT JOIN salesman s
ON c.salesman_id = s.salesman_id
WHERE grade < 300
ORDER BY c.cust_name ASC;


--10. Report customer name, city, order number, order date, and purchase amount for every customer, including those who have not placed an order. 
--Sort by order date, then customer name; keep NULL dates.
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt FROM customer c
LEFT JOIN orders o    
ON c.customer_id = o.customer_id
ORDER BY o.ord_date ASC NULLS LAST, c.cust_name ASC;


--11. For every customer, display customer name, city, order details (if any), salesperson name (if assigned), and salesperson commission. 
--Retain unassigned customers and customers without orders.
SELECT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt, s.name AS salesman_name, s.commission
FROM customer c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN salesman s
ON c.salesman_id = s.salesman_id;


--12. List all salespeople and any assigned customers, including salespeople without customers. Sort by salesperson name then customer name.
SELECT s.salesman_id, s.name, c.customer_id, c.cust_name
FROM salesman s
LEFT JOIN customer c
ON s.salesman_id = c.salesman_id
ORDER BY s.name ASC, c.cust_name ASC;


--13. List each salesperson, their customers (if any), and those customers’ orders (if any). Retain salespeople without customers and customers without orders.
SELECT s.salesman_id, s.name, c.customer_id, c.cust_name, o.ord_no, o.ord_date, o.purch_amt
FROM Salesman s
LEFT JOIN Customer c
ON s.salesman_id = c.salesman_id
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
ORDER BY s.salesman_id, c.customer_id, o.ord_no;


--14. List all salespeople and their assigned customers, including those without an order. 
--Show only orders worth at least 2,000 for customers with a non-NULL grade. Retain all salespeople even if no related order qualifies.
SELECT s.salesman_id, s.name AS salesman_name, c.customer_id, c.cust_name, o.ord_no, o.ord_date, o.purch_amt
FROM Salesman s
LEFT JOIN Customer c
    ON s.salesman_id = c.salesman_id
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
   AND o.purch_amt >= 2000
   AND c.grade IS NOT NULL
ORDER BY s.name, c.cust_name, o.ord_no;


--15. Display customer name, city, order number, order date, and amount, retaining both customers without orders 
--and orders whose customer_id has no matching customer master row. (Requires unmatched test data; see notes.)
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM customer c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;


--16. Repeat Q15, but retain matching customer/order rows only when the customer has a non-NULL grade; also identify orders without a matching customer row. 
--Clearly state how your filters treat unmatched rows.
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM Customer c
FULL OUTER JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE c.grade IS NOT NULL
   OR c.customer_id IS NULL
ORDER BY c.cust_name NULLS LAST, o.ord_no;


--17. Generate every possible salesperson–customer combination, regardless of assignment. Display both names.
SELECT c.cust_name, s.name as salesman_name
FROM salesman s
CROSS JOIN customer c
ORDER BY s.name, c.cust_name;


--18. Generate every possible salesperson–customer pair for customers whose city is not NULL.
SELECT s.name as salesman_name, c.cust_name
FROM salesman s
CROSS JOIN customer c
WHERE c.city IS NOT NULL 
ORDER BY s.name, c.cust_name;


--19. Generate all possible salesperson–customer pairs where the salesperson city is not NULL and the customer grade is not NULL.
SELECT s.name as salesman_name, s.city as salesman_city, c.cust_name, c.grade
FROM salesman s
CROSS JOIN customer c
WHERE s.city IS NOT NULL AND c.grade IS NOT NULL 
ORDER BY s.name, c.cust_name;


--20. Generate all possible salesperson–customer pairs for which the cities differ and the customer grade is not NULL. 
--This is not based on actual customer assignment.
SELECT s.name as salesman_name, s.city as salesman_city, c.cust_name, c.city as customer_city, c.grade
FROM salesman s
CROSS JOIN customer c
WHERE c.city <> s.city AND c.grade IS NOT NULL 
ORDER BY s.name, c.cust_name;


--21. Show orders exceeding 2,000, with customer name and salesperson name; sort by purchase amount descending.
SELECT s.name as salesman_name, c.cust_name, o.purch_amt
FROM orders o
INNER JOIN customer c
ON o.customer_id = c.customer_id
INNER JOIN salesman s
ON o.salesman_id = s.salesman_id
WHERE o.purch_amt > 2000
ORDER BY o.purch_amt DESC;


--22. Display every salesperson with their associated customer names, including salespeople who do not currently serve any customers. Sort by salesperson name.
SELECT s.name as salesman_name, c.cust_name
FROM salesman s
LEFT JOIN customer c
ON c.salesman_id = s.salesman_id
ORDER BY s.name;


--23. List customers who have no orders dated on or after 2012-09-01. Include customer ID, name and city.
SELECT c.customer_id, c.cust_name, c.city 
FROM Customer c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
   AND o.ord_date >= TO_DATE('2012-09-01', 'YYYY-MM-DD')
WHERE o.ord_no IS NULL
ORDER BY c.customer_id;


--24. Display the customer name, salesperson name, order number and purchase amount for orders where the salesperson lives in a different city from the customer.
SELECT c.cust_name, c.city as customer_city, s.name as salesman_name, s.city as salesman_city, o.ord_no, o.purch_amt
FROM orders o
INNER JOIN customer c
ON o.customer_id = c.customer_id
INNER JOIN salesman s
ON o.salesman_id = s.salesman_id
WHERE c.city <> s.city;


--25. Find customers who have never placed an order. Display customer ID, name and city.
SELECT c.customer_id, c.cust_name, c.city
FROM customer c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.ord_no IS NULL;


--26. Find salespeople with no assigned customers. Display salesperson ID, name and city.
SELECT s.salesman_id, s.name as salesman_name, s.city
FROM salesman s
LEFT JOIN customer c
ON s.salesman_id = c.salesman_id
WHERE c.customer_id IS NULL;


--27. List pairs of different orders placed by the same customer on different dates. 
--Display the customer name, both order numbers, and both dates, avoiding reverse duplicates.
SELECT c.cust_name, o1.ord_no, o1.ord_date, o2.ord_no, o2.ord_date
FROM orders o1
INNER JOIN orders o2
ON o1.customer_id = o2.customer_id
INNER JOIN customer c
ON o1.customer_id = c.customer_id
WHERE o1.ord_date <> o2.ord_date AND o1.ord_date < o2.ord_date
ORDER BY c.cust_name, o1.ord_no;


--28. List all orders where the order salesperson differs from the salesperson currently assigned to the customer. 
--Show both salesperson names, where those records exist.
SELECT o.ord_no, c.cust_name AS customer_name, s1.name AS order_salesperson, s2.name AS assigned_salesperson
FROM orders o
INNER JOIN customer c
    ON o.customer_id = c.customer_id
LEFT JOIN salesman s1
    ON o.salesman_id = s1.salesman_id
LEFT JOIN salesman s2
    ON c.salesman_id = s2.salesman_id
WHERE o.salesman_id <> c.salesman_id
   OR (o.salesman_id IS NULL AND c.salesman_id IS NOT NULL)
   OR (o.salesman_id IS NOT NULL AND c.salesman_id IS NULL)
ORDER BY o.ord_no;


--29. Find unique pairs of different customers living in the same city. Display the two customer names and shared city; prevent reverse duplicates.
SELECT c1.cust_name AS customer_1, c1.city as customer_1_city, c2.cust_name AS customer_2, c2.city AS customer_2_city
FROM customer c1
CROSS JOIN customer c2
WHERE c1.city = c2.city AND c1.customer_id < c2.customer_id;    


--30. Find unique pairs of different salespeople living in the same city. Display the two names and city; prevent reverse duplicates.
SELECT s1.name as salesman_1, s1.city as salesman_1_city, s2.name as salesman_2, s2.city as salesman_2_city
FROM salesman s1
CROSS JOIN salesman s2
WHERE s1.salesman_id < s2.salesman_id and s1.city = s2.city;



---------------------------------------------------------------------------------------------------------------



CREATE TABLE employees (
  employee_id INTEGER PRIMARY KEY,
  employee_name VARCHAR(80) NOT NULL,
  department VARCHAR(30) NOT NULL,
  salary DECIMAL(12,2) NOT NULL,
  manager_id INTEGER NULL
);

ALTER TABLE employees
ADD CONSTRAINT fk_employee_manager
FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);

INSERT INTO employees VALUES (101, 'Anita', 'IT', 150000, NULL);
INSERT INTO employees VALUES (102, 'Bala', 'IT', 95000, 101);
INSERT INTO employees VALUES (103, 'Charan', 'IT', 70000, 102);
INSERT INTO employees VALUES (104, 'Deepa', 'HR', 120000, NULL);
INSERT INTO employees VALUES (105, 'Esha', 'HR', 65000, 104);
INSERT INTO employees VALUES (106, 'Farhan', 'IT', 75000, 102);
INSERT INTO employees VALUES (107, 'Gita', 'Finance', 110000, NULL);
INSERT INTO employees VALUES (108, 'Hari', 'Finance', 60000, 107);
INSERT INTO employees VALUES (109, 'Isha', 'IT', 92000, 101);
INSERT INTO employees VALUES (110, 'Jaya', 'IT', 70000, 102);

SELECT * FROM employees;




--31. List each employee who has a manager, together with their manager’s name.
SELECT e1.employee_id, e1.employee_name, e2.employee_name as manager_name
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
ORDER BY e1.employee_id;


--32. List all employees, including top-level managers; show employee name and manager name (NULL for employees without a manager).
SELECT e1.employee_id, e1.employee_name, e2.employee_name as manager_name
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
ORDER BY e1.employee_id;


--33. Find employees earning more than their direct manager; show employee salary and manager salary.
SELECT e1.employee_id, e1.employee_name, e1.salary as employee_salary, e2.employee_name as manager_name, e2.salary as manager_salary
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.salary > e2.salary
ORDER BY e1.employee_id;


--34. Find employees earning less than their manager by at least 20,000; calculate the salary difference.
SELECT e1.employee_id, e1.employee_name, e1.salary as employee_salary, e2.employee_name as manager_name, 
    e2.salary as manager_salary, (e2.salary - e1.salary) as diff_salary
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE (e2.salary - e1.salary) >= 20000
ORDER BY e1.employee_id;


--35. Display the names of employees who directly supervise both Charan (employee_id 103) and Farhan (employee_id 106).
SELECT e2.employee_name as manager_name 
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.employee_id IN (103,106)
GROUP BY e2.employee_id, e2.employee_name;


--36. Find unique pairs of employees sharing the same direct manager. Exclude self-pairs and reverse duplicates.
SELECT e1.employee_name as employee_1, e2.employee_name as employee_2, e1.manager_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.manager_id
WHERE e1.employee_id < e2.employee_id AND e1.manager_id IS NOT NULL
ORDER BY e1.manager_id;


--37. For employees who have a manager and a grandmanager, show employee, direct manager and grandmanager names.
SELECT e1.employee_name, e2.employee_name as manager_name, e3.employee_name as grandmanager_name
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
JOIN employees e3
ON e2.manager_id = e3.employee_id
ORDER BY e1.employee_id;


--38. Find employees who do not manage anyone (leaf employees).
SELECT e1.employee_id, e1.employee_name
FROM employees e1
LEFT JOIN employees e2
ON e1.employee_id = e2.manager_id
WHERE e2.employee_id IS NULL
ORDER BY e1.employee_id;


--39. Find employees and their managers whose department values differ; show both department names.
SELECT e1.employee_name,e1.department as employee_dept, e2.employee_name as manager_name, e2.department as manager_dept
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.department <> e2.department;


--40. Find unique pairs of employees in the same department who have exactly equal salaries. Exclude pairing an employee with themselves.
SELECT e1.employee_name as employee_1, e2.employee_name as employee_2, e1.department, e1.salary
FROM employees e1
CROSS JOIN employees e2
WHERE e1.employee_id < e2.employee_id
AND e1.department = e2.department
AND e1.salary = e2.salary;

