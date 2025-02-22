select customer_name,sum(total_amount) from customers c
join orders o
on c.customer_id = o.customer_id
group by customer_name

select customer_name,sum(total_amount) as total_spent from customers c
join orders o
on c.customer_id = o.customer_id 
group by customer_name
having total_spent>(select avg(total_amount) from orders)
