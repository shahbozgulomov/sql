
select * from employees e join departments d on e.DepartmentID = d.DepartmentID 

select * from students s left join classes c on s.ClassID = c.ClassID 

select * from orders o right join customers c on o.CustomerID = c.CustomerID

select * from products p full outer join sales s on p.ProductID = s.ProductID 

select e1.name,e2.name from Employees1 e1 join Employees1 e2 on e2.EmployeeID = e1.ManagerID

select * from colors cross join sizes

select title, name,releaseyear from Movies m join actors a on m.MovieID = a.MovieID and releaseyear > 2015

select * from Orders2 o join customers1 c on o.CustomerID = c.CustomerID join OrderDetails od on o.OrderID = od.OrderID 

select s.ProductID,sum(price) as total_revenue from sales1 s join Products1 p on s.ProductID = p.ProductID group by s.ProductID
