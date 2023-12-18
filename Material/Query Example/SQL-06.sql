CREATE TABLE DEPARTMENT
(DepartmentId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
DepartmentName varchar(50) NOT NULL,
NumberOfSection int NOT NULL,
Budget money NOT NULL
)
INSERT INTO DEPARTMENT
(DepartmentName,NumberOfSection,Budget)
VALUES ('HR',1,200000),
       ('IT',3,600000),
       ('SALES',2,400000),
       ('PURCHASE',2,350000),
       ('ACCOUNTS',2,500000)

DELETE FROM DEPARTMENT

DROP TABLE DEPARTMENT

TRUNCATE TABLE DEPARTMENT

SELECT * FROM DEPARTMENT

----------------------------------------------------------

CREATE TABLE EMPLOYEE
( EmployeeId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
EmployeeName varchar(50) NOT NULL,
Salary numeric(7,2) NOT NULL,
Phone nchar(11) NOT NULL UNIQUE,
City varchar(50)DEFAULT 'Dhaka',
DOB date,
DepartmentId int NOT NULL 
FOREIGN KEY REFERENCES DEPARTMENT(DepartmentId)
)

INSERT INTO EMPLOYEE (EmployeeName,Salary,Phone,City,DOB,DepartmentId)
VALUES('Jamal',16000.00,123456,'Khulna','1982-04-12',1),
      ('Salam',17000.00,7865467,'Pabna','1980-05-05',1),
      ('Salma',17500.00,783463,'Pabna','1980-10-25',3),
      ('Samsul',12000.00,3890876,'Dhaka','1984-02-17',3),
      ('Rahima',16500.00,68886,'Dhaka','1987-03-18',2),
      ('Jamila',14000.00,764368,'Rajshahi','1986-07-05',2),
      ('Jahan',15000.00,7675756,'Khulna','1983-09-09',2),
      ('Rakib',18000.00,677889,'Rajhahi','1983-07-16',5),
      ('Nusrat',18500.00,675733,'Dhaka','1985-07-08',4),
      ('Nabil',20500.00,989733,'Khulna','1982-12-12',4)


SELECT * FROM EMPLOYEE

DROP DATABASE ShopDB

----------------------------------------------------------------
/*UNION  */

(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA')
UNION
(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA')

--------------------------------------------------------------------
/*UNION ALL  */

(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA')
UNION ALL
(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA')

--------------------------------------------------------------------
/*INTERSECT */

(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA')
INTERSECT
(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='KHULNA')

--------------------------------------------------------------------
/*EXCEPT*/

(SELECT EmployeeName,City
FROM EMPLOYEE 
)
EXCEPT
(SELECT EmployeeName,City
FROM EMPLOYEE 
WHERE City !='DHAKA'
)

--------------------------------------------------------------

SELECT * FROM EMPLOYEE

SELECT * FROM DEPARTMENT

SELECT * FROM EMPLOYEE
WHERE DepartmentId > ANY 
(SELECT DepartmentId FROM DEPARTMENT WHERE Budget > 300000.00)

SELECT * FROM EMPLOYEE
WHERE DepartmentId > ALL 
(SELECT DepartmentId FROM DEPARTMENT WHERE Budget > 300000.00)

------------------------------------------------------------------


SELECT EmployeeId,EmployeeName,DepartmentId
FROM EMPLOYEE
WHERE EXISTS
(SELECT DepartmentId FROM DEPARTMENT 
WHERE EMPLOYEE.DepartmentId = DEPARTMENT.DepartmentId
AND 
DEPARTMENT.DepartmentId =6)

SELECT EmployeeId,EmployeeName,DepartmentId
FROM EMPLOYEE
WHERE NOT EXISTS
(SELECT d.DepartmentId FROM DEPARTMENT as d
JOIN EMPLOYEE as e on (e.DepartmentId=d.DepartmentId)
WHERE 
d.DepartmentId =6)

-----------------------------------functions------------------
SELECT * FROM EMPLOYEE
SELECT * FROM DEPARTMENT

SELECT LEFT('Samia Tasnim',5) AS LeftName
-----OR----
SELECT LEFT(EmployeeName,2) FROM EMPLOYEE

SELECT RIGHT('DHAKA 1215',4) AS RightPart
------OR----
SELECT RIGHT(EmployeeName,2) FROM EMPLOYEE

SELECT SUBSTRING('13-01-04-074',10,3) AS ROLL
----OR----
SELECT SUBSTRING(City,1,3) FROM EMPLOYEE

SELECT REVERSE('MSSQL') AS REV 
-----OR----
SELECT REVERSE(EmployeeName) AS RevEmployeeName FROM EMPLOYEE

SELECT CAST(57.58 AS INTEGER) AS IntValue
-------OR--------
SELECT CAST(Budget AS INTEGER) AS Budget FROM DEPARTMENT

SELECT CONVERT(INTEGER,78.8)AS Int_Value
------OR---------
SELECT CONVERT(Integer,Budget) AS Int_Budget FROM DEPARTMENT

---------------------------------------------------
-----DATE
---------------------------------------------------
SELECT DATEADD(YEAR,3,'1992-04-07') As IncrementYear
------OR-----
SELECT DATEADD(MONTH,2,DOB) As IncrementMonth 
FROM EMPLOYEE
WHERE EmployeeID=2

SELECT DATEDIFF(YEAR,'1992-03-11','1995-08-23') AS DateDiff

SELECT DATEPART(DAY,'2001-07-24') AS Day
----OR-----
SELECT DATEPART(DAY,DOB) As Day 
FROM EMPLOYEE
WHERE EmployeeID=2

SELECT DAY('1990-06-14') AS Day
-------OR--------
SELECT DAY(DOB) AS Day
FROM EMPLOYEE


SELECT GETDATE()
---------------------