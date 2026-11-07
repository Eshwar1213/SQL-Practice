--Part 1 – Basic Usage
--1. Display the lowest last name alphabetically (Customers table).
SELECT MIN(last_name)
FROM ACDB_CUSTOMERS;


--2. Display the average monthly payment (Packages table).
SELECT AVG(monthly_payment)
FROM ACDB_PACKAGES;

--3. Display the highest last name alphabetically (Customers table).
SELECT MAX(last_name) 
FROM ACDB_CUSTOMERS;

--4. Display the number of internet packages (Packages table).
SELECT COUNT(*)
FROM ACDB_PACKAGES;

--5. Display the number of records in Customers table.
SELECT COUNT(*)
FROM ACDB_CUSTOMERS;

--6. Display the number of distinct states (Customers table).
SELECT COUNT(DISTINCT state)
FROM ACDB_CUSTOMERS;


--7. Display the number of distinct internet speeds (Packages table).
SELECT COUNT(DISTINCT speed)
FROM ACDB_PACKAGES;


--8. Display the number of values (exclude Nulls) in Fax column (Customers table).
SELECT COUNT(fax)
FROM ACDB_CUSTOMERS;


--9. Display the number of Null values in Fax column (Customers table).
SELECT COUNT(*)
FROM ACDB_CUSTOMERS
WHERE fax IS NULL;


--10. Display the highest, lowest and average monthly discount (Customers table).
SELECT MAX(monthly_discount), MIN(monthly_discount), AVG(monthly_discount)
FROM ACDB_CUSTOMERS;


--Part 2 – GROUP BY and HAVING clauses
--1. Display the state and the number of customers for each state (Customers table).
SELECT state, COUNT(*) AS total_customers
FROM ACDB_CUSTOMERS
GROUP BY state;

--2. Display the internet speed and the average monthly payment for each speed (Packages table).
SELECT speed, AVG(monthly_payment) AS average_payment
FROM ACDB_PACKAGES
GROUP BY speed;


--3. Display the state and the number of distinct cities for each state (Customers table).
SELECT state, COUNT(DISTINCT city) AS total_cities
FROM ACDB_CUSTOMERS
GROUP BY state;

--4. Display the sector number and the highest monthly payment for each sector (Packages table)
SELECT sector_id, MAX(monthly_payment) AS highest_payment
FROM ACDB_PACKAGES
GROUP BY sector_id;

--5. Package number and average monthly discount (Customers table) –
--5.1. Display the package number and the average monthly discount for each package.
SELECT pack_id, AVG(monthly_discount) AS average_discount
FROM ACDB_CUSTOMERS
GROUP BY pack_id;

--5.2. Display the package number and the average monthly discount for each package, only for packages whose number equals 22 or 13.
SELECT pack_id, AVG(monthly_discount) AS average_discount
FROM ACDB_CUSTOMERS
WHERE pack_id IN (22, 13)
GROUP BY pack_id;

--6. Display the highest, lowest and average monthly payment for each internet speed (Packages table).
SELECT speed, MAX(monthly_payment), MIN(monthly_payment), AVG(monthly_payment)
FROM ACDB_PACKAGES
GROUP BY speed;


--7. The number of customer in each internet package (Customers table) –
--7.1. Display the package number and the number of customers for each package number.
SELECT pack_id, COUNT(*) AS total_customers
FROM ACDB_CUSTOMERS
GROUP BY pack_id;

--7.2. Modify the query to display the package number and number of customers for each
--package number, only for the customers whose monthly discount is greater than 20.
SELECT pack_id, COUNT(*) AS total_customers
FROM ACDB_CUSTOMERS
WHERE monthly_discount > 20
GROUP BY pack_id;

--7.3. Modify the query to display the package number and number of customers for each
--package number, only for the packages with more than 100 customers.
SELECT pack_id, COUNT(*) AS total_customers
FROM ACDB_CUSTOMERS
GROUP BY pack_id
HAVING COUNT(*) > 100;


--8. Display the state, city and number of customers for each state and city.
SELECT state, city, COUNT(*) AS total_customers
FROM ACDB_CUSTOMERS
GROUP BY state, city;

--9. Cities and the average monthly discount (Customers table) –
--9.1. Display the city and the average monthly discount for each city
SELECT city, AVG(monthly_discount) AS average_discount
FROM ACDB_CUSTOMERS
GROUP BY city;

--9.2. Display the city and the average monthly discount for each city, only for the
--customers whose monthly discount is greater than 20
SELECT city, AVG(monthly_discount) AS average_discount
FROM ACDB_CUSTOMERS
WHERE monthly_discount > 20
GROUP BY city;

--10. States and the lowest monthly discount (Customers table) –
--10.1. Display the state and the lowest monthly discount for each state.
SELECT state, MIN(monthly_discount) AS lowest_discount
FROM ACDB_CUSTOMERS
GROUP BY state;

--10.2. Display the state and lowest monthly discount for each state, only for states where
--the lowest monthly discount is greater than 10
SELECT state, MIN(monthly_discount) AS lowest_discount
FROM ACDB_CUSTOMERS
GROUP BY state
HAVING MIN(monthly_discount) > 10;


--11. Display the internet speed and number of package for each internet speed, only for the
--internet speeds with more than 8 packages
SELECT speed, COUNT(*) AS total_packages
FROM ACDB_PACKAGES
GROUP BY speed
HAVING COUNT(*) > 8;