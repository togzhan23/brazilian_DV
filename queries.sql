-- queries.sql
--task 4 C) 
-- Analytical queries on Olist Brazilian E-Commerce dataset

-- -----------
-- 1. Number of orders per year
--------------------------------------------------------------
SELECT EXTRACT(YEAR FROM order_purchase_timestamp) AS year,
       COUNT(*) AS total_orders
FROM orders
GROUP BY year
ORDER BY year;

-- -----------
-- 2. Number of customers per state
--------------------------------------------------------------
SELECT customer_state,
       COUNT(DISTINCT customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- ------------
-- 3. Top 10 most sold product categories
--------------------------------------------------------------
SELECT p.product_category_name,
       COUNT(*) AS total_items_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_items_sold DESC
LIMIT 10;

-- -------------
-- 4. Average order value (AOV)
--------------------------------------------------------------
SELECT AVG(total) AS avg_order_value
FROM (
    SELECT oi.order_id, SUM(oi.price + oi.freight_value) AS total
    FROM order_items oi
    GROUP BY oi.order_id
) t;

-- ------------------
-- 5. Average delivery time (in days)
--------------------------------------------------------------
SELECT ROUND(AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400), 2) 
       AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- ---------------
-- 6. Payment types usage distribution
--------------------------------------------------------------
SELECT payment_type,
       COUNT(*) AS total_transactions,
       ROUND(AVG(payment_value),2) AS avg_payment_value
FROM order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

-- -----------------
-- 7. Orders by status
--------------------------------------------------------------
SELECT order_status,
       COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- ---------------
-- 8. Top 10 sellers by sales revenue
--------------------------------------------------------------
SELECT s.seller_id,
       SUM(oi.price + oi.freight_value) AS total_revenue
FROM order_items oi
JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- --------------
-- 9. Review scores distribution
--------------------------------------------------------------
SELECT review_score,
       COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- ----------------
-- 10. Correlation between payment installments and order value
--------------------------------------------------------------
SELECT op.payment_installments,
       ROUND(AVG(op.payment_value),2) AS avg_payment_value,
       COUNT(*) AS total_orders
FROM order_payments op
GROUP BY op.payment_installments
ORDER BY op.payment_installments;
