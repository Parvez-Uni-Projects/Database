The answers of the queries are below 

**1. Run the provided script to create the database**

The AP2_script.docx files contain was used to create the database.
![image](https://github.com/piru72/Database/assets/63257806/becef9bf-f8b3-4a08-8f41-63b1d5cbb396)


**2. Insert a new product.**
```sql
INSERT INTO ProductDim (ProductKey, ProductName, Brand, UnitPrice)

VALUES (41, 'Mouse', 'Logitech', 9.99);
```
![image](https://github.com/piru72/Database/assets/63257806/5278a6ba-4f2f-4f09-bffb-fcd5cbd8b3c6)


**3. Create a new sale fact related to the new product. You can choose any  existing customer, warehouse, date and sales office.**
```sql
INSERT INTO SaleFacts (ID, DateKey, CompanyKey, CustomerKey, ProductKey, WarehouseKey, SalesQuantity)

VALUES (503, 7,8, 9, 10, 7, 10);
```
![image](https://github.com/piru72/Database/assets/63257806/87b9b406-122a-404d-9f7c-59c9f82a806f)








**4. For all company branches (CompanyDim table) display branch addresses,  emails and states.**
```sql
SELECT BranchAddress, BranchEmail, BranchState

FROM CompanyDim;
```
![image](https://github.com/piru72/Database/assets/63257806/2d404447-5921-4f67-afb5-7bb447620e64)













**5. Display all customer names from Queensland.**

**-> (Assuming ‘Queensland’ is a state and it’s shortform is ‘QLD’)**
```sql
SELECT CustomerName

FROM CustomerDim

WHERE CustomerState = 'QLD';
```
![image](https://github.com/piru72/Database/assets/63257806/19d5cd14-52b2-493d-a8d8-248b55dd6b42)

**6. Display the total amount of sales for all companies in 2016.**
```sql
SELECT SUM(SalesQuantity \* UnitPrice) AS TotalSalesAmount

FROM SaleFacts

JOIN DateDim ON SaleFacts.DateKey = DateDim.DateKey

JOIN ProductDim ON SaleFacts.ProductKey = ProductDim.ProductKey

WHERE DateDim.Year = 2016; 
```
![image](https://github.com/piru72/Database/assets/63257806/b3c75e92-d340-4058-8627-4f62b28e592e)


**7. Display total amount of sales for each company branch separately.**
```sql
SELECT c.BranchAddress, c.BranchState, c.BranchEmail, SUM(s.SalesQuantity \* p.UnitPrice) AS TotalSalesAmount

FROM SaleFacts s

JOIN CompanyDim c ON s.CompanyKey = c.CompanyKey

JOIN ProductDim p ON s.ProductKey = p.ProductKey

GROUP BY c.BranchAddress, c.BranchState, c.BranchEmail;
```

![image](https://github.com/piru72/Database/assets/63257806/e180c13c-3cad-4f91-9e4e-09dbd575db06)





**8. Display total amount of sales for each product and state separately, i.e. the output should contain 3 columns: product, state and total amount for this product and state.**
```sql
SELECT p.ProductName, c.CustomerState, SUM(s.SalesQuantity \* p.UnitPrice) AS TotalSalesAmount

FROM SaleFacts s

JOIN ProductDim p ON s.ProductKey = p.ProductKey

JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey

GROUP BY p.ProductName, c.CustomerState;
```
(Showing the top few out of 181 only )
![image](https://github.com/piru72/Database/assets/63257806/07a42890-2c4e-4efc-9f9e-56275cbc4974)


**9. Display products sold from warehouses located in New South Wales.**

**-> (Assuming ‘New South Wales’ is a region and it’s shortform is ‘NSW’)**
```sql
SELECT p.ProductName

FROM SaleFacts s

JOIN WarehouseDim w ON s.WarehouseKey = w.WarehouseKey

JOIN ProductDim p ON s.ProductKey = p.ProductKey

WHERE w.WarehouseRegion = 'NSW';
```
(Showing the top few out of 161 only )
![image](https://github.com/piru72/Database/assets/63257806/eac83d1d-10b7-4b50-8e3a-de7f3941a720)





**10. For each sale, display a customer name and a purchase date.**
```sql
SELECT c.CustomerName, d.SaleDate

FROM SaleFacts s

JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey

JOIN DateDim d ON s.DateKey = d.DateKey;

```
(Showing the top few out of 503 only)
![image](https://github.com/piru72/Database/assets/63257806/85d661b5-4531-4a8e-bf4a-82fbf01c9476)



**11. Display a total number of sales (NOT AMOUNT in $) for each customer.**
```sql
SELECT c.CustomerName, COUNT(\*) AS TotalSales

FROM SaleFacts s

JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey

GROUP BY c.CustomerName;

```
(Showing the top few out of 51 only)
![image](https://github.com/piru72/Database/assets/63257806/a1f2e13e-9946-494b-ab3e-322d734b414c)



**12. For each sales office (branch), display: branchKey, branch state, a customer name (a customer purchased in this office), a product name purchased by this customer, and a month number of the purchase**.
```sql
SELECT c.CompanyKey, c.BranchState, cust.CustomerName, prod.ProductName, d.Month

FROM SaleFacts s

JOIN CompanyDim c ON s.CompanyKey = c.CompanyKey

JOIN CustomerDim cust ON s.CustomerKey = cust.CustomerKey

JOIN ProductDim prod ON s.ProductKey = prod.ProductKey

JOIN DateDim d ON s.DateKey = d.DateKey;

```
(Showing the top few out of 51 only)
![image](https://github.com/piru72/Database/assets/63257806/6798b2de-7cfd-4742-a33b-5848d6b622f8)





**13. Calculate a number (not amount in $) of sales in the second quarter of 2018.**

```sql
SELECT COUNT(\*) AS SalesCount

FROM SaleFacts s

JOIN DateDim d ON s.DateKey = d.DateKey

WHERE d.Year = 2018 AND d.Quarter = 2;
```
![image](https://github.com/piru72/Database/assets/63257806/0dcf40db-d034-4645-8fdb-f470075b562b)






14. Display the following sale information: Office branchAddress, customerName, productName, WarehouseDivision, SaleDate for all offices in Victoria and between 20 January 2017 and 15 May 2017.

```sql
 SELECT c.BranchAddress, cust.CustomerName, prod.ProductName, w.WarehouseDivision, d.SaleDate

FROM SaleFacts s

JOIN CompanyDim c ON s.CompanyKey = c.CompanyKey

JOIN CustomerDim cust ON s.CustomerKey = cust.CustomerKey

JOIN ProductDim prod ON s.ProductKey = prod.ProductKey

JOIN WarehouseDim w ON s.WarehouseKey = w.WarehouseKey

JOIN DateDim d ON s.DateKey = d.DateKey

WHERE c.BranchState = 'Victoria' AND d.SaleDate BETWEEN '2017-01-20' AND '2017-05-15';
```
![image](https://github.com/piru72/Database/assets/63257806/f421ad48-50eb-4c1a-8cb3-664b8277699e)


