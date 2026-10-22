USE ecommerce_db;

-- Query 31: Add a phone column to the Customers table
-- ALTER TABLE modifies the existing table structure
-- The phone column can store phone numbers up to 15 characters
ALTER TABLE Customers
ADD COLUMN phone VARCHAR(15);


-- Query 32: Create a Payments table to store payment details
-- payment_id uniquely identifies each payment
-- order_id connects each payment to an existing order
-- FOREIGN KEY maintains referential integrity
-- CHECK prevents negative payment amounts
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATE,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(30),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CHECK (amount >= 0)
);


-- Query 33: Increase the phone column length from 15 to 20 characters
-- MODIFY COLUMN changes the definition of an existing column
ALTER TABLE Customers
MODIFY COLUMN phone VARCHAR(20);


-- Query 34: Create a view that summarizes sales for each product
-- LEFT JOIN includes products that have never been ordered
-- SUM calculates the total quantity and revenue for each product
-- COALESCE replaces NULL totals with zero
-- GROUP BY generates one row per product
CREATE OR REPLACE VIEW Product_Sales AS
SELECT
    p.product_id,
    p.product_name,
    COALESCE(SUM(oi.quantity), 0) AS total_quantity_sold,
    COALESCE(
        SUM(oi.quantity * oi.unit_price), 0
    ) AS total_revenue
FROM Products p
LEFT JOIN Order_Items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;


-- Display the product sales report
-- Sort products by total revenue in descending order
SELECT *
FROM Product_Sales
ORDER BY total_revenue DESC;


-- Query 35: Remove the Payments table
-- DROP TABLE permanently removes the table structure and its records
-- Execute this only if you no longer need the Payments table
DROP TABLE Payments;