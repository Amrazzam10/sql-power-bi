--kpi's

--total revenue
select sum(total_price) as total_revenue
from [pizza sales]
--Average Order Value
select sum(total_price)/ COUNT(distinct order_id) as avg_odrer_value
from [pizza sales]
-- Total Pizzas Sold
select sum (quantity)  as Total_pizza_sold
from [pizza sales]

--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza sales]
--Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM [pizza sales]
--Daily Trend for Total Orders
select DATENAME(DW,order_date) as order_day, COUNT(distinct order_id)
as total_orders 
from [pizza sales]
group by  DATENAME(DW,order_date)
order by total_orders desc
--Monthly Trend for Orders
select DATENAME(month,order_date) as mounth_name, 
COUNT(DISTINCT order_id) as Total_Orders
from [pizza sales] 
GROUP BY DATENAME(MONTH, order_date)
order by Total_Orders desc
--percentage by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [pizza sales]) AS DECIMAL(10,2)) AS percentage
FROM [pizza sales]
GROUP BY pizza_category
order by total_revenue desc 
--- percentage by Pizza size
select pizza_size, cast( sum(total_price)  as decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/ (select sum(total_price) 
from [pizza sales]) as decimal (10,2)) as percentage
from [pizza sales]
group by pizza_size
order by total_revenue desc
--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM [pizza sales]
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
--top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [pizza sales]
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
-- Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [pizza sales]
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
--Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza sales]
GROUP BY pizza_name
ORDER BY Total_Orders DESC
-- Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza sales]
GROUP BY pizza_name
ORDER BY Total_Orders ASC
-- top 5 pizza by pizza_ingredients
select top 5 pizza_ingredients , sum (order_id)  AS Total_Orders
from [pizza sales]
group by pizza_ingredients 
order by Total_Orders desc