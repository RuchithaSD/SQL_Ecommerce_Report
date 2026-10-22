USE ecommerce_db;

-- Query 36: Identify the five products generating the highest revenue
-- JOIN connects products, order items, and orders
-- WHERE includes only delivered orders
-- Revenue is calculated as quantity multiplied by unit_price
-- GROUP BY calculates revenue separately for each product
-- ORDER BY sorts products from highest to lowest revenue
-- LIMIT 5 returns only the top five products
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Products p
INNER JOIN Order_Items oi
    ON p.product_id = oi.product_id
INNER JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;


-- Query 37: Identify the five customers with the highest spending
-- JOIN connects customers with their orders and purchased products
-- WHERE includes only delivered orders
-- SUM calculates the total value of each customer's purchases
-- GROUP BY generates one row per customer
-- ORDER BY sorts customers by spending in descending order
-- LIMIT 5 returns the top five customers
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 5;


-- Query 38: Calculate the revenue generated in each month
-- JOIN connects orders with their order items
-- WHERE includes only delivered orders
-- DATE_FORMAT extracts the year and month in YYYY-MM format
-- SUM calculates the total revenue for each month
-- GROUP BY combines orders from the same month
-- ORDER BY displays the months chronologically
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM Orders o
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;


-- Query 39: Calculate the average value of delivered orders
-- First, calculate the total value of each delivered order
-- Then, calculate the average of those order totals
-- A subquery allows us to aggregate the order items before averaging
SELECT
    ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.unit_price) AS order_total
    FROM Orders o
    INNER JOIN Order_Items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY o.order_id
) AS order_totals;