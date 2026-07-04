-- ======================================
-- Retail & E-Commerce Business Analytics
-- SQL Business Analysis
-- ======================================

USE ecommerce_analysis;

SELECT *
FROM master_dataset
LIMIT 10;

-- ========================================
-- Business Question 1 
-- How many total orders were placed?
-- ========================================
SELECT COUNT(distinct order_id) AS Total_orders
FROM master_dataset;

-- ========================================
-- Business Question 2
-- How much total revenue was generated?
-- ========================================
SELECT
ROUND(SUM(price),2) AS Total_Revenue
FROM master_dataset;

-- ========================================
-- Business Question 3
-- How many unique customers made purchases?
-- ========================================
SELECT
COUNT(DISTINCT customer_unique_id) AS Total_Customers
FROM master_dataset;

-- ========================================
-- Business Question 4
-- How many sellers are registered?
-- ========================================
SELECT
COUNT(DISTINCT seller_id) AS Total_Sellers
FROM master_dataset;

-- ========================================
-- Business Question 5
-- What is the Average Order Value?
-- ========================================
SELECT
ROUND(
SUM(price)
/ COUNT(DISTINCT order_id),
2
) AS Average_Order_Value
FROM master_dataset;

-- ======================================
-- Business Question 6
-- What is the monthly revenue trend?
-- ======================================
SELECT
YEAR(order_purchase_timestamp) AS Year,
MONTH(order_purchase_timestamp) AS Month,
ROUND(SUM(price), 2) AS Revenue
FROM master_dataset
GROUP BY
YEAR(order_purchase_timestamp),
MONTH(order_purchase_timestamp)
ORDER BY
Year,
Month;

-- ======================================
-- Business Question 7
-- Which month generated the highest revenue?
-- ======================================
SELECT
YEAR(order_purchase_timestamp) AS Year,
MONTH(order_purchase_timestamp) AS Month,
ROUND(SUM(price), 2) AS Revenue
FROM master_dataset
GROUP BY
YEAR(order_purchase_timestamp),
MONTH(order_purchase_timestamp)
ORDER BY Revenue DESC
LIMIT 10;

-- ======================================
-- Business Question 8
-- Which year generated the highest revenue?
-- ======================================
SELECT
YEAR(order_purchase_timestamp) AS Year,
ROUND(SUM(price), 2) AS Revenue
FROM master_dataset
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY Revenue DESC;

-- ======================================
-- Business Question 9
-- How many orders were placed each month?
-- ======================================
SELECT
YEAR(order_purchase_timestamp) AS Year,
MONTH(order_purchase_timestamp) AS Month,
COUNT(DISTINCT order_id) AS Total_Orders
FROM master_dataset
GROUP BY
YEAR(order_purchase_timestamp),
MONTH(order_purchase_timestamp)
ORDER BY
Year,
Month;

-- ======================================
-- Product Analysis
-- ======================================
-- Business Question 10
-- Which product categories generated the highest revenue?
-- ======================================
SELECT
product_category_name_english,
ROUND(SUM(price),2) AS Revenue
FROM master_dataset
GROUP BY product_category_name_english
ORDER BY Revenue DESC
LIMIT 10;

-- ======================================
-- Business Question 11
-- Which product categories generated the lowest revenue?
-- ======================================
SELECT
product_category_name_english,
ROUND(SUM(price),2) AS Revenue
FROM master_dataset
GROUP BY product_category_name_english
ORDER BY Revenue ASC
LIMIT 10;

-- ======================================
-- Business Question 12
-- Which product categories received the highest number of orders?
-- ======================================
SELECT
product_category_name_english,
COUNT(DISTINCT order_id) AS Total_Orders
FROM master_dataset
GROUP BY product_category_name_english
ORDER BY Total_Orders DESC
LIMIT 10;

-- ======================================
-- Business Question 13
-- Which are the top 10 most expensive products?
-- ======================================
SELECT
product_id,
price
FROM master_dataset
ORDER BY price DESC
LIMIT 10;

-- ======================================
-- Business Question 14
-- What is the average product price by category?
-- ======================================
SELECT
product_category_name_english,
ROUND(AVG(price),2) AS Average_Price
FROM master_dataset
GROUP BY product_category_name_english
ORDER BY Average_Price DESC;

-- ======================================
-- Customer Analysis
-- ======================================
-- Business Question 15
-- Which states have the highest number of customers?
-- ======================================
SELECT
customer_state,
COUNT(DISTINCT customer_unique_id) AS Total_Customers
FROM master_dataset
GROUP BY customer_state
ORDER BY Total_Customers DESC;

-- ======================================
-- Business Question 16
-- Which cities have the highest number of customers?
-- ======================================
SELECT
customer_city,
COUNT(DISTINCT customer_unique_id) AS Total_Customers
FROM master_dataset
GROUP BY customer_city
ORDER BY Total_Customers DESC
LIMIT 10;


-- ======================================
-- Business Question 17
-- Which states generated the highest revenue?
-- ======================================
SELECT
customer_state,
ROUND(SUM(price),2) AS Revenue
FROM master_dataset
GROUP BY customer_state
ORDER BY Revenue DESC;

-- ======================================
-- Business Question 18
-- How many repeat customers are there?
-- ======================================
SELECT
customer_unique_id,
COUNT(DISTINCT order_id) AS Total_Orders
FROM master_dataset
GROUP BY customer_unique_id
HAVING Total_Orders > 1
ORDER BY Total_Orders DESC;

-- ======================================
-- Payment Analysis
-- ======================================
-- Business Question 19
-- Which payment methods are most commonly used?
-- ======================================
SELECT
payment_type,
COUNT(*) AS Total_Payments
FROM master_dataset
GROUP BY payment_type
ORDER BY Total_Payments DESC;

-- ======================================
-- Business Question 20
-- What is the total payment received by each payment method?
-- ======================================
SELECT
payment_type,
ROUND(SUM(payment_value),2) AS Total_Payment
FROM master_dataset
GROUP BY payment_type
ORDER BY Total_Payment DESC;

-- ======================================
-- Business Question 21
-- What is the average payment amount for each payment method?
-- ======================================
SELECT
payment_type,
ROUND(AVG(payment_value),2) AS Average_Payment
FROM master_dataset
GROUP BY payment_type
ORDER BY Average_Payment DESC;

-- ======================================
-- Business Question 22
-- What is the average number of payment installments?
-- ======================================
SELECT
ROUND(AVG(payment_installments),2) AS Average_Installments
FROM master_dataset;

-- ======================================
-- Seller Analysis
-- ======================================
-- Business Question 23
-- Which sellers generated the highest revenue?
-- ======================================
SELECT
seller_id,
ROUND(SUM(price),2) AS Revenue
FROM master_dataset
GROUP BY seller_id
ORDER BY Revenue DESC
LIMIT 10;

-- ======================================
-- Business Question 24
-- Which sellers handled the highest number of orders?
-- ======================================
SELECT
seller_id,
COUNT(DISTINCT order_id) AS Total_Orders
FROM master_dataset
GROUP BY seller_id
ORDER BY Total_Orders DESC
LIMIT 10;

-- ======================================
-- Business Question 25
-- Which states have the highest number of sellers?
-- ======================================
SELECT
seller_state,
COUNT(DISTINCT seller_id) AS Total_Sellers
FROM master_dataset
GROUP BY seller_state
ORDER BY Total_Sellers DESC;

-- ======================================
-- Delivery Analysis
-- ======================================
-- Business Question 26
-- What is the average delivery time?
-- ======================================
SELECT
ROUND(AVG(delivery_time_days),2) AS Average_Delivery_Time
FROM master_dataset;

-- ======================================
-- Business Question 27
-- How many delayed deliveries occurred?
-- ======================================
SELECT
COUNT(*) AS Delayed_Deliveries
FROM master_dataset
WHERE delivery_delay_days > 0;

-- ======================================
-- Business Question 28
-- Which states have the longest average delivery time?
-- ======================================
SELECT
customer_state,
ROUND(AVG(delivery_time_days),2) AS Avg_Delivery_Time
FROM master_dataset
GROUP BY customer_state
ORDER BY Avg_Delivery_Time DESC;

-- ======================================
-- Review Analysis
-- ======================================
-- Business Question 29
-- What is the average review score?
-- ======================================
SELECT
ROUND(AVG(review_score),2) AS Average_Review_Score
FROM master_dataset;

-- ======================================
-- Business Question 30
-- How many reviews were received for each rating?
-- ======================================
SELECT
review_score,
COUNT(*) AS Total_Reviews
FROM master_dataset
GROUP BY review_score
ORDER BY review_score;

-- ======================================
-- Business Question 31
-- Which review score is most common?
-- ======================================
SELECT
review_score,
COUNT(*) AS Total_Reviews
FROM master_dataset
GROUP BY review_score
ORDER BY Total_Reviews DESC
LIMIT 1;

-- ======================================
-- Business Question 32
-- Which payment method generated the highest revenue?
-- ======================================
SELECT
payment_type,
ROUND(SUM(payment_value),2) AS Revenue
FROM master_dataset
GROUP BY payment_type
ORDER BY Revenue DESC;

