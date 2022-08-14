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