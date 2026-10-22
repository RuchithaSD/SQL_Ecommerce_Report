USE ecommerce_db;

-- Query 26: Categorize products based on their prices
-- Products costing 30000 or more are Premium
-- Products costing 5000 or more are Mid-Range
-- All remaining products are Budget
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 30000 THEN 'Premium'
        WHEN price >= 5000 THEN 'Mid-Range'
        ELSE 'Budget'
    END AS price_category
FROM Products;


-- Query 27: Classify customers according to their total recorded spending
-- Spending of 50000 or more is High Spender
-- Spending of 20000 or more is Medium Spender
-- All remaining customers are Low Spender
-- LEFT JOIN includes customers without orders
-- COALESCE treats customers without order items as having zero spending
SELECT
    c.customer_name,
    COALESCE(
        SUM(oi.quantity * oi.unit_price), 0
    ) AS total_spending,
    CASE
        WHEN COALESCE(
            SUM(oi.quantity * oi.unit_price), 0
        ) >= 50000 THEN 'High Spender'
        WHEN COALESCE(
            SUM(oi.quantity * oi.unit_price), 0
        ) >= 20000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spending_category
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
LEFT JOIN Order_Items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;


-- Query 28: Display each order's year and month
-- YEAR extracts the year from the order date
-- MONTH extracts the month number from the order date
SELECT
    order_id,
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month
FROM Orders;


-- Query 29: Calculate the number of orders placed each month
-- DATE_FORMAT converts the date into YYYY-MM format
-- GROUP BY groups orders belonging to the same month
-- ORDER BY sorts the months chronologically
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;


-- Query 30: Retrieve orders placed during October 2025
-- The first condition includes October 1
-- The second condition excludes November 1 and later dates
SELECT *
FROM Orders
WHERE order_date >= '2025-10-01'
  AND order_date < '2025-11-01';