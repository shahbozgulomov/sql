select customer_name,sum(total_amount) from customers c
join orders o
on c.customer_id = o.customer_id
group by customer_name

select a.customer_name from(
           select o.order_id,total_amount,customer_name from orders o
           join customers c
           on o.customer_id = c.customer_id) as a
join 
          (
           select c.customer_name,sum(total_amount) as t_amount from customers c
           join orders o
           on c.customer_id = o.customer_id
           group by c.customer_name) as b
on a.customer_name = b.customer_name and t_amount >(select avg(total_amount) from orders)
