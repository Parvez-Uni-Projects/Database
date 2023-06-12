The answers of the queries are below 

**1. Run the provided script to create the database**

The AP2_script.docx files contain was used to create the database.

**2. Insert a new product.**
```sql
INSERT INTO ProductDim (ProductKey, ProductName, Brand, UnitPrice)

VALUES (41, 'Mouse', 'Logitech', 9.99);
```

**3. Create a new sale fact related to the new product. You can choose any  existing customer, warehouse, date and sales office.**
```sql
INSERT INTO SaleFacts (ID, DateKey, CompanyKey, CustomerKey, ProductKey, WarehouseKey, SalesQuantity)

VALUES (503, 7,8, 9, 10, 7, 10);
```








**4. For all company branches (CompanyDim table) display branch addresses,  emails and states.**
```sql
SELECT BranchAddress, BranchEmail, BranchState

FROM CompanyDim;
```













**5. Display all customer names from Queensland.**

**-> (Assuming ‘Queensland’ is a state and it’s shortform is ‘QLD’)**
```sql
SELECT CustomerName

FROM CustomerDim

WHERE CustomerState = 'QLD';
```

**6. Display the total amount of sales for all companies in 2016.**
```sql
SELECT SUM(SalesQuantity \* UnitPrice) AS TotalSalesAmount

FROM SaleFacts

JOIN DateDim ON SaleFacts.DateKey = DateDim.DateKey

JOIN ProductDim ON SaleFacts.ProductKey = ProductDim.ProductKey

WHERE DateDim.Year = 2016; 
```

**7. Display total amount of sales for each company branch separately.**
```sql
SELECT c.BranchAddress, c.BranchState, c.BranchEmail, SUM(s.SalesQuantity \* p.UnitPrice) AS TotalSalesAmount

FROM SaleFacts s

JOIN CompanyDim c ON s.CompanyKey = c.CompanyKey

JOIN ProductDim p ON s.ProductKey = p.ProductKey

GROUP BY c.BranchAddress, c.BranchState, c.BranchEmail;
```






**8. Display total amount of sales for each product and state separately, i.e. the output should contain 3 columns: product, state and total amount for this product and state.**
```sql
SELECT p.ProductName, c.CustomerState, SUM(s.SalesQuantity \* p.UnitPrice) AS TotalSalesAmount

FROM SaleFacts s

JOIN ProductDim p ON s.ProductKey = p.ProductKey

JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey

GROUP BY p.ProductName, c.CustomerState;

(Showing the top few out of 181 only )
```

**9. Display products sold from warehouses located in New South Wales.**

**-> (Assuming ‘New South Wales’ is a region and it’s shortform is ‘NSW’)**
```sql
SELECT p.ProductName

FROM SaleFacts s

JOIN WarehouseDim w ON s.WarehouseKey = w.WarehouseKey

JOIN ProductDim p ON s.ProductKey = p.ProductKey

WHERE w.WarehouseRegion = 'NSW';
```






**10. For each sale, display a customer name and a purchase date.**
```sql
SELECT c.CustomerName, d.SaleDate

FROM SaleFacts s

JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey

JOIN DateDim d ON s.DateKey = d.DateKey;

(Showing the top few out of 503 only)
```



**11. Display a total number of sales (NOT AMOUNT in $) for each customer.**
```sql
SELECT c.CustomerName, COUNT(\*) AS TotalSales

FROM SaleFacts s

JOIN CustomerDim c ON s.CustomerKey = c.CustomerKey

GROUP BY c.CustomerName;

(Showing the top few out of 51 only)
```



**12. For each sales office (branch), display: branchKey, branch state, a customer name (a customer purchased in this office), a product name purchased by this customer, and a month number of the purchase**.
```sql
SELECT c.CompanyKey, c.BranchState, cust.CustomerName, prod.ProductName, d.Month

FROM SaleFacts s

JOIN CompanyDim c ON s.CompanyKey = c.CompanyKey

JOIN CustomerDim cust ON s.CustomerKey = cust.CustomerKey

JOIN ProductDim prod ON s.ProductKey = prod.ProductKey

JOIN DateDim d ON s.DateKey = d.DateKey;

(Showing the top few out of 51 only)
```





**13. Calculate a number (not amount in $) of sales in the second quarter of 2018.**

```sql
SELECT COUNT(\*) AS SalesCount

FROM SaleFacts s

JOIN DateDim d ON s.DateKey = d.DateKey

WHERE d.Year = 2018 AND d.Quarter = 2;
```






14. Display the following sale information: Office branchAddress, customerName, 

productName, WarehouseDivision, SaleDate for all offices in Victoria and between 20 January 2017 and 15 May 2017.

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


