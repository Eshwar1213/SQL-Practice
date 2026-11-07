CREATE TABLE Employee (
    employee_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    mobile VARCHAR2(15),
    address VARCHAR2(100)
);

CREATE TABLE Doctor (
    doc_id NUMBER PRIMARY KEY,
    doc_name VARCHAR2(50),
    speilization VARCHAR2(100)
);

CREATE TABLE Room_Information (
    room_id NUMBER PRIMARY KEY,
    room_name VARCHAR2(50),
    building_name VARCHAR2(100),
    incharge NUMBER,
    CONSTRAINT fk_room_incharge FOREIGN KEY (incharge) REFERENCES Employee(employee_id)ON DELETE CASCADE
);

CREATE TABLE Patient (
    patient_id NUMBER PRIMARY KEY,
    patient_name VARCHAR2(50) NOT NULL,
    age NUMBER CHECK (age BETWEEN 1 AND 120),
    mobile_no VARCHAR2(15) UNIQUE,
    address VARCHAR2(100) NOT NULL,
    doc_id NUMBER,
    room_no NUMBER,
    CONSTRAINT fk_patient_doctor FOREIGN KEY (doc_id) REFERENCES Doctor(doc_id) ON DELETE CASCADE,
    CONSTRAINT fk_patient_room FOREIGN KEY (room_no) REFERENCES Room_Information(room_id) ON DELETE CASCADE
);

-- 1. Employee: Insert 5 records
INSERT INTO Employee VALUES (1, 'Ramesh', '9876500001', 'Chennai');
INSERT INTO Employee VALUES (2, 'Suresh', '9876500002', 'Salem');
INSERT INTO Employee VALUES (3, 'Karthik', '9876500003', 'Coimbatore');
INSERT INTO Employee VALUES (4, 'Divya', '9876500004', 'Madurai');
INSERT INTO Employee VALUES (5, 'Priya', '9876500005', 'Erode');

SELECT * FROM Employee;


-- 2. Doctor: Insert 5 records
INSERT INTO Doctor VALUES (101, 'Dr. Anand', 'Cardiology');
INSERT INTO Doctor VALUES (102, 'Dr. Priya', 'Neurology');
INSERT INTO Doctor VALUES (103, 'Dr. Kumar', 'Orthopedics');
INSERT INTO Doctor VALUES (104, 'Dr. Divya', 'Pediatrics');
INSERT INTO Doctor VALUES (105, 'Dr. Ravi', 'Dermatology');

SELECT * FROM Doctor;


-- 3. Room_Information: Insert 5 records
INSERT INTO Room_Information VALUES (201, 'General Ward', 'Block A', 1);
INSERT INTO Room_Information VALUES (202, 'ICU', 'Block B', 2);
INSERT INTO Room_Information VALUES (203, 'Private Room', 'Block A', 3);
INSERT INTO Room_Information VALUES (204, 'Emergency Ward', 'Block C', 4);
INSERT INTO Room_Information VALUES (205, 'Operation Room', 'Block B', 5);

SELECT * FROM Room_Information;


-- 4. Patient: Insert 5 records
INSERT INTO Patient VALUES (301, 'Arun', 25, '9000000001', 'Chennai', 101, 201);
INSERT INTO Patient VALUES (302, 'Priya', 30, '9000000002', 'Salem', 102, 202);
INSERT INTO Patient VALUES (303, 'Karthik', 45, '9000000003', 'Coimbatore', 103, 203);
INSERT INTO Patient VALUES (304, 'Divya', 12, '9000000004', 'Madurai', 104, 204);
INSERT INTO Patient VALUES (305, 'Rahul', 55, '9000000005', 'Erode', 105, 205);

SELECT * FROM Patient;


