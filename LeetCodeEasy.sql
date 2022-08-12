-- 1757. Recyclable and Low Fat Products
SELECT product_id  
FROM Products
WHERE low_fats ='Y' AND recyclable = 'Y'

--1741. Find Total Time Spent by Each Employee
SELECT event_day day , emp_id, sum(out_time - in_time) as total_time
from Employees
group by emp_id,event_day

--1693. Daily Leads and Partners
SELECT date_id,make_name, 
count(distinct lead_id) unique_leads,
count(distinct partner_id) unique_partners  
FROM DailySales
group by date_id,make_name
order by date_id

--1795. Rearrange Products Table 
select product_id, 'store1' as store, store1 as price
from Products
where store1 is not null 

union

select product_id, 'store2' as store, store2 as price
from Products
where store2 is not null 

union

select product_id, 'store3' as store, store3 as price
from Products
where store3 is not null 

--1587. Bank Account Summary II
select u.name,sum(t.amount) as balance
from  Users u
join Transactions t on t.account = u.account
group by u.name    
having sum(t.amount) > 10000

--1581. Customer Who Visited but Did Not Make Any Transactions
SELECT v.customer_id ,count(v.customer_id) as count_no_trans 
FROM Transactions t
RIGHT JOIN Visits v ON v.visit_id =t.visit_id
where t.transaction_id is null
group by v.customer_id 

--1484. Group Sold Products By The Date
select sell_date,
count(distinct product) as num_sold,
STRING_AGG(product,',') WITHIN group (order by product ) as products
from (select sell_date,product from Activities group by sell_date,product)a
group by sell_date

--1179. Reformat Department Table
select id,
sum(Case when month='Jan' then revenue end) as Jan_Revenue,
sum(Case when month='Feb' then revenue end) as Feb_Revenue,
sum(Case when month='Mar' then revenue end) as Mar_Revenue,
sum(case when month='Apr' then revenue end ) as Apr_Revenue,
sum(case when month='May' then revenue end ) as May_Revenue,
sum(case when month='Jun' then revenue end ) as Jun_Revenue,
sum(case when month='Jul' then revenue end ) as Jul_Revenue,
sum(case when month='Aug' then revenue end ) as Aug_Revenue,
sum(case when month='Sep' then revenue end ) as Sep_Revenue,
sum(case when month='Oct' then revenue end ) as Oct_Revenue,
sum(case when month='Nov' then revenue end ) as Nov_Revenue,
sum(case when month='Dec' then revenue end ) as Dec_Revenue

from Department
group by id
order by id


--1890. The Latest Login in 2020    
select user_id,max(time_stamp) as last_stamp
from Logins
where time_stamp>='2020-01-01' and time_stamp<'2021-01-01'
group by user_id

--627. Swap Salary
update Salary 
set sex = Case
            when sex='f' then 'm'
            else 'f'
          End 

--1965. Employees With Missing Information
select employee_id 
from employees 
where employee_id not in (select employee_id from salaries)

union

select employee_id 
from salaries
where employee_id not in (select employee_id from employees)
order by employee_id

--511. Game Play Analysis I
select player_id,min(event_date) first_login
from Activity
group by player_id

--584. Find Customer Referee
select name 
from Customer
where referee_id  != 2 or referee_id is null

--1148. Article Views I
select distinct  author_id as id 
from Views
where author_id = viewer_id
order by author_id

 --595. Big Countries
 select name,population,area
from World 
where area>=3000000 or population>=25000000

--1407. Top Travellers
select u.name,
(case
    when sum(r.distance) is null then 0
    else sum(r.distance)
end) as travelled_distance 
from Users u
left join Rides r on r.user_id = u.id
group by u.id,u.name
order by travelled_distance desc , u.name asc

--586. Customer Placing the Largest Number of Orders
select TOP 1 customer_number
from Orders
group by customer_number
order by count(order_number) desc

--620. Not Boring Movies
select *
from Cinema
where id%2=1 and description not like 'boring'
order by rating desc

--1050. Actors and Directors Who Cooperated At Least Three Times
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(*) > 2

--1729. Find Followers Count
select user_id,count(follower_id) as followers_count
from Followers
group by user_id

--607. Sales Person
select name 
from salesperson
where salesperson.sales_id not in 
     (select sales_id
      from orders
      inner join company on orders.com_id=company.com_id
      where company.name='RED')       

--1873. Calculate Special Bonus
select employee_id,
case
    when  name not like 'M%' and employee_id%2=1 then salary
    else 0
End as bonus
from Employees
order by employee_id

--183. Customers Who Never Order
select name as Customers
from Customers
left join Orders on Orders.customerId= Customers.id
where Orders.id is null

--1667. Fix Names in a Table
select user_id,
concat(Upper(Substring(name,1,1)),
       Lower(Substring(name,2,len(name)-1))) as name
from Users
order by user_id

--196. Delete Duplicate Emails
delete from Person
where Person.Id not in 
((
    select top 1 p.Id 
    from Person p
    where p.Email = Person.Email 
    order by Id asc
));