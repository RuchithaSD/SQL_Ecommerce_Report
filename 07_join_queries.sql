USE ecommerce_db;

-- Query 18: Display each order along with the customer's name
-- INNER JOIN returns only records with matching customer IDs
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.status
FROM Orders o
INNER JOIN Customers c
    ON o.customer_id = c.customer_id;
    
    
-- Query 19: Display all customers and their order IDs
-- LEFT JOIN returns every customer, even if they have no orders
-- Customers without orders will have NULL in the order_id column
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id;
    
    
-- Query 20: Find customers who have not placed any orders
-- LEFT JOIN keeps all customers
-- WHERE filters customers for whom no matching order exists
SELECT
    c.customer_id,
    c.customer_name
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- Query 21: Find products that do not appear in any order
-- LEFT JOIN keeps all products
-- WHERE identifies products without matching order items
SELECT
    p.product_id,
    p.product_name
FROM Products p
LEFT JOIN Order_Items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


-- Query 22: Display each order with its products and quantities
-- JOIN Orders with Order_Items to retrieve the items in each order
-- JOIN Products to retrieve the corresponding product names
-- Calculate the total value of each item using quantity * unit_price
SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS item_total
FROM Orders o
INNER JOIN Order_Items oi
    ON o.order_id = oi.order_id
INNER JOIN Products p
    ON oi.product_id = p.product_id;
    
    
-- Query 23: Calculate the total recorded order-item value for each customer
-- LEFT JOIN includes customers who have never placed orders
-- SUM calculates each customer's total spending
-- COALESCE replaces NULL totals with zero
-- GROUP BY produces one result per customer
-- ORDER BY displays the highest spending customers first
SELECT
    c.customer_id,
    c.customer_name,
    COALESCE(
        SUM(oi.quantity * oi.unit_price), 0
    ) AS total_spending
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
LEFT JOIN Order_Items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC;


-- Query 24: Display all customers and their associated orders
-- RIGHT JOIN preserves every row from the right-side table, Customers
-- Customers without orders will have NULL order information
SELECT
    c.customer_name,
    o.order_id,
    o.order_date
FROM Orders o
RIGHT JOIN Customers c
    ON o.customer_id = c.customer_id;
    
    
-- Query 25: Simulate a FULL OUTER JOIN between Customers and Orders
-- The first SELECT returns all customers and their matching orders
-- The second SELECT returns orders that have no matching customer
-- UNION ALL combines both results without removing duplicates
-- The WHERE condition prevents matched records from appearing twice
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id

UNION ALL

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id
FROM Customers c
RIGHT JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;