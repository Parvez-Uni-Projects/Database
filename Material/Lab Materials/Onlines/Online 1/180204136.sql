
--------------------------------------------------------------------
-- Online: 01
-- Name: Md Zahidul haque
-- ID: 18.02.04.136 
-- Group: B2
--------------------------------------------------------------------

CREATE DATABASE SampleDB
CREATE TABLE SALESMAN
(
SalesmanId int IDENTITY(1001,1) PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Area varchar(15) NOT NULL,
YearOfService int NOT NULL,
Salary numeric(7,2),
)
CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(2001,1) PRIMARY KEY,
CustomerName varchar(50) NOT NULL,
Location varchar(15) NOT NULL,
PinCode numeric(8),
Class char(1) DEFAULT  'C',
)
CREATE TABLE ORDERS
(
OrderId int IDENTITY(3001,1) PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
SalesmanId int NOT NULL FOREIGN KEY REFERENCES SALESMAN (SalesmanId),
OrderDate date NOT NULL,
OrderAmount Numeric(8,2) CHECK(OrderAmount>9)
) 

INSERT INTO SALESMAN (LastName, FirstName, Area, YearOfService, Salary) 
VALUES ('Khan', 'Rahim', 'Gulshan',2, 30000),
       ('Rahman', 'Kahim','Dhanmondi',3, 40000),
       ('Mehedi', 'Hashim', 'Gulshan',4, 45000),
	   ('Khanna', 'Rahim', 'Banani',2, 30000),
       ('Rahman', 'Abir','Dhanmondi',3, 40000)
SELECT * FROM SALESMAN

INSERT INTO CUSTOMER (CustomerName, Location, PinCode, Class) 
VALUES ('Rahima Khatun', 'Gulshan', 1219 , 'A'),
       ('Kahim Rahmania','Dhanmondi',1222, 'C'),
       ('Mehedi Hashim', 'Gulshan',4444, 'B'),
	   ('Khanna Rahim', 'Banani',2111, 'C'),
       ('Rahman Abir','Dhanmondi',3000, 'B')
SELECT * FROM Customer

INSERT INTO ORDERS (CustomerId,SalesmanId,OrderDate, OrderAmount) 
VALUES (2001, 1002, '20200701' , 1005.50),
       (2004,1004,'20200708', 2001.75),
       (2005, 1005,'20200708', 200.25),
	   (2003, 1003,'20210701', 300),
       (2002,1001,'20210708', 10)
SELECT * FROM ORDERS

-->1
SELECT FirstName + ' ' + LastName as 'Salesman Name',Area as 'City',YearOfService as 'Servicing Year',Salary as 'Salary Earned' FROM SALESMAN

-->2
SELECT FirstName + ' ' + LastName as 'Salesman Name',Area as 'City',YearOfService as 'Servicing Year',Salary as 'Salary Earned' FROM SALESMAN WHERE Area <> 'Dhanmondi'

-->3
SELECT CustomerName, Location FROM CUSTOMER WHERE Class='A'

-->4
SELECT Area as 'City' FROM SALESMAN

-->5
UPDATE CUSTOMER set Class='A' where Location='Gulshan'

-->6
SELECT CustomerName, Location FROM CUSTOMER WHERE Location='Banani'

-->7
SELECT FirstName + ' ' + LastName as 'Salesman Name' FROM SALESMAN WHERE Salary > 20000

-->8
UPDATE ORDERS set OrderAmount=1000 where OrderId=3004

-->9
SELECT FirstName + ' ' + LastName as 'Salesman Name',Area as 'City' FROM SALESMAN ORDER BY Salary

-->10
SELECT * FROM ORDERS WHERE CustomerId=2003 ORDER BY OrderDate desc

-->11
UPDATE SALESMAN set Salary=Salary+1500 where YearOfService>1

-->12
UPDATE SALESMAN set Salary=Salary+Salary*0.05 where YearOfService>2

-->13
SELECT Location as 'Areas' FROM CUSTOMER

-->14
UPDATE ORDERS set OrderAmount=OrderAmount-OrderAmount*0.045 where OrderAmount>10000

-->15
DELETE FROM ORDERS where OrderAmount<50















