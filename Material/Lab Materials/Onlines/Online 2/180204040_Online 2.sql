--------------------------------------------------------------------
-- Online: 02
-- Name: Mustavi Ibne Masum
-- ID: 18.02.04.040
-- Group: A2
--------------------------------------------------------------------
--1->
SELECT * FROM Products WHERE ProductPrice > 30

--2->
SELECT * FROM ProductTypes WHERE ProductTypeID <> 2

--3->
SELECT * FROM Orders WHERE OrderDateTime >= '2006-01-10' AND OrderDateTime <= '2006-01-13'

--4->
SELECT SUM(Tax) AS 'Total Tax' FROM Orders

--5->
SELECT COUNT(OrderID) AS 'Total Number of Orders' FROM Orders

--6->
SELECT ProductPrice AS 'Regular Price',ProductPrice*.95 'Sale Price' FROM Products

--7->
SELECT * FROM Products WHERE ProductPrice=(SELECT MAX(ProductPrice) FROM Products)

--8->
SELECT AVG(ProductPrice) AS 'Average Cost' FROM Products

--9->
SELECT * FROM Customers WHERE FirstName LIKE 'J%'

--10->
SELECT * FROM Customers WHERE StateProvince = 'IL' OR StateProvince = 'KS' OR StateProvince = 'PA'

--11->
SELECT * FROM Customers ORDER BY LastName

--12->
SELECT CustomerID,SUM(Shipping) AS 'Total Amount Paid for Shipping' FROM Orders GROUP BY CustomerID

--13->
SELECT CustomerID,SUM(Shipping) AS 'Total Amount Paid for Shipping' FROM Orders GROUP BY CustomerID HAVING COUNT(CustomerID) >= 3

--14->
SELECT TOP 3 * FROM Customers

--15->
SELECT CustomerID,MAX(Tax) AS 'Maximum Tax' FROM Orders GROUP BY CustomerID