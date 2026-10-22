USE ecommerce_db;

-- Query 11: Count the total number of customers.
SELECT COUNT(*) AS total_customers
FROM Customers;

-- Query 12: Find the average price of all products.
SELECT AVG(price) AS average_product_price
FROM Products;

-- Query 13: Find the minimum and maximum product prices.
SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM Products;

-- Query 14: Calculate the total quantity of products currently in stock.
SELECT SUM(stock) AS total_stock
FROM Products;

-- Query 15: Count the number of products in each category.
-- GROUP BY groups products that belong to the same category.
SELECT
    category,
    COUNT(*) AS product_count
FROM Products
GROUP BY category;

-- Query 16: Calculate the average product price in each category.
SELECT
    category,
    AVG(price) AS average_price
FROM Products
GROUP BY category;

-- Query 17: Display categories containing more than one product.
-- HAVING filters groups after GROUP BY is applied.
SELECT
    category,
    COUNT(*) AS product_count
FROM Products
GROUP BY category
HAVING COUNT(*) > 1;