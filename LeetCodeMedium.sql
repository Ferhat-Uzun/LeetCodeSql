--1158. Market Analysis I
select u.user_id as buyer_id,
u.join_date,
sum(case
        when o.order_date like '2019%' then 1
        else 0
    end) as orders_in_2019
from Users u
left join Orders o on o.buyer_id=u.user_id
group by u.user_id,u.join_date

--178. Rank Scores
select score,
dense_rank() OVER (order by score desc) as Rank
from Scores

--184. Department Highest Salary
Select d.name as Department,e.name as Employee ,e.salary as Salary
From Employee e
Inner Join Department d on d.id = e.departmentId
Where e.salary=  (Select Max(e.salary) 
        From Employee e 
        where e.departmentId= d.id)

--180. Consecutive Numbers
Select distinct l1.num as ConsecutiveNums
From Logs l1,Logs l2,Logs l3 
Where l1.id = l2.id-1 and l2.id=l3.id-1 and l1.num=l2.num and l2.num=l3.num

--176. Second Highest Salary
SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary

--177. Nth Highest Salary
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
      # Write your MySQL query statement below.
        SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M, 1
  );
END

