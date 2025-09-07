Create database walmart_db;
use walmart_db;
show tables;
select* from walmart
limit 5;
select distinct payment_method from walmart;
select
payment_method,
count(*) 
from walmart
group by payment_method;
select
count(distinct(branch))
from walmart;
select max(quantity) from walmart;
# buisness problems

#Q1. Find different payment methods and number of transactions, number of quantity sold?
select payment_method,count(*) as no_of_payments,sum(quantity) as no_of_quantity
from walmart
group by payment_method;

#Q2.Identify highest rated category in each branch, displaying the branch and category,Avg_rating
select * 
from(
	select branch,category,avg(rating) as avg_rating,
	rank() over(partition by branch order by avg(rating) desc) as raank
	from walmart
	group by branch , category) t
where raank =1;

#Q3. Identify the busiest day for each branch based on the number of transaction ?
select *
from
	(select branch,
	count(*) as no_of_transc,
	dayname(str_to_date(date,'%d/%m/%y')) as Day_name,
	rank() over (partition by branch order by count(*)desc) as raank
	from walmart
	group by branch, Day_name)t
where raank =1;

#Q4. calculate the total quantity of items sold per payment method.List payment method and total_quantity?
select payment_method,sum(quantity) as no_of_quantity
from walmart
group by payment_method;

#Q5. Determine the average , minimum and maximum rating of products for each city.list the city, average rating,min rating and max_rating ?
select city,
category,
min(rating) as min_rating,
max(rating) as max_rating,
avg(rating) as avg_rating
from walmart
group by city,category;

#Q6. Calculate the total profit for each category by considering total_profit as (unit_price*quantity*profit_margin).
#list category and total_profit ,ordered from highest to lowest profit?
select category,
sum(total) as total_revenue,
sum(total*profit_margin) as profit
from walmart
group by category;

#Q7. Determine the most common payment method for each branch. display branch and each payment_method?
with cte 
as(
	select branch,
	payment_method,
	count(*) as total_transc,
	rank() over(partition by branch order by count(*) desc) as raank
	from walmart
	group  by branch, payment_method)
select * from cte
where raank=1;
desc walmart;

#Q8. categorise sales into three group morning ,afternoon,evening . find out each of the shift and number of invoices?
select branch,
case 
	when Hour(str_to_date(`time`,'%H:%i:%s'))<12 then 'Morning'
    when Hour(str_to_date(`time`,'%H:%i:%s'))  between 12 and 17 then 'Afternoon'
    else 'evening'
    end day_time,
    count(*)
from walmart
group by branch,day_time
order by branch,count(*) ;

#Q9. Identify 5 branch with highest decrease ratio in revenue compared to last year(curr_year 2023,last_year=2022)?
# rev_dec_ratio=(last_rev-cuur_rev/last_rev)*100
with rev_22
as(
	select branch,
	sum(total) as revenue
	from walmart
	where year(str_to_date(date,'%d/%m/%y'))=2022
	group by branch
),
rev_23
 as(
	select branch,
	sum(total) as revenue_23
	from walmart
	where year(str_to_date(date,'%d/%m/%y'))=2023
	group by branch
)
select ls.branch,
ls.revenue as last_year_rev,
cs.revenue_23 as curr_year_rev,
round(((ls.revenue-cs.revenue_23)/ls.revenue)*100)as rdr
from rev_22 as ls
join rev_23 as cs
on ls.branch=cs.branch
where ls.revenue>cs.revenue_23
order by rdr desc
limit 5;