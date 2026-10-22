USE ecommerce_db;

INSERT INTO Customers
(customer_name, email, city, signup_date)
VALUES
('Aarav', 'aarav@gmail.com', 'Bangalore', '2025-01-10'),
('Priya', 'priya@gmail.com', 'Mysore', '2025-02-15'),
('Rahul', 'rahul@gmail.com', 'Bangalore', '2025-03-20'),
('Sneha', 'sneha@gmail.com', 'Chennai', '2025-04-05'),
('Kiran', NULL, 'Hyderabad', '2025-05-12'),
('Ananya', 'ananya@gmail.com', NULL, '2025-06-18'),
('Vikram', 'vikram@gmail.com', 'Mumbai', '2025-07-22'),
('Meera', 'meera@gmail.com', 'Mysore', '2025-08-09');

SELECT * FROM Customers;

INSERT INTO Products
(product_name, category, price, stock)
VALUES
('Laptop', 'Electronics', 60000, 10),
('Smartphone', 'Electronics', 25000, 20),
('Headphones', 'Electronics', 2000, 50),
('Office Chair', 'Furniture', 8000, 15),
('Study Table', 'Furniture', 12000, 8),
('Notebook', 'Stationery', 100, 200),
('Pen', 'Stationery', 20, 500),
('Smartwatch', 'Electronics', 5000, 25),
('Backpack', NULL, 1500, 30),
('Keyboard', 'Electronics', 1800, 0);

SELECT * FROM Products;

INSERT INTO Orders
(customer_id, order_date, status)
VALUES
(1, '2025-09-01', 'Delivered'),
(2, '2025-09-03', 'Delivered'),
(1, '2025-09-10', 'Delivered'),
(3, '2025-09-15', 'Pending'),
(4, '2025-10-02', 'Delivered'),
(5, '2025-10-05', 'Cancelled'),
(2, '2025-10-12', 'Delivered'),
(7, '2025-10-20', 'Delivered'),
(3, '2025-11-01', 'Delivered');

SELECT * FROM Orders;

INSERT INTO Order_Items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 60000),
(1, 3, 2, 2000),
(2, 2, 1, 25000),
(2, 6, 10, 100),
(3, 8, 1, 5000),
(3, 3, 1, 2000),
(4, 4, 2, 8000),
(4, 7, 20, 20),
(5, 5, 1, 12000),
(5, 2, 1, 25000),
(6, 9, 2, 1500),
(7, 1, 1, 60000),
(7, 8, 2, 5000),
(8, 3, 3, 2000),
(8, 6, 5, 100),
(9, 2, 2, 25000),
(9, 4, 1, 8000);

SELECT * FROM Order_Items;

SELECT COUNT(*) AS total_customers
FROM Customers;

SELECT COUNT(*) AS total_products
FROM Products;

SELECT COUNT(*) AS total_orders
FROM Orders;

SELECT COUNT(*) AS total_order_items
FROM Order_Items;