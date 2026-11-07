--1. Create the Parts table and insert records
CREATE TABLE Parts (
    ID VARCHAR2(10),
    Color VARCHAR2(20),
    Weight NUMBER(5,2)
);

INSERT INTO Parts VALUES ('AB123', 'Blue', 10.5);
INSERT INTO Parts VALUES ('CD456', 'Red', 8.0);
INSERT INTO Parts VALUES ('EF789', 'Green', 9.25);
INSERT INTO Parts VALUES ('GH012', 'Yellow', 8.0);
INSERT INTO Parts VALUES ('IJ341', 'Blue', 1.0);

SELECT * FROM Parts;


--2. Create the Investment table and insert records
CREATE TABLE Investment (
    Id NUMBER(3),
    Name VARCHAR2(50),
    Email VARCHAR2(100),
    Investments VARCHAR2(50)
);

INSERT INTO Investment VALUES (231, 'Albert Master', 'albert.master@gmail.com', 'Bonds');
INSERT INTO Investment VALUES (210, 'Alfred Alan', 'aalan@gmail.com', 'Stocks');
INSERT INTO Investment VALUES (256, 'Alison Smart', 'asmart@biztalk.com', 'Residential Property');
INSERT INTO Investment VALUES (211, 'Ally Emery', 'ally@easymail.com', 'Stocks');
INSERT INTO Investment VALUES (248, 'Andrew Phips', 'andyp@mycorp.com', 'Stocks');
INSERT INTO Investment VALUES (234, 'Andy Mitchel', 'andym@hotmail.com', 'Stocks');
INSERT INTO Investment VALUES (226, 'Angus Robins', 'arobins@robins.com', 'Bonds');
INSERT INTO Investment VALUES (241, 'Ann Melan', 'ann_melan@inet.com', 'Residential Property');
INSERT INTO Investment VALUES (225, 'Ben Bessel', 'benb@hotmail.com', 'Stocks');
INSERT INTO Investment VALUES (235, 'Bensen Romanolf', 'benr@albert.net', 'Bonds');

SELECT * FROM Investment;


--3. Create the Product table and insert records
CREATE TABLE Table_Product (
    ProductID NUMBER(5),
    Color VARCHAR2(30),
    Price NUMBER(8,2)
);

INSERT INTO Table_Product VALUES (1, 'red, green', 15.99);
INSERT INTO Table_Product VALUES (2, 'yellow', 23.99);
INSERT INTO Table_Product VALUES (3, 'green', 17.50);
INSERT INTO Table_Product VALUES (4, 'yellow, blue', 8.99);
INSERT INTO Table_Product VALUES (5, 'red', 29.99);

SELECT * FROM Table_Product;


--4. Create Vendor and Customer tables
CREATE TABLE Vendor (
    VendorID NUMBER PRIMARY KEY,
    Region VARCHAR2(50),
    Name VARCHAR2(100)
);

CREATE TABLE Customer (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    VendorID NUMBER,
    Address VARCHAR2(200),
    Region VARCHAR2(50),
    CONSTRAINT fk_customer_vendor FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
);

-- Insert 5 records into Vendor
INSERT INTO Vendor VALUES (1, 'Tamil Nadu', 'ABC Suppliers');
INSERT INTO Vendor VALUES (2, 'Karnataka', 'XYZ Traders');
INSERT INTO Vendor VALUES (3, 'Kerala', 'Green Enterprises');
INSERT INTO Vendor VALUES (4, 'Andhra Pradesh', 'Sunrise Traders');
INSERT INTO Vendor VALUES (5, 'Maharashtra', 'Global Suppliers');


-- Insert 5 records into Customer
INSERT INTO Customer VALUES (101, 'Arun', 1, 'Coimbatore', 'Tamil Nadu');
INSERT INTO Customer VALUES (102, 'Priya', 2, 'Bengaluru', 'Karnataka');
INSERT INTO Customer VALUES (103, 'Kumar', 1, 'Salem', 'Tamil Nadu');
INSERT INTO Customer VALUES (104, 'Divya', 3, 'Kochi', 'Kerala');
INSERT INTO Customer VALUES (105, 'Rahul', 4, 'Vijayawada', 'Andhra Pradesh');

SELECT * FROM Vendor;

SELECT * FROM Customer;


--5. Create Address, CustomerAddress and Customer tables
CREATE TABLE Address (
    AddressID NUMBER PRIMARY KEY,
    AddressLine1 VARCHAR2(100),
    AddressLine2 VARCHAR2(100),
    City VARCHAR2(50),
    StateProvince VARCHAR2(50),
    CountryRegion VARCHAR2(50),
    PostalCode VARCHAR2(20)
);

CREATE TABLE c_Customer (
    CustomerID NUMBER PRIMARY KEY,
    Title VARCHAR2(10),
    FirstName VARCHAR2(50),
    MiddleName VARCHAR2(50),
    LastName VARCHAR2(50)
);

CREATE TABLE CustomerAddress (
    CustomerID NUMBER,
    AddressID NUMBER,
    AddressType VARCHAR2(30),

    CONSTRAINT pk_customer_address PRIMARY KEY (CustomerID, AddressID),
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES c_Customer(CustomerID),
    CONSTRAINT fk_address FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);


-- Insert 5 records into Address
INSERT INTO Address VALUES (1, '12 Main Road', NULL, 'Coimbatore', 'Tamil Nadu', 'India', '641001');
INSERT INTO Address VALUES (2, '45 Lake Street', NULL, 'Salem', 'Tamil Nadu', 'India', '636001');
INSERT INTO Address VALUES (3, '23 Gandhi Street', NULL, 'Chennai', 'Tamil Nadu', 'India', '600001');
INSERT INTO Address VALUES (4, '78 MG Road', NULL, 'Bengaluru', 'Karnataka', 'India', '560001');
INSERT INTO Address VALUES (5, '9 Beach Road', NULL, 'Kochi', 'Kerala', 'India', '682001');


-- Insert 5 records into Customer
INSERT INTO c_Customer VALUES (101, 'Mr.', 'Arun', NULL, 'Kumar');
INSERT INTO c_Customer VALUES (102, 'Ms.', 'Priya', NULL, 'Ravi');
INSERT INTO c_Customer VALUES (103, 'Mr.', 'Karthik', NULL, 'Raj');
INSERT INTO c_Customer VALUES (104, 'Ms.', 'Divya', NULL, 'Sharma');
INSERT INTO c_Customer VALUES (105, 'Mr.', 'Rahul', NULL, 'Verma');


-- Insert 5 records into CustomerAddress
INSERT INTO CustomerAddress VALUES (101, 1, 'Main Office');
INSERT INTO CustomerAddress VALUES (102, 2, 'Home');
INSERT INTO CustomerAddress VALUES (103, 3, 'Home');
INSERT INTO CustomerAddress VALUES (104, 4, 'Office');
INSERT INTO CustomerAddress VALUES (105, 5, 'Home');


SELECT * FROM Address;

SELECT * FROM c_Customer;

SELECT * FROM CustomerAddress;












