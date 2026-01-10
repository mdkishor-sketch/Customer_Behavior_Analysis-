SELECT * FROM "Cust";

select gender, 
       SUM(purchase_amount) as revenue
from "Cust"
group by gender;

select customer_id, 
       purchase_amount
from "Cust"
where discount_applied = 'Yes' and purchase_amount >= (select AVG(purchase_amount)from "Cust");

select item_purchased ,
       round(AVG(review_rating::numeric),2) as "Average Product Rating"
from "Cust"
group by item_purchased
order by AVG(review_rating) desc
limit 5;

select shipping_type,round(AVG(purchase_amount),2)
from "Cust"
where shipping_type in ('Standard','Express')
group by shipping_type;

select subscription_status, 
       count(customer_id) as total_customers, 
	   round(avg(purchase_amount),2) as avg_spend,
	   round(sum(purchase_amount),2) as total_revenue
from "Cust"
group by subscription_status
order by total_revenue,avg_spend desc;

select item_purchased,
       round(100 * sum(case when discount_applied = 'Yes' then 1 else 0 end)/count(*),2) as discount_rate
from "Cust"
group by item_purchased
order by discount_rate desc
limit 5;

with customer_type as (
select customer_id, 
       previous_purchases,
CASE 
    when previous_purchases = 1 then 'New'
	when previous_purchases Between 2 and 10 then 'Returning'
	else 'loyal'
	end as customer_segment
from "Cust"
)

select customer_segment, 
       count(*) as "Number of Customers"
from customer_type
group by customer_segment;


with item_counts as (
select category,
       item_purchased,
	   count(customer_id) as total_orders,
	   row_number() over(partition by category order by count(customer_id)desc) as item_rank
from "Cust"
group by category, item_purchased
)

select item_rank, category,
       item_purchased,
	   total_orders
from item_counts
where item_rank <=3;


select subscription_status,
count(customer_id) as repeat_buyers
from "Cust"
where previous_purchases > 5
group by subscription_status


