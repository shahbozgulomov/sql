lesson 2
 Easy-Level Tasks (10)

--Define and explain DDL and DML. Give two examples of each.
--DDL(data definition language) create,alter 
--DML(data manipulation language) delete,insert

create table employees ( EmpID (INT, PRIMARY KEY), Name (VARCHAR(50)), Salary (DECIMAL(10,2))
Insert into employees values (1,'john',2000)

--Write a query to update the Salary of an employee where EmpID = 1.
UPDATE employees
SET salary = [new_salary]
WHERE EmpID = 1;

--Delete a record from the Employees table where EmpID = 2.
DELETE FROM Employees
WHERE EmpID = 2;

--Explain the difference between DELETE, DROP, and TRUNCATE with examples.
--delete deletes specific rows from table,
--The DROP command is used to delete entire database objects such as tables, views, or databases.
--truncate clear all the rows quicly but table structure remains

--Modify the Name column in the Employees table to VARCHAR(100).
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

--Use the ALTER TABLE statement to add a new column Department (VARCHAR(50)) to the Employees table.
ALTER TABLE Employees
ADD Department VARCHAR(50);

--Use SSMS graphical tools to create a database named CompanyDB. Take a screenshot.

--Describe the purpose of the TRUNCATE TABLE command.
--quickly removes all rows from table
🟠 Medium-Level Tasks (10)
--Create a table Departments with a PRIMARY KEY on DeptID and a FOREIGN KEY referencing Employees.EmpID.
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    EmpID INT,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
--Insert five records into the Departments table using INSERT INTO SELECT from another table.
INSERT INTO Departments (DeptID, DeptName, EmpID)
SELECT DeptID, DeptName, EmpID
FROM OtherTable
WHERE DeptID IN (1, 2, 3, 4, 5);

--Write a query that updates the Department of all employees where Salary > 5000 to 'Management'.
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

--Write a query to remove all records from the Employees table without removing its structure.
TRUNCATE TABLE employees

--Explain the difference between VARCHAR and NVARCHAR when creating tables.
--Use VARCHAR when you are dealing with single-byte character data and want to save storage space.
--Use NVARCHAR when you need to support multiple languages and require Unicode storage.

--Modify an existing column Salary to change its data type to FLOAT.
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

--Drop the column Department from the Employees table using ALTER TABLE.
ALTER TABLE Employees
DROP COLUMN 

--Use SSMS graphical tools to modify the Employees table by adding a new column JoinDate (DATE). Take a screenshot.

--Create a temporary table and insert two records into it.
CREATE TABLE #TempEmployees (
    EmpID INT,
    Name VARCHAR(100),
    Salary FLOAT
INSERT INTO #TempEmployees (EmpID, Name, Salary) VALUES (1, 'Alice', 60000.00);
INSERT INTO #TempEmployees (EmpID, Name, Salary) VALUES (2, 'Bob', 70000.00);

--Write a query to remove the Departments table completely from the database.
drop table departments

--🔴 Hard-Level Tasks (10)
--Write a script that creates a Customers table with a CHECK constraint ensuring Age > 18.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    CHECK (Age > 18)
);

--Write a query to delete all employees who have not received a salary increase in the last two years.
DELETE FROM Employees
WHERE LastSalaryIncreaseDate < DATEADD(YEAR, -2, GETDATE());

--Create a stored procedure that inserts a new employee record into the Employees table.
CREATE PROCEDURE InsertEmployee
    @EmpID INT,
    @Name VARCHAR(100),
    @Salary FLOAT,
    @Department VARCHAR(50),
    @LastSalaryIncreaseDate DATE
AS
BEGIN
    INSERT INTO Employees (EmpID, Name, Salary, Department, LastSalaryIncreaseDate)
    VALUES (@EmpID, @Name, @Salary, @Department, @LastSalaryIncreaseDate);
END;

--Write a query that creates a backup table Employees_Backup with the same structure as Employees.
CREATE TABLE Employees_Backup AS
SELECT *
FROM Employees
WHERE 1 = 0;

--Write a query to insert multiple rows using MERGE INTO from another table.
Drop the CompanyDB database and recreate it using a script.
Use SSMS graphical tools to rename the Employees table to StaffMembers. Take a screenshot.
Explain the difference between CASCADE DELETE and CASCADE UPDATE with an example.
Write a query to reset the IDENTITY column seed of Employees after deleting all records.
Write a query that creates a table with both PRIMARY KEY and UNIQUE constraints on different columns.
