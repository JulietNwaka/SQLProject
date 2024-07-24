-- select all field of this data set
SELECT *FROM store

--Top-Selling Products based on quantity sold.
SELECT  Product_Name , SUM(quantity) as total_quantity
FROM store
GROUP BY  Product_Name 
ORDER BY total_quantity DESC
LIMIT 10;

-- second script is on sql server
SELECT TOP 10 Product_Name, SUM(quantity) as total_quantity
FROM store
GROUP BY  Product_Name 
ORDER BY total_quantity DESC;

-- Least selling products based on quantity sold.
SELECT Product_Name , SUM(quantity) as total_quantity
FROM store
GROUP BY  Product_Name 
ORDER BY total_quantity ASC
LIMIT 10


-- Customer Purchase Frequency: This is to check how often customers make purchase
SELECT Customer_Name, COUNT(order_id) as total_order
FROM store
GROUP BY Customer_Name
ORDER BY total_order DESC;

-- Sales trend analysis to identify peak period on montly basis
-- postgresql
SELECT to_char(Order_Date, 'Month') AS months, 
SUM(sales * quantity) AS total_sale_month
FROM store
GROUP BY 1
ORDER BY 1; 

-- second script is on mysql server
SELECT MONTHNAME(payment_date) as Months FROM store
GROUP BY 1
ORDER BY 1; 

-- Customer Demographic to explore sales by customer location
SELECT Region, SUM(Sales * Quantity) AS Total_sales
FROM store
GROUP BY Region
ORDER BY 1 DESC;

-- Total numbers of Customer
select COUNT(DISTINCT Customer_Name)  AS Total_Customers
FROM store

-- Calculate the total revenue made in 2021
 
 -- postgresql
 SELECT EXTRACT(YEAR FROM Order_date) AS Year2021, SUM(Sales * Quantity) AS Total_Rev_2021 
FROM payment
WHERE EXTRACT(YEAR FROM Order_date) = 2021
GROUP BY 1

 -- mysql server
SELECT YEAR(Order_Date) AS Year2021, SUM(Sales * Quantity) AS Total_Rev_2021 
FROM store
WHERE YEAR(Order_Date) = 2021
GROUP BY 1	

	-- Calculation of total revenue at all locations
SELECT SUM(Sales * Quantity) AS  Total_Sales
FROM store

