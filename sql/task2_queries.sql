-- =====================================
-- SQL FUNDAMENTALS
-- =====================================

-- SELECT
SELECT *
FROM sales
LIMIT 5;

-- WHERE
SELECT *
FROM sales
WHERE Sales > 50
LIMIT 10;

-- ORDER BY
SELECT *
FROM sales
ORDER BY Sales DESC
LIMIT 10;

-- LIMIT
SELECT *
FROM sales
LIMIT 10;

-- GROUP BY
SELECT Category,
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY Category;

-- HAVING
SELECT Category,
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY Category
HAVING TotalSales > 300000;

-- =====================================
-- ADVANCED SQL
-- =====================================

-- SUBQUERY
SELECT *
FROM sales
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM sales
);

-- CTE
WITH category_sales AS
(
    SELECT Category,
           SUM(Sales) AS TotalSales
    FROM sales
    GROUP BY Category
)
SELECT *
FROM category_sales;

-- ROW_NUMBER
SELECT [Product Name],
       Sales,
       ROW_NUMBER() OVER
       (ORDER BY Sales DESC) AS RowNo
FROM sales
LIMIT 20;

-- RANK
SELECT [Product Name],
       Sales,
       RANK() OVER
       (ORDER BY Sales DESC) AS RankNo
FROM sales
LIMIT 20;

-- LAG
SELECT [Order Date],
       Sales,
       LAG(Sales,1) OVER
       (ORDER BY [Order Date]) AS PreviousSales
FROM sales
LIMIT 20;

-- LEAD
SELECT [Order Date],
       Sales,
       LEAD(Sales,1) OVER
       (ORDER BY [Order Date]) AS NextSales
FROM sales
LIMIT 20;

-- VIEW
CREATE VIEW TopSales AS
SELECT *
FROM sales
WHERE Sales > 10;

SELECT *
FROM TopSales
LIMIT 10;

-- =====================================
-- BUSINESS QUESTION 1
-- Highest Revenue Sub-Category
-- =====================================

SELECT [Sub-Category],
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY [Sub-Category]
ORDER BY TotalSales DESC
LIMIT 10;

-- =====================================
-- BUSINESS QUESTION 2
-- Top 5 Products by Sales
-- =====================================

SELECT [Product Name],
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY [Product Name]
ORDER BY TotalSales DESC
LIMIT 5;

-- =====================================
-- BUSINESS QUESTION 3
-- Highest Revenue Category
-- =====================================

SELECT Category,
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY Category
ORDER BY TotalSales DESC;

-- =====================================
-- BUSINESS QUESTION 4
-- Highest Sales Region
-- =====================================

SELECT Region,
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY Region
ORDER BY TotalSales DESC;

-- =====================================
-- BUSINESS QUESTION 5
-- Top 10 Customers
-- =====================================

SELECT [Customer Name],
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY [Customer Name]
ORDER BY TotalSales DESC
LIMIT 10;

-- =====================================
-- BUSINESS QUESTION 6
-- Monthly Sales Trend
-- =====================================

SELECT strftime('%Y-%m',[Order Date]) AS Month,
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY Month
ORDER BY Month;

-- =====================================
-- BUSINESS QUESTION 7
-- Highest Profit Products
-- =====================================

SELECT [Product Name],
       SUM(Profit) AS TotalProfit
FROM sales
GROUP BY [Product Name]
ORDER BY TotalProfit DESC
LIMIT 10;

-- =====================================
-- BUSINESS QUESTION 8
-- Lowest Profit Products
-- =====================================

SELECT [Product Name],
       SUM(Profit) AS TotalProfit
FROM sales
GROUP BY [Product Name]
ORDER BY TotalProfit ASC
LIMIT 10;

-- =====================================
-- BUSINESS QUESTION 9
-- Sales by Segment
-- =====================================

SELECT Segment,
       SUM(Sales) AS TotalSales
FROM sales
GROUP BY Segment
ORDER BY TotalSales DESC;

-- =====================================
-- BUSINESS QUESTION 10
-- Average Sales by Category
-- =====================================

SELECT Category,
       AVG(Sales) AS AverageSales
FROM sales
GROUP BY Category;
