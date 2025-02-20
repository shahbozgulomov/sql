1 select unique_id,name from employees
left join employeeuni
on employees.id = employeeuni.id
2 select product_name,year,price from sales
inner join product 
on sales.product_id = product.product_id
3 select customer_id,count(visit_id) as count_no_trans
from visits 
where visit_id not in (select visit_id from transactions)
group by customer_id
4 select id from weather 
where temperature >(select temperature from weather table
where recorddate=recorddate+1)
5  select d1.machine_id,round(avg(d2.timestamp-d1.timestamp),3 ) as processing_time 
   from
   (select * from activity 
    where activity_type = 'start') d1 join
   (select * from activity
    where activity_type = 'end') d2
    on
d1.machine_id = d2.machine_id
and 
d1.process_id = d2.process_id
   group by d1.machine_id
6 SELECT name,bonus from employee
left join bonus
on employee.empid = bonus.empid
where bonus < 1000 or bonus is null
7 SELECT
    S.student_id
    ,S.student_name
    ,Su.subject_name
    ,COUNT(E.student_id) attended_exams
FROM Students S
CROSS JOIN Subjects SU
LEFT JOIN Examinations E
    ON S.student_id = E.student_id
    AND SU.subject_name = E.subject_name

GROUP BY S.student_id, S.student_name, SU.subject_name
ORDER BY S.student_id, S.student_name, SU.subject_name
8 select d2.name
from employee d2
join 
(select managerid,count(*) as directreports
 from employee
 group by managerid
having count(*) >= 5) d1
on d2.id = d1.managerid 
