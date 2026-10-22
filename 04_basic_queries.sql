USE ecommerce_db;

-- Query 1: Display all products from the Products table
SELECT *
FROM Products;


-- Query 2: Display products whose price is greater than 5000
SELECT product_name, price
FROM Products
WHERE price > 5000;


-- Query 3: Display all products sorted by price in descending order
-- DESC means highest to lowest
SELECT product_name, price
FROM Products
ORDER BY price DESC;


-- Query 4: Display the five most expensive products
-- LIMIT 5 restricts the result to five rows
SELECT product_name, price
FROM Products
ORDER BY price DESC
LIMIT 5;


-- Query 5: Display product details using column aliases
-- AS gives more readable names to the output columns
SELECT
    product_name AS Product,
    price AS Product_Price,
    stock AS Available_Stock
FROM Products;


-- Query 6: Display products belonging to the Electronics category
SELECT product_name, category, price
FROM Products
WHERE category = 'Electronics';