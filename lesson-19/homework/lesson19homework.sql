--# SQL Homework Tasks: Window Functions and Ranking

--This document contains SQL homework tasks focusing on window functions (such as ROW_NUMBER, RANK, DENSE_RANK, NTILE, LEAD, and LAG) and cumulative calculations. The tasks are divided into three difficulty levels: **Easy**, **Medium**, and **Difficult**.

---
drop table sales
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    productcategory VARCHAR(10),
    sale_month DATE,
    salesamount INT
);
INSERT INTO Sales (sale_id, productcategory, sale_month, salesamount) VALUES
(1, 'A', '2024-01-01', 100),
(2, 'A', '2024-02-01', 150),
(3, 'B', '2024-01-01', 200),
(4, 'B', '2024-02-01', 100),
(5, 'B', '2024-03-01', 300),
(6, 'C', '2024-02-01', 50),
(7, 'C', '2024-03-01', 100),
(8, 'A', '2024-03-01', 200),
(9, 'C', '2024-01-01', 75),
(10, 'A', '2024-04-01', 150);

Select * from Sales;



CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary) VALUES
(1, 'John', 'HR', 4000),
(2, 'Jane', 'HR', 4500),
(3, 'Mike', 'IT', 5500),
(4, 'Sara', 'IT', 6000),
(5, 'Tom', 'Sales', 3000),
(6, 'Lily', 'Sales', 3200),
(7, 'Bob', 'IT', 5000),
(8, 'Alice', 'HR', 4700);

CREATE TABLE products ( id INT PRIMARY KEY, product_name VARCHAR(100), price DECIMAL(10, 2), category_id INT );

INSERT INTO products (id, product_name, price, category_id) 
VALUES (1, 'Tablet', 400, 1), (2, 'Laptop', 1500, 1), (3, 'Headphones', 200, 2), (4, 'Speakers', 300, 2);

Select * from products

drop table orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    orderAmount DECIMAL(10,2)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, orderAmount)
VALUES
(1, 101, '2024-03-01', 150),
(2, 101, '2024-03-05', 120),
(3, 101, '2024-03-10', 600),
(4, 101, '2024-03-15', 650), 
(5, 101, '2024-03-20', 700),
(6, 102, '2024-03-02', 200),
(7, 102, '2024-03-06', 250),
(8, 102, '2024-03-11', 800),
(9, 103, '2024-03-05', 90),
(10, 103, '2024-03-10', 100),
(11, 103, '2024-03-15', 110);



--Select 
	--*,
	--ROW_NUMBER() over(partition by Department order by salary desc)	as Ranking
--from
	--Employees


Select * from Employees



--## Easy Tasks (20)

--1. Write a query to assign a row number to each employee in the **Employees** table ordered by their Salary.

select *,
         row_number () over (order by salary) as ranking
from 
     employees


--2. Create a query to rank all products based on their Price in descending order.
select *,
        rank() over(order by price desc) as ranking
from
    products

--3. Use the **DENSE_RANK()** function to rank employees by Salary in the **Employees** table.
select *,
       dense_rank() over (order by salary) as ranking
from employees

--4. Write a query to display the next (lead) salary for each employee in the same department using the **LEAD()** function.

select *,
       lead(salary) over(partition by department order by salary )
	from employees


--5. Use **ROW_NUMBER()** to assign a unique number to each order in the **Orders** table.
select *, 
       row_number() over (order by orderdate)
	   from orders

--6. Create a query using **RANK()** to identify the highest and second-highest salaries in the **Employees** table.
select top 2 *,
         rank() over (order by salary desc) top_ranked
		 from employees

--7. Write a query to show the previous (lagged) salary for each employee in the **Employees** table using the **LAG()** function.

select *,
        lag(salary) over(order by salary) as lagged_salary
		from employees

--8. Use **NTILE(4)** to divide employees into 4 groups based on their Salary.

select *, 
ntile(4) over (order by salary) as groupped
from employees

--9. Write a query to partition employees by **DepartmentID** and assign a row number within each department.

select * ,
row_number() over(partition by department order by salary)
from employees


--10. Use **DENSE_RANK()** to rank products by Price in ascending order.

select * ,
dense_rank() over (order by price asc)
from products

--11. Write a query to calculate the moving average of Price in the **Products** table using window functions.

select*, 
avg(price)over(order by price)
from products

--12. Use the **LEAD()** function to display the salary of the next employee for each row in the **Employees** table.

select * ,
lead(salary) over(order by salary)
from employees


--13. Create a query to compute the cumulative sum of **SalesAmount** in the **Sales** table.

select*,
sum(salesamount) over(order by sale_id)
from sales

--14. Use **ROW_NUMBER()** to identify the top 5 most expensive products in the **Products** table.

select top 5 *,
row_number() over (order by price)
from products

--15. Write a query to partition the **Orders** table by **CustomerID** and calculate the total **OrderAmount** per customer.

select *,
sum(orderamount) over (partition by customerid order by customerid)
from orders

--16. Use **RANK()** to rank orders in the **Orders** table based on their **OrderAmount**.

select *,
rank() over(order by orderamount)
from orders

--17. Write a query to compute the percentage contribution of **SalesAmount** by **ProductCategory** in the **Sales** table.
Select * from Sales;
select *,
salesamount*100/sum(salesamount) over(partition by productcategory order by productcategory)
from sales

--18. Use the **LEAD()** function to retrieve the next order date for each order in the **Orders** table.
select *,
lead(orderdate) over (order by orderdate)
from orders


--19. Write a query using **NTILE(3)** to divide employees into 3 groups based on their Age.

select*,
ntile(3) over(order by age)
from employees

20. Use **ROW_NUMBER()** to list the most recently hired employees from the **Employees** table.

select * ,
row_number() over(order by hiredate desc)
from employees

---

## Medium Tasks (20)

--1. Write a query to compute the cumulative average salary of employees, ordered by Salary.

select *,
avg(salary) over(order by salary)
from employees

--2. Use **RANK()** to rank products by their total sales while handling ties appropriately.

select *,
rank() over (order by totalsale)
from products

--3. Create a query to retrieve the previous order's date for each order in the **Orders** table using the **LAG()** function.

select *,
lag(orderdate) over (order by orderdate)
from orders

--4. Write a query to calculate the moving sum of Price for products with a window frame of 3 rows.

select *,
sum(price) over(order by price ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
from products

--5. Use **NTILE(4)** to assign employees to four salary ranges and display each employee's salary range.

select *,
ntile(4) over (order by salary) salaryrange
from employees

--6. Write a query to partition the **Sales** table by **ProductID** and calculate the total **SalesAmount** per product.
select *,
sum(salesamount) over (partition by productid )
from sales

--7. Use **DENSE_RANK()** to rank products by **StockQuantity** without gaps in the ranking.
select * ,
dense_rank() over (order by stockquantity)
from products

--8. Create a query using **ROW_NUMBER()** to identify the second highest salary in each department.
with cte as (
select  *,
row_number() over (partition by department order by salary desc) as rn
from employees ) 
select * from cte 
where rn = 2

--9. Write a query to calculate the running total of sales for each product in the **Sales** table.

select *,
sum(salesamount) over(partition by productcategory order by sale_month )
from sales

--10. Use **LEAD()** to display the **SalesAmount** of the next row for each employee’s sale in the **Sales** table.

select *,
lead(salesamount) over (partition by employeeid order by sale_month)
from sales;

--11. Use **RANK()** to determine the highest earners within each department.
with cte as (
select *,
rank() over(partition by department order by salary )as rn
from employees ) 
select * from cte
where rn = 1

--12. Write a query to partition employees by **DepartmentID** and rank them by salary.

select * ,
rank() over (partition by departmentid order by salary)
from employees

--13. Use **NTILE(5)** to divide products into five groups based on their Price.

select *,
ntile(5) over (order by price)
from products

--14. Write a query to calculate the difference between each employee's salary and the highest salary in their department.

select  *,
salary - max(salary) over (partition by department) as salarydiffirence
from employees

--15. Use **LAG()** to display the previous product's **SalesAmount** for each sale.

select *,
lag(salesamount) over (partition by productcategory order by sale_month)
from sales

--16. Write a query to calculate the cumulative sum of **OrderAmount** for each customer in the **Orders** table.

select *,
sum(orderamount) over (partition  by customerid order by orderdate )
from orders;


--17. Use **ROW_NUMBER()** to identify the 3rd most recent order for each customer in the **Orders** table.
with cte as (
select *,
row_number() over (partition by customerid order by orderdate desc) as ordernumber
from Orders )
select * from cte
ordernumber = 3

18. Write a query to partition employees by **DepartmentID** and rank them by their HireDate within each department.

select * ,
rank() over(partition by departmentid order by hiredate)
from Employees;

--19. Use **DENSE_RANK()** to find the 3rd highest Salary in each department from the **Employees** table.
with cte as
(
select *,
dense_rank() over (partition by department order by salary desc) as rn
from Employees)
select * from cte
where rn = 3
20. Create a query using **LEAD()** to calculate the difference in **OrderDate** between consecutive orders.
SELECT 
    *,
    LEAD(OrderDate) OVER (
        ORDER BY OrderDate
    ) AS NextOrderDate,
    DATEDIFF(day,
        LEAD(OrderDate) OVER (ORDER BY OrderDate), 
        OrderDate
    ) AS DaysBetweenOrders
FROM Orders;

---

--## Difficult Tasks (20)

1. Write a query using **RANK()** to rank products by their sales (handling ties) but exclude the top 10% of products by sales.
2. Use **ROW_NUMBER()** to list employees with over 5 years of service, ordered by their HireDate.
3. Write a query using **NTILE(10)** to divide employees into 10 groups based on Salary and display each employee's group number.
4. Use the **LEAD()** function to calculate the next **SalesAmount** for each sale by an employee and compare it with the current sale.
5. Write a query to partition products by **CategoryID** and compute the average Price for each category.
6. Use **RANK()** to determine the top 3 most-sold products and display their rankings, including handling ties.
7. Create a query using **ROW_NUMBER()** to list the top 5 highest-paid employees from each department.
8. Write a query to compute the moving average of sales over a 5-day window using both **LEAD()** and **LAG()** functions.
9. Use **DENSE_RANK()** to find the products with the top 5 highest sales figures, ensuring no gaps in the ranking.
10. Write a query using **NTILE(4)** to partition orders by **OrderAmount** into four quartiles and display the quartile for each order.
11. Use **ROW_NUMBER()** to assign a unique sequence to each order in the **Orders** table and display the rank within each **CustomerID**.
12. Write a query to partition employees by **DepartmentID** and calculate the total number of employees in each department.
13. Use **RANK()** to list the top 3 highest salaries and the bottom 3 salaries within each department.
14. Create a query using **LAG()** to calculate the percentage change in **SalesAmount** from the previous sale for each employee.
15. Write a query to compute both the cumulative sum and cumulative average of sales for each product in the **Sales** table.
16. Use **NTILE(3)** to rank employees by Age and display the distribution of age groups across the company.
17. Write a query using **ROW_NUMBER()** to identify the top 10 employees with the highest sales, sorted by **SalesAmount**.
18. Use **LEAD()** to calculate the difference between each product's Price and the Price of the subsequent product in the **Products** table.
19. Create a query using **DENSE_RANK()** to rank employees based on a performance score and generate a performance report.
20. Write a query using both **LAG()** and **LEAD()** to determine the difference in **SalesAmount** for each product relative to the previous and next orders in the **Orders** table.

