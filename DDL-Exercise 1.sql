--1.	Create table ‘Product’ with below structure
--ProdID	ProductName	ManuDate	CompanyName	UnitPrice	CategoryName
CREATE TABLE Product (
    ProdID NUMBER(8),
    ProductName VARCHAR2(50),
    ManuDate DATE,
    CompanyName VARCHAR2(100),
    UnitPrice NUMBER(8,2),
    CategoryName VARCHAR2(50)
);


--2.	Insert some sample data into the table.
INSERT INTO Product VALUES (101, 'Laptop', DATE '2025-01-15', 'Dell', 55000.00, 'Electronics');
INSERT INTO Product VALUES (102, 'Mobile', DATE '2025-02-10', 'Samsung', 25000.00, 'Electronics');
INSERT INTO Product VALUES (103, 'Keyboard', DATE '2025-03-05', 'HP', 1500.00, 'Accessories');
INSERT INTO Product VALUES (104, 'Monitor', DATE '2025-04-20', 'LG', 12000.00, 'Electronics');
INSERT INTO Product VALUES (105, 'Mouse', DATE '2025-05-12', 'Logitech', 800.00, 'Accessories');
INSERT INTO Product VALUES (106, 'Printer', DATE '2025-06-18', 'Canon', 8500.00, 'Electronics');

SELECT * FROM Product;


--3.	Add a column ‘UnitsInStock’ into the table
ALTER TABLE Product
ADD UnitsInStock NUMBER(5);

SELECT * FROM Product;
DESC Product;


--4.	Drop a column ‘CompanyName’
ALTER TABLE Product
DROP COLUMN CompanyName;

SELECT * FROM Product;


--5.	Change the column length of ProdId from number(8) to number(10)
ALTER TABLE Product
MODIFY ProdID NUMBER(10);

DESC Product;


--6.	Change the table name to ‘Product_details’. 
RENAME Product TO Product_details;

SELECT * FROM Product_details;


--7.	Change the column name of ProdId to Product_id
ALTER TABLE Product_details
RENAME COLUMN ProdID TO Product_id;

DESC Product_details;




