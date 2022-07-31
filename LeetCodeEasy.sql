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
