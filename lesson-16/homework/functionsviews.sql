1.CREATE VIEW vwStaff AS
SELECT StaffID, fullname, Department, salary
FROM dbo.Staff;


SELECT * FROM dbo.Staff;


select * from vwStaff
select ItemName,Price from dbo.Items
--2. Create a view **vwItemPrices** that displays all items along with their prices from the **Items** table.
create view vwItemPrices as select ItemName,Price from dbo.Items

--3. Write a query to create a temporary table called **#TempPurchases** and insert sample data into it.
CREATE TABLE #TempPurchases (
    PurchaseID INT,
    CustomerID INT,
    ProductID INT,
    PurchaseDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO #TempPurchases (PurchaseID, CustomerID, ProductID, PurchaseDate, Amount)
VALUES
    (1, 101, 1001, '2025-01-15', 150.00),
    (2, 102, 1002, '2025-02-20', 200.50),
    (3, 103, 1003, '2025-03-05', 175.75),
    (4, 104, 1004, '2025-03-20', 125.00),
    (5, 105, 1005, '2025-04-01', 225.00

--4 Declare a temporary variable `@currentRevenue` to store the total revenue for the current month.
DECLARE @currentRevenue DECIMAL(10, 2);
SET @currentRevenue = (SELECT SUM(Amount)
                       FROM Purchases
                       WHERE YEAR(PurchaseDate) = YEAR(GETDATE())
                         AND MONTH(PurchaseDate) = MONTH(GETDATE()));
SELECT @currentRevenue AS CurrentMonthRevenue;

--5. Write a scalar function named **fnSquare** that accepts a numeric input and returns its square.
CREATE FUNCTION fnSquare (@InputNumber DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN @InputNumber * @InputNumber;
END;


--6.  Create a stored procedure **spGetClients** to return the list of all clients from the **Clients** table
CREATE PROCEDURE spGetClients
AS
BEGIN
    SELECT * 
    FROM Clients;
END;

--7 
 select * from dbo.clients
 select * from dbo.purchases

MERGE INTO Clients AS target
USING Purchases AS source
ON target.ClientID = source.ClientID
WHEN MATCHED THEN
    UPDATE SET
        target.registrationdate = source.PurchaseDate
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ClientID, registrationdate)
    VALUES (source.ClientID, source.PurchaseDate)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;


--8. Create a temporary table **#StaffInfo** to hold staff details and insert sample rows into it.

CREATE TABLE #StaffInfo (
    StaffID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Position NVARCHAR(50),
    HireDate DATE
);

INSERT INTO #StaffInfo (StaffID, FirstName, LastName, Position, HireDate)
VALUES
    (1, 'John', 'Doe', 'Manager', '2021-05-10'),
    (2, 'Jane', 'Smith', 'Developer', '2022-06-15'),
    (3, 'Michael', 'Brown', 'Designer', '2023-02-20'),
    (4, 'Emily', 'Davis', 'Tester', '2024-01-25'),
    (5, 'David', 'Wilson', 'Analyst', '2025-03-01');
SELECT * FROM #StaffInfo;



--9. Write a function **fnEvenOdd** that takes a numeric parameter and returns a string indicating whether the number is "Even" or "Odd."

CREATE FUNCTION fnEvenOdd (@InputNumber INT)
RETURNS NVARCHAR(10)
AS
BEGIN
    DECLARE @Result NVARCHAR(10);

    IF @InputNumber % 2 = 0
        SET @Result = 'Even';
    ELSE
        SET @Result = 'Odd';

    RETURN @Result;
END;


10. 

CREATE PROCEDURE spMonthlyRevenue
    @Year INT,
    @Month INT
AS
BEGIN
    SELECT SUM(Amount) AS TotalRevenue
    FROM Purchases
    WHERE YEAR(PurchaseDate) = @Year
      AND MONTH(PurchaseDate) = @Month;
END;

11. Write a query to create a view **vwRecentItemSales** that shows the total sales per item for the last month.

CREATE VIEW vwRecentItemSales AS
SELECT
    ProductID,
    SUM(Amount) AS TotalSales
FROM
    Purchases
WHERE
    PurchaseDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY
    ProductID;


12.  
DECLARE @currentDate DATE;

SET @currentDate = GETDATE();

PRINT @currentDate;


13. Create a view **vwHighQuantityItems** that lists items with quantities greater than 100 from the **Items** table.

CREATE VIEW vwHighQuantityItems AS
SELECT *
FROM Items
WHERE Quantity > 100;

14. Write a query to create a temporary table **#ClientOrders** and join it with the **Purchases** table to display client orders.

CREATE TABLE #ClientOrders (
    ClientID INT,
    ClientName NVARCHAR(100),
    OrderID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO #ClientOrders (ClientID, ClientName, OrderID, OrderDate, Amount)
VALUES
    (1, 'Alice Johnson', 1001, '2025-01-15', 150.00),
    (2, 'Bob Smith', 1002, '2025-02-20', 200.50),
    (3, 'Charlie Brown', 1003, '2025-03-05', 175.75),
    (4, 'Diana Prince', 1004, '2025-03-20', 125.00),
    (5, 'Ethan Hunt', 1005, '2025-04-01', 225.00);

SELECT 
    co.ClientID,
    co.ClientName,
    p.PurchaseID,
    p.PurchaseDate,
    p.Amount
FROM 
    #ClientOrders co
JOIN 
    Purchases p ON co.OrderID = p.PurchaseID;

15. Create a stored procedure **spStaffDetails** that takes a staff ID as a parameter and returns the staff members name and department.

CREATE PROCEDURE spStaffDetails
    @StaffID INT
AS
BEGIN
    SELECT 
        StaffName, 
        Department 
    FROM 
        StaffTable 
    WHERE 
        StaffID = @StaffID
END


16. Write a simple function **fnAddNumbers** that takes two numeric parameters and returns their sum.

CREATE FUNCTION fnAddNumbers
    (@Num1 INT, @Num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @Num1 + @Num2
END

17. Write a MERGE statement to update the **Items** table with new pricing data sourced from a temporary table **#NewItemPrices**.

MERGE Items AS target
USING #NewItemPrices AS source
ON target.ItemID = source.ItemID
WHEN MATCHED THEN
    UPDATE SET target.Price = source.Price
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ItemID, Price)
    VALUES (source.ItemID, source.Price)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;


18. Create a view **vwStaffSalaries** that displays staff names along with their salaries.


CREATE VIEW vwStaffSalaries
AS
SELECT 
    StaffName, 
    Salary 
FROM 
    StaffTable;


19. Write a stored procedure **spClientPurchases** that returns all purchases for a specific client given the client ID.

CREATE PROCEDURE spClientPurchases
    @ClientID INT
AS
BEGIN
    SELECT 
        PurchaseID, 
        PurchaseDate, 
        ItemID, 
        Quantity, 
        TotalPrice 
    FROM 
        PurchasesTable 
    WHERE 
        ClientID = @ClientID
END


20. Write a function **fnStringLength** that returns the length of a given string parameter.

CREATE FUNCTION fnStringLength
    (@InputString NVARCHAR(MAX))
RETURNS INT
AS
BEGIN
    RETURN LEN(@InputString)
END
