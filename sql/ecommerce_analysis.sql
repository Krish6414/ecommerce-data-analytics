-- E-Commerce Sales Analytics
-- MySQL 5.7
-- Business Analysis Queries



-- ============================================================
-- E-Commerce Sales Analytics
-- Database: ecommerce_db
-- MySQL Version: 5.7
-- ============================================================

USE ecommerce_db;


-- ============================================================
-- QUERY 1: Total Revenue
-- ============================================================

SELECT
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM orders;


-- ============================================================
-- QUERY 2: Total Profit
-- ============================================================

SELECT
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders;


-- ============================================================
-- QUERY 3: Total Orders
-- ============================================================

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders;


-- ============================================================
-- QUERY 4: Average Order Value
-- ============================================================

SELECT
    ROUND(
        SUM(Sales) / COUNT(DISTINCT Order_ID),
        2
    ) AS Average_Order_Value
FROM orders;


-- ============================================================
-- QUERY 5: Revenue by Category
-- ============================================================

SELECT
    p.Category,
    ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC;


-- ============================================================
-- QUERY 6: Revenue by Region
-- ============================================================

SELECT
    c.Region,
    ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Revenue DESC;


-- ============================================================
-- QUERY 7: Profit by Category
-- ============================================================

SELECT
    p.Category,
    ROUND(SUM(o.Profit), 2) AS Profit
FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Profit DESC;


-- ============================================================
-- QUERY 8: Top 10 Products by Revenue
-- ============================================================

SELECT
    p.Product_Name,
    ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
ORDER BY Revenue DESC
LIMIT 10;


-- ============================================================
-- QUERY 9: Monthly Revenue
-- ============================================================

SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Year,
    Month;


-- ============================================================
-- QUERY 10: Top 10 Customers by Revenue
-- ============================================================

SELECT
    c.Customer_ID,
    c.Customer_Name,
    ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Customer_Name
ORDER BY Revenue DESC
LIMIT 10;


-- ============================================================
-- QUERY 11: Revenue and Profit by Customer Segment
-- ============================================================

SELECT
    c.Customer_Segment,
    COUNT(DISTINCT o.Customer_ID) AS Customers,
    ROUND(SUM(o.Sales), 2) AS Revenue,
    ROUND(SUM(o.Profit), 2) AS Profit
FROM orders o
JOIN customers c
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Segment
ORDER BY Revenue DESC;


-- ============================================================
-- QUERY 12: Customers with More Than 5 Orders
-- ============================================================

SELECT
    Customer_ID,
    COUNT(DISTINCT Order_ID) AS Number_of_Orders
FROM orders
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Order_ID) > 5
ORDER BY Number_of_Orders DESC;


-- ============================================================
-- QUERY 13: High-Revenue Products
-- Products generating more than 100,000 in revenue
-- ============================================================

SELECT
    p.Product_Name,
    ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
JOIN products p
    ON o.Product_ID = p.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
HAVING SUM(o.Sales) > 100000
ORDER BY Revenue DESC;