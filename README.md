# SQL E-commerce Report

## Project Overview

This project demonstrates how SQL can be used to manage and analyze an e-commerce database using MySQL. It includes database creation, sample data, SQL queries, and business reports.

## Objectives

* Create and manage an e-commerce database.
* Retrieve and filter data using SQL.
* Handle NULL values.
* Apply aggregate functions and grouping.
* Combine data from multiple tables using joins.
* Use subqueries, CASE statements, and date functions.
* Practice Data Definition Language (DDL) commands.
* Generate reports on product sales, customer spending, and monthly revenue.

## Database Tables

| Table       | Description                                                                  |
| ----------- | ---------------------------------------------------------------------------- |
| Customers   | Stores customer information.                                                 |
| Products    | Stores product details, prices, categories, and stock.                       |
| Orders      | Stores customer orders and their statuses.                                   |
| Order_Items | Stores products and quantities associated with each order.                   |
| Payments    | Demonstrates table creation; it may be dropped during the DDL demonstration. |

The project also includes a `Product_Sales` view that summarizes product quantities sold and revenue.

## SQL Concepts Covered

* CREATE DATABASE and CREATE TABLE
* INSERT and SELECT
* WHERE, ORDER BY, and LIMIT
* NULL handling
* Aggregate functions: COUNT, SUM, AVG, MIN, and MAX
* GROUP BY and HAVING
* INNER JOIN, LEFT JOIN, and RIGHT JOIN
* Subqueries
* CASE statements
* Date functions
* ALTER TABLE and DROP TABLE
* Views
* Business reports and revenue analysis

## Project Files

| File                         | Description                            |
| ---------------------------- | -------------------------------------- |
| `01_create_database.sql`     | Creates the database.                  |
| `02_create_tables.sql`       | Creates the database tables.           |
| `03_insert_sample_data.sql`  | Inserts sample records.                |
| `04_basic_queries.sql`       | Basic retrieval and filtering queries. |
| `05_null_handling.sql`       | Queries for handling NULL values.      |
| `06_aggregate_queries.sql`   | Aggregate functions and grouping.      |
| `07_join_queries.sql`        | Queries using joins.                   |
| `08_case_date_functions.sql` | CASE statements and date functions.    |
| `09_ddl_commands.sql`        | DDL commands and view creation.        |
| `10_business_reports.sql`    | Business reports and revenue analysis. |

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Connect to your MySQL server through MySQL Workbench.
3. Run `01_create_database.sql`.
4. Run `02_create_tables.sql`.
5. Run `03_insert_sample_data.sql`.
6. Run the remaining SQL files in numerical order.
7. Review the result grids to verify the outputs.

**Note:** Run the database setup and sample-data scripts only once unless you intend to reset the database. Ensure the `Product_Sales` view exists before running queries that use it.

## Tools Used

* MySQL
* MySQL Workbench
* SQL
* Git and GitHub
