📦 Brazilian E-Commerce (Olist) – SQL Project Tools used: PostgreSQL + pgAdmin Dataset: Olist E-commerce Public Dataset Tables used so far: orders, order_items, customers, products, sellers, product_category_name_translation, order_payments, order_reviews
🗂️ PART 1 – Orders Table Analysis
✅ Q1: Total Number of Orders
SELECT COUNT(*) AS total_orders
FROM orders;

✅ Q2: Number of Delivered and Canceled Orders
SELECT order_status, COUNT(*) AS total_orders 
FROM orders
WHERE order_status IN ('delivered', 'canceled')
GROUP BY order_status;

✅ Q3: Orders Per Month
SELECT EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

✅ Q4: Orders Per Year-Month
SELECT EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
       EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY year, month
ORDER BY year, month;

✅ Q5: Delivery Time (in Days)
SELECT order_id,
       order_delivered_customer_date - order_purchase_timestamp AS delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

🗂️ PART 2 – Order Items Table Analysis
✅ Q1: Total Items per Order
SELECT order_id,
       COUNT(*) AS total_items
FROM order_items
GROUP BY order_id
ORDER BY order_id;

✅ Q2: Total Revenue per Order
SELECT order_id,
       SUM(price) AS total_revenue
FROM order_items
GROUP BY order_id
ORDER BY order_id;

✅ Q3: Average Freight Value per Order
SELECT order_id,
       ROUND(AVG(freight_value), 2) AS avg_freight_value
FROM order_items
GROUP BY order_id
ORDER BY order_id;

✅ Q4: Top 10 Orders by Total Revenue
SELECT order_id,
       SUM(price) AS total_revenue 
FROM order_items 
GROUP BY order_id
ORDER BY total_revenue DESC
LIMIT 10;

✅ Q5: Top 10 Orders by Highest Freight Value
SELECT order_id,
       MAX(freight_value) AS highest_freight 
FROM order_items
GROUP BY order_id
ORDER BY highest_freight DESC
LIMIT 10;

✅ Q6: Top 10 Products by Average Revenue Per Item
SELECT product_id,
       ROUND(AVG(price), 2) AS avg_revenue_per_item 
FROM order_items 
GROUP BY product_id
ORDER BY avg_revenue_per_item DESC
LIMIT 10;

✅ Q7: Revenue vs Freight Comparison per Order
SELECT order_id, 
       SUM(price) AS total_revenue,
       SUM(freight_value) AS total_freight
FROM order_items
GROUP BY order_id
ORDER BY order_id, total_revenue, total_freight;

🗂️ PART 3 – Customers Table Analysis
✅ Q1: Total Customers
SELECT COUNT(*) AS total_customers 
FROM customers;

✅ Q2: Unique Customers
SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers 
FROM customers;

✅ Q3: Customers per State
SELECT customer_state, COUNT(*) AS customers_per_state 
FROM customers
GROUP BY customer_state;

✅ Q4: Top 10 Cities by Number of Customers
SELECT customer_city, COUNT(*) AS total_customers 
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

🗂️ PART 4 – Products Table Analysis
✅ Q1: Total Number of Products
SELECT COUNT(*) AS total_products
FROM products;

✅ Q2: All Product Categories
SELECT DISTINCT product_category_name
FROM products;

✅ Q3: Top 10 Product Categories by Count
SELECT DISTINCT product_category_name, COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC
LIMIT 10;

✅ Q4: Average Dimensions of Products
SELECT 
ROUND(AVG(product_length_cm), 2) AS avg_length,
ROUND(AVG(product_height_cm), 2) AS avg_height,
ROUND(AVG(product_width_cm), 2) AS avg_width
FROM products;

🗂️ PART 5 – Sellers Table Analysis
✅ Q1: Total Sellers
SELECT COUNT(*) AS total_sellers 
FROM sellers;

✅ Q2: Unique Zip Code Prefixes
SELECT COUNT(DISTINCT seller_zip_code_prefix) AS unique_zip_code 
FROM sellers;

✅ Q3: Sellers per State
SELECT seller_state, COUNT(seller_state) AS seller_per_state 
FROM sellers
GROUP BY seller_state;

✅ Q4: Top 10 Cities by Number of Sellers
SELECT seller_city, COUNT(seller_city) AS seller_per_city
FROM sellers
GROUP BY seller_city
ORDER BY seller_per_city DESC
LIMIT 10;

✅ Q5: Sellers per Zip Code Prefix
SELECT seller_zip_code_prefix, COUNT(*) AS total_sellers 
FROM sellers
GROUP BY seller_zip_code_prefix
ORDER BY total_sellers DESC;

🗂️ PART 6 – Payments & Reviews Analysis
✅ Q1: Total Payment Records
SELECT COUNT(*) AS total_payment_records
FROM order_payments;

✅ Q2: Number of Payments by Type
SELECT payment_type, COUNT(*) AS no_of_payment
FROM order_payments
GROUP BY payment_type;

✅ Q3: Total Amount by Payment Type
SELECT payment_type, ROUND(SUM(payment_value), 2) AS total_amount
FROM order_payments
GROUP BY payment_type
ORDER BY total_amount DESC;

✅ Q4: Average Installments per Payment Type
SELECT payment_type, ROUND(AVG(payment_installments), 2) AS avg_installments
FROM order_payments
GROUP BY payment_type
ORDER BY avg_installments DESC;

✅ Q5: Total Reviews
SELECT COUNT(*) AS total_reviews
FROM order_reviews;

✅ Q6: Number of Reviews by Score
SELECT review_score, COUNT(*) AS review_count
FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC;

✅ Q7: Average Review Score
SELECT ROUND(AVG(review_score), 2) AS avg_review_score
FROM order_reviews;

✅ Q8: Top 10 Longest Customer Comments
SELECT review_id, LENGTH(review_comment_message) AS comment_length
FROM order_reviews
WHERE review_comment_message IS NOT NULL
ORDER BY comment_length DESC
LIMIT 10;

🗂️ PART 7 – Join Analysis
✅ Q1: Top 10 States with Most Delivered Orders
SELECT c.customer_state, COUNT(*) AS delivered_orders
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY delivered_orders DESC
LIMIT 10;

✅ Q2: Top 10 Product Categories by Revenue
SELECT p.product_category_name, SUM(price) AS total_revenue
FROM order_items oi
INNER JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

✅ Q3: Top 10 Product Categories by Number of Reviews
SELECT p.product_category_name, COUNT(*) AS total_reviews
FROM order_reviews ors
INNER JOIN order_items oi ON ors.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_reviews DESC
LIMIT 10;


✅ Q4: Average Delivery Days per Product Category
SELECT
p.product_category_name, 
ROUND(AVG(EXTRACT(DAY FROM order_delivered_customer_date - order_purchase_timestamp)), 2) AS avg_delivery_days
FROM orders o
INNER JOIN order_items os ON o.order_id = os.order_id
INNER JOIN products p ON p.product_id = os.product_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY p.product_category_name
ORDER BY avg_delivery_days DESC;





















Olist eCommerce SQL Portfolio Project Summary
📦 Table Explorations
orders
Total orders, status distribution, top delivered/canceled states


Delivery time calculation


Order frequency analysis


order_items
Highest revenue orders, freight costs, and average revenue per item


Price vs freight cost comparison


customers
Total vs unique customers


Distribution by state and top cities


products
Product category count


Top categories by number of products


Average dimensions (length, width, height)


sellers
Total sellers


Seller distribution by city/state/zipcode


product_category_name_translation
Verified total translated categories


order_payments
Payment type usage


Total payment value by method


Average installments per payment type


order_reviews
Total reviews


Review score distribution


Average review score


Longest customer review comments


🔄 Join Queries & Business Insights
Delivered Orders by Customer State


SELECT c.customer_state, COUNT(*) AS delivered_orders
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY delivered_orders DESC
LIMIT 10;

Top 10 Categories by Revenue


SELECT p.product_category_name, SUM(price) AS total_revenue
FROM order_items oi
INNER JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;

Top 10 Categories by Number of Review


SELECT product_category_name, COUNT(*) AS total_reviews
FROM order_reviews ors
INNER JOIN order_items oi ON oi.order_id = ors.order_id
INNER JOIN products p ON p.product_id = oi.product_id
GROUP BY product_category_name
ORDER BY total_reviews DESC
LIMIT 10;

GROUP BY p.product_category_name
ORDER BY avg_delivery_days;
📊 Final Dashboard: Yearly Category KPIs
SELECT 
EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
p.product_category_name AS category, 
COUNT(*) AS total_orders,
SUM(oi.price) AS total_revenue,
ROUND(AVG(oi.freight_value), 2) AS avg_freight,
ROUND(AVG(EXTRACT(DAY FROM o.order_delivered_customer_date - o.order_purchase_timestamp)), 2) AS avg_delivery_days,
ROUND(AVG(ors.review_score), 2) AS avg_review_score
FROM orders o
INNER JOIN order_items oi ON oi.order_id = o.order_id
LEFT JOIN order_reviews ors ON ors.order_id = o.order_id
INNER JOIN products p ON p.product_id = oi.product_id
WHERE p.product_category_name IS NOT NULL
AND o.order_delivered_customer_date IS NOT NULL
GROUP BY 
EXTRACT(YEAR FROM o.order_purchase_timestamp),
p.product_category_name
ORDER BY year, total_revenue DESC;
🔁 Advanced Analysis – Customer & Category Insights
Repeat customers (order count > 1)
📆 2997 customers placed more than one order
WITH customer_orders AS (
SELECT c.customer_unique_id, COUNT(*) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id)
SELECT COUNT(*) AS repeat_customer_count
FROM customer_orders
WHERE order_count > 1;
Retention percentage
🔢 3.12% of customers made more than one purchase
WITH customer_orders AS (
SELECT c.customer_unique_id, COUNT(*) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id)
SELECT 
ROUND(100.0 * COUNT(*) FILTER (WHERE order_count > 1) / COUNT(*), 2) AS retention_rate_percent
FROM customer_orders;

Average days between purchases
🔢 77.86 days
WITH customer_orders AS (
  SELECT 
  c.customer_unique_id,
  o.order_purchase_timestamp,
  LAG(o.order_purchase_timestamp) OVER (
  PARTITION BY c.customer_unique_id
  ORDER BY o.order_purchase_timestamp) AS prev_order_time
  FROM orders o
  JOIN customers c ON o.customer_id = c.customer_id)
  SELECT 
  ROUND(AVG(EXTRACT(DAY FROM order_purchase_timestamp - prev_order_time)), 2) AS   
  avg_days_between_orders
  FROM customer_orders
  WHERE prev_order_time IS NOT NULL;

Average Delivery Time per Product Category


SELECT p.product_category_name, 
ROUND(AVG(o.order_delivered_customer_date - o.order_purchase_timestamp), 2) AS avg_delivery_days
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON p.product_id = oi.product_id
WHERE o.order_delivered_customer_date IS NOT NULL


