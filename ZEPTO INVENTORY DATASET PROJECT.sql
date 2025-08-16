CREATE DATABASE zepto_SQL_project;

DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
Category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- data exploration

-- count of rows
SELECT count(*) FROM zepto;

-- sample data
SELECT * FROM zepto
LIMIT 10;

-- null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- products in stock Vs out of stock
SELECT outofstock,
COUNT(sku_id) AS stock_count
FROM zepto
GROUP BY outofstock;

-- products name presents multiple times;
SELECT name,
COUNT(sku_id) AS product_count
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY product_count DESC;

-- data cleaning

-- product with price = 0
SELECT *
FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paisa into rupees
UPDATE zepto
SET mrp = mrp/100,
	discountedSellingPrice = discountedSellingPrice/100;

select mrp, discountedSellingPrice
from zepto;

-- Q1. Found top 10 best-value products based on discount percentage
SELECT name, discountpercent
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

-- Q2. Identified high-MRP products that are currently out of stock
SELECT DISTINCT name, mrp, outofstock
FROM zepto
WHERE outofstock = 'True'
ORDER BY mrp DESC;

-- Q3. Estimated potential revenue for each product category
SELECT category, 
	   SUM(discountedSellingPrice * availablequantity) AS total_estimated_revenue
FROM zepto
GROUP BY category
ORDER BY total_estimated_revenue DESC;

-- Q4. Filtered expensive products (MRP > ₹500) with discount is less than 10% 
SELECT DISTINCT name, mrp, discountpercent
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC;

-- Q5. Ranked top 5 categories offering highest average discounts
SELECT category,
ROUND(AVG(discountpercent),2) as avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Calculated price per gram to identify value-for-money products
SELECT DISTINCT name, weightInGms, discountedSellingPrice, 
	   	   ROUND(discountedSellingPrice / weightIngms, 2) as price_per_gm
FROM zepto
WHERE weightInGms >= 100;

-- Q7. Grouped products based on weight into Low, Medium, and Bulk categories
SELECT DISTINCT name, weightingms,
	   CASE
	   	   WHEN weightingms < 1000 THEN 'Low'
		   WHEN weightingms < 5000 THEN 'Medium'
		   ELSE 'Bulk'
	   END AS weight_category
FROM zepto;

-- Q8. Measured total inventory weight per product category
SELECT category,
SUM(weightingms * availablequantity) as total_weight_per_cat
FROM zepto
GROUP BY category
ORDER BY total_weight_per_cat ASC;
