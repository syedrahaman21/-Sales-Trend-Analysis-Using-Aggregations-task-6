use online_sales 
go

create database online_sales
select * from dbo.[Online Sales Data]

-- 1. Monthly Revenue and Order Volume
SELECT 
  YEAR(date) AS order_year,
  datename(month,date) AS order_month,
  SUM(total_revenue) AS total_monthly_revenue,
  COUNT(DISTINCT transaction_id) AS total_monthly_orders
FROM dbo.[Online Sales Data]
GROUP BY YEAR(date), datename(month,date)
ORDER BY YEAR(date),datename(month,date);

-- Monthly Revenue for a Specific Year (2024)
SELECT 
   datename(month,date) AS order_month,
  SUM(total_revenue) AS total_monthly_revenue
FROM dbo.[Online Sales Data]
WHERE YEAR(date) = 2024
GROUP BY  datename(month,date)
ORDER BY SUM(total_revenue);

-- Top 5 Revenue Months
SELECT TOP 5
  YEAR(date) AS order_year,
  datename(month,date) AS order_month,
  SUM(total_revenue) AS total_monthly_revenue
FROM [Online Sales Data]
GROUP BY YEAR(date), datename(month,date)
ORDER BY SUM(total_revenue) DESC;

-- Total Revenue by Product Category
SELECT 
  product_category,
  SUM(total_revenue) AS total_category_revenue
FROM [Online Sales Data]
GROUP BY product_category
ORDER BY total_category_revenue DESC;


-- Monthly Revenue by Product Category
SELECT 
 datename(month,date) AS order_month,
  product_category,
  SUM(total_revenue) AS total_revenue
FROM [Online Sales Data]
GROUP BY datename(month,date), product_category
ORDER BY  order_month, total_revenue DESC;






