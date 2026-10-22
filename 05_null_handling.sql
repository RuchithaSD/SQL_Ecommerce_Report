USE ecommerce_db;

-- Query 7: Find customers whose email address is missing
-- IS NULL checks whether a column contains NULL
SELECT customer_id, customer_name, email
FROM Customers
WHERE email IS NULL;


-- Query 8: Replace missing city values with 'Unknown'
-- COALESCE returns the first non-NULL value
SELECT
    customer_name,
    COALESCE(city, 'Unknown') AS customer_city
FROM Customers;


-- Query 9: Find products that do not have a category assigned
SELECT product_name, category
FROM Products
WHERE category IS NULL;


-- Query 10: Calculate price divided by stock
-- NULLIF returns NULL when stock is zero, avoiding division by zero
SELECT
    product_name,
    price,
    stock,
    price / NULLIF(stock, 0) AS price_per_stock_unit
FROM Products;