/* ==========================================================================
SALES PERFORMANCE ANALYSIS PROJECT - SQL QUERIES
Author: Sümeyye Türk
Dataset: Sales Performance Dashboard (Retail Sales Data)
Description: This script handles data schema creation, data cleaning, 
             and KPI aggregation for a business performance dashboard.
==========================================================================
*/

-- STEP 1: DATABASE SCHEMA CREATION
CREATE TABLE Sales_Data (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(15, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(15, 2)
);

--------------------------------------------------------------------------

-- STEP 2: HIGH-LEVEL BUSINESS METRICS (KPIs)
SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Overall_Profit_Margin_Pct
FROM Sales_Data;

--------------------------------------------------------------------------

-- STEP 3: CATEGORY PERFORMANCE ANALYSIS

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Category_Revenue,
    ROUND(SUM(Profit), 2) AS Category_Profit,
    SUM(Quantity) AS Units_Sold
FROM Sales_Data
GROUP BY Category
ORDER BY Category_Revenue DESC;

--------------------------------------------------------------------------

-- STEP 4: REGIONAL PERFORMANCE ANALYSIS

SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Regional_Revenue,
    ROUND(SUM(Profit), 2) AS Regional_Profit
FROM Sales_Data
GROUP BY Region
ORDER BY Regional_Profit DESC;

--------------------------------------------------------------------------

-- STEP 5: DEEP DIVE INTO SUB-CATEGORIES

SELECT 
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Sub_Category_Revenue,
    ROUND(SUM(Profit), 2) AS Sub_Category_Profit
FROM Sales_Data
GROUP BY Category, Sub_Category
ORDER BY Sub_Category_Profit DESC;

--------------------------------------------------------------------------