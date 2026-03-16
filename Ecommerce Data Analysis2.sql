
-- E-commerce Analysis using SQL by Christian Kho Aler

-- KPI Total Revenue

SELECT
	SUM(total_amount_php) as total_revenue
    FROM ecommerce;

-- Top 3 Most Sold Product
WITH rank_sold as (
SELECT 
	product_name,
    SUM(quantity) as total_sold,
    DENSE_RANK() OVER(ORDER BY SUM(quantity) DESC) as rnk
    FROM ecommerce
    GROUP BY product_name

   )
SELECT 
	product_name,
	total_sold,
    rnk
    FROM rank_sold 
    WHERE rnk <= 3;
   
-- Total 3 Most profitable product
WITH rank_revenue as (
SELECT 
	product_name,
    SUM(total_amount_php) as total_revenue,
        DENSE_RANK() OVER(ORDER BY SUM(total_amount_php) DESC) as rnk
    FROM ecommerce
    GROUP BY product_name
    
)
SELECT 
	product_name,
	total_revenue,
    rnk
    FROM rank_revenue
    WHERE rnk <= 3;
   

-- Top 3 least profitable products

WITH ranking_least AS (
SELECT 
	product_name,
    SUM(total_amount_php) as total_revenue,
    DENSE_RANK() OVER(ORDER BY SUM(total_amount_php) ASC) as rnk
    FROM ecommerce
    GROUP BY product_name
)

SELECT 
	product_name,
    total_revenue,
    rnk
    FROM ranking_least
    WHERE rnk <= 3;

-- Running total revenue per month (2024)

SELECT 
	YEAR(order_date) as year_date,
	Month(order_date) as month_date,
	SUM(SUM(total_amount_php))
	OVER(PARTITION BY YEAR(order_date) ORDER BY Month(order_date) ASC) as running_total
    FROM ecommerce
    GROUP BY year_date,month_date;

-- Total Revenue/Sold in each product category

SELECT 
	category,
    SUM(quantity) as total_sold,
    SUM(total_amount_php) as total_revenue
    FROM ecommerce
    GROUP BY category
    ORDER BY total_revenue DESC;

-- 3 Most Profitable cities
WITH ranking_city AS (

SELECT 
	customer_city,
    SUM(total_amount_php) as total_revenue,
    RANK() OVER(ORDER BY SUM(total_amount_php) DESC) as rnk
    FROM ecommerce
    GROUP BY customer_city
   

)

SELECT 
	customer_city,
    total_revenue,
    rnk
    FROM ranking_city
    WHERE rnk <= 3
    ORDER BY rnk ASC;
    
-- Payment method breakdown

SELECT
	payment_method,
    COUNT(*) as total
    FROM ecommerce
    GROUP BY payment_method
    ORDER BY total DESC;
    
-- Most profitable month (2024)

SELECT 
	monthname(order_date) as month_date,
    SUM(total_amount_php) as total_revenue
    FROM ecommerce
    GROUP BY month_date
    ORDER BY total_revenue DESC LIMIT 1;
	
  
  -- Monthly revenue ranked (full picture instead of LIMIT 1)
SELECT 
    MONTHNAME(order_date) AS month_date,
    SUM(total_amount_php) AS total_revenue,
    RANK() OVER(ORDER BY SUM(total_amount_php) DESC) AS rnk
FROM ecommerce
GROUP BY month_date;

-- Order volume per city (not just revenue)
SELECT 
    customer_city,
    COUNT(*) AS total_orders,
    SUM(total_amount_php) AS total_revenue
FROM ecommerce
GROUP BY customer_city
ORDER BY total_orders DESC;
