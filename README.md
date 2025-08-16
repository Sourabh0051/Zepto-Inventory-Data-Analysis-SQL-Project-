# Zepto-Inventory-Data-Analysis-SQL-Project-

📌 Project Overview

This project is based on a retail inventory dataset inspired by Zepto, where I explored, cleaned, 
and analyzed product data using SQL. The goal of this project was to simulate a real-world data analyst
task—starting from raw inventory data, cleaning inconsistencies, and finally extracting valuable business insights.

The project demonstrates my ability to:

Write efficient SQL queries for data exploration and analysis.
Perform data cleaning and transformation.
Generate actionable insights that can help businesses make data-driven decisions.

📂 Dataset Information

The dataset represents retail inventory records with the following attributes:

sku_id → Unique product identifier

Category → Product category (e.g., Snacks, Beverages)

Name → Product name

MRP → Maximum retail price

DiscountPercent → Discount percentage offered

AvailableQuantity → Current stock quantity

DiscountedSellingPrice → Final price after discount

WeightInGms → Product weight in grams

OutOfStock → Boolean flag indicating stock status

Quantity → Ordered quantity

🔎 Key Steps Performed
1. Data Exploration

Checked total number of rows and sampled data.
Detected missing values in key fields (e.g., product name, category, MRP).
Identified distinct product categories.
Analyzed stock status (in stock vs out of stock products).
Found duplicate product names with counts.

2. Data Cleaning

Removed products with invalid pricing (MRP = 0 or Selling Price = 0).
Converted price from paise to rupees for consistency.

3. Business Insights (SQL Queries)

Q1: Top 10 products with the highest discount percentage.

Q2: High-MRP products that are currently out of stock.

Q3: Estimated potential revenue per category.

Q4: Expensive products (MRP > ₹500) with discount < 10%.

Q5: Top 5 categories offering the highest average discount.

Q6: Price per gram analysis to identify value-for-money products.

Q7: Categorized products into Low / Medium / Bulk weight groups.

Q8: Measured total inventory weight per category.

📈 Key Insights

Categories like Snacks and Beverages showed the highest revenue potential.
Several high-value products were out of stock, representing missed sales opportunities.
Some expensive products offered very low discounts, which may discourage buyers.
Price per gram analysis helped flag products that provide better value for money.

🚀 Why This Project Matters

This project mirrors the daily responsibilities of a Data Analyst in the retail domain. From cleaning inconsistent raw data to uncovering trends in stock availability, discounts, and pricing strategies, the insights generated can
Help optimize pricing strategy,
Identify stock management issues,
Improve revenue forecasting,
