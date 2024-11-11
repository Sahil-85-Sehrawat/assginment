REM   Script: ASSGINMENT
REM   DBMS

CREATE TABLE Course (  
    DeptNo NUMBER(2) PRIMARY KEY,  
    Dname VARCHAR2(20),  
    Location VARCHAR2(10)  
);

CREATE TABLE Student (  
    StudentId NUMBER(4) PRIMARY KEY,  
    StudentName VARCHAR2(40) NOT NULL,  
    Address1 VARCHAR2(300),  
    Gender VARCHAR2(15),  
    Course VARCHAR2(8),  
    Deptno NUMBER(2),  
    FOREIGN KEY (Deptno) REFERENCES Course(DeptNo)  
);

INSERT INTO Course (DeptNo, Dname, Location)   
VALUES (10, 'Computer Science', ' Delhi');

INSERT INTO Course (DeptNo, Dname, Location)   
VALUES (20, 'Mathematics', 'Haryana');

INSERT INTO Course (DeptNo, Dname, Location)   
VALUES (30, 'Python', 'Sikkim') 
;

INSERT INTO Course (DeptNo, Dname, Location)   
VALUES (40, 'ITPC', 'Goa') 
;

INSERT INTO Course (DeptNo, Dname, Location)   
VALUES (50, 'MCA', 'Goa');

INSERT INTO Student (StudentId, StudentName, Address1, Gender, Course, Deptno)   
VALUES (7369, 'Devesh singh', '116 South Delhi, ND', 'Male', 'BCA', 10);

INSERT INTO Student (StudentId, StudentName, Address1, Gender, Course, Deptno)   
VALUES (7777, 'Sheela ', '456 Mohali Road, Pune', 'Female', 'MCA', 50);

INSERT INTO Student (StudentId, StudentName, Address1, Gender, Course, Deptno)   
VALUES (2233, 'Dalal Dheeraj', '789 Pune, Mumbai', 'Male', 'BCA', 20);

INSERT INTO Student (StudentId, StudentName, Address1, Gender, Course, Deptno)   
VALUES (1111, 'Yogesh ', '321 Sonipat , HR', 'Female', 'BCA', 40);

INSERT INTO Student (StudentId, StudentName, Address1, Gender, Course, Deptno)   
VALUES (5555, 'Sonu Singh', '654 Beach Road, Goa', 'Male', 'MCA', 50);

SELECT * FROM Student 
;

SELECT StudentId, Course FROM Student 
;

SELECT Dname, Location FROM Course 
;

SELECT * FROM Student WHERE Course = 'MCA' 
;

SELECT StudentName FROM Student   
WHERE StudentName LIKE '_k%';

SELECT StudentName FROM Student   
WHERE StudentId IN (7369, 7777, 2233);

SELECT StudentName FROM Student   
WHERE Deptno NOT IN (10, 40);

SELECT StudentName FROM Student   
WHERE StudentName LIKE 'S%' AND StudentName NOT LIKE 's%';

SELECT StudentName FROM Student   
WHERE StudentName LIKE '_k%';

SELECT * FROM Student   
WHERE Deptno IS NULL;

SELECT * FROM Student   
ORDER BY Course ASC;

SELECT COUNT(*) FROM Student   
WHERE Course = 'BCA';

SELECT COUNT(*) FROM Student 
;

SELECT * FROM Student   
WHERE Deptno IN (1, 2);

SELECT * FROM Student   
ORDER BY Course;

SELECT * FROM Student   
ORDER BY StudentName;

CREATE TABLE CUSTOMER (  
    CustID INT PRIMARY KEY,  
    Last_Name VARCHAR(100),  
    First_Name VARCHAR(100)  
);

CREATE TABLE ORDERS (  
    Order_ID INT PRIMARY KEY,  
    Order_Date DATE,  
    Customer_SID INT,  
    Amount DECIMAL(10, 2),  
    CONSTRAINT FK_Customer FOREIGN KEY (Customer_SID) REFERENCES CUSTOMER(CustID),  
    CHECK (Amount > 20000)  
);

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES  
(1, 'Singh', 'Manish');

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES  
(2, 'Singh', 'Mansi');

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES  
(4, 'Singh', 'Monu');

INSERT INTO CUSTOMER (CustID, Last_Name, First_Name) VALUES  
(5, 'Singh', 'Yug');

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES  
(101, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1, 25000.00);

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES  
(102, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 2, 22000.00);

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES  
(104, TO_DATE('2024-01-12', 'YYYY-MM-DD'), 4, 35000.00);

INSERT INTO ORDERS (Order_ID, Order_Date, Customer_SID, Amount) VALUES  
(105, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 5, 21000.00);

SELECT   
    C.CustID,  
    C.Last_Name,  
    C.First_Name,  
    O.Amount  
FROM   
    CUSTOMER C  
JOIN   
    ORDERS O ON C.CustID = O.Customer_SID;

SELECT   
    C.CustID,   
    C.Last_Name,   
    C.First_Name  
FROM   
    CUSTOMER C  
WHERE   
    C.Last_Name LIKE '%s' OR C.First_Name LIKE '%s';

SELECT   
    O.Order_ID,   
    O.Order_Date,   
    O.Amount  
FROM   
    ORDERS O  
WHERE   
    O.Amount BETWEEN 21000 AND 30000;

SELECT   
    O.Order_ID,   
    O.Order_Date,   
    (O.Amount + 500) AS "New Amount"  
FROM   
    ORDERS O;

SELECT   
    O.Order_ID,   
    SUM(O.Amount) AS Total_Amount  
FROM   
    ORDERS O  
GROUP BY   
    O.Order_ID;

SELECT   
    SUM(O.Amount) AS Total_Amount  
FROM   
    ORDERS O  
WHERE   
    O.Amount > 15000;

CREATE TABLE Status (  
    Status_code VARCHAR2(6) PRIMARY KEY,  
    Name CHAR(20)  
);

CREATE TABLE Delay_Reason (  
    Reason_code VARCHAR2(15) PRIMARY KEY,  
    Name CHAR(20)  
);

CREATE TABLE Ready_Reason (  
    Reason_code VARCHAR2(15) PRIMARY KEY,  
    Name CHAR(20)  
);

CREATE TABLE Event (  
    Event_id VARCHAR2(6) PRIMARY KEY,  
    Duration NUMBER(20),  
    Status_code VARCHAR2(6),  
    Reason_code VARCHAR2(15),  
    FOREIGN KEY (Status_code) REFERENCES Status(Status_code),  
    FOREIGN KEY (Reason_code) REFERENCES Ready_Reason(Reason_code)  
);

SELECT   
    e.Event_id,   
    e.Duration,   
    s.Name AS Status_Name,   
    e.Reason_code  
FROM   
    Event e  
INNER JOIN   
    Status s ON e.Status_code = s.Status_code;

SELECT   
    Reason_code,   
    Name AS Reason_Name,   
    'Ready' AS Reason_Type  
FROM   
    Ready_Reason  
  
UNION ALL  
  
SELECT   
    Reason_code,   
    Name AS Reason_Name,   
    'Delay' AS Reason_Type  
FROM   
    Delay_Reason;

