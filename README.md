# Retail-Sales-Analysis-PostgreSql

## Project Overview

This project demonstrates how PostgreSQL can be used to analyze retail transaction data and answer practical business questions. The analysis focuses on sales performance, customer purchasing behavior, product categories, monthly revenue trends, and transaction timing. SQL is used to inspect the dataset, clean selected data quality issues, summarize records, and generate business insights.

---

## Project Objectives

- Inspect the structure and completeness of the retail sales dataset.
- Standardize gender values and identify records with missing information.
- Analyze sales performance across product categories.
- Evaluate customer purchasing patterns.
- Identify high-value transactions and top customers.
- Determine the best-performing sales months.
- Analyze transaction activity by time of day.

---

## Tools & Technologies

- PostgreSQL
- SQL
- Csv
---

## Dataset Description

The project uses a transaction-level retail sales dataset where each row represents a single sales transaction.

### Dataset Columns

- Transaction ID
- Sale Date
- Sale Time
- Customer ID
- Gender
- Age
- Product Category
- Price Per Unit
- Quantity
- Cost of Goods Sold (COGS)
- Total Sale

---

## Data Cleaning

The following data cleaning steps were performed before analysis:

- Identified records containing missing values.
- Removed records with NULL values in required fields.
- Checked blank values in Gender and Category fields.
- Standardized gender values:
  - M → Male
  - F → Female
- Verified the cleaned dataset.

---

## SQL Concepts Used

The project demonstrates the use of:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- Aggregate Functions
  - SUM()
  - COUNT()
  - AVG()
- DISTINCT
- Common Table Expressions (CTEs)
- Window Functions (RANK)
- CASE Statements
- Date Filtering
- Data Cleaning using UPDATE and DELETE
- Primary Key Validation

---

## Business Questions

The analysis answers the following business questions:

1. Retrieve all sales made on November 5, 2022.
2. Find Clothing transactions with quantity greater than 2 during November 2022.
3. Calculate sales revenue and transaction count by product category.
4. Find the average age of customers purchasing Beauty products.
5. Identify transactions with sales greater than 1,000.
6. Compare transaction counts by gender and category.
7. Identify the best-selling month in each year.
8. Find the top five customers based on total sales.
9. Count unique customers by product category.
10. Analyze transactions by Morning, Afternoon, and Evening shifts.

---

## Additional Validation

The project also includes validation queries to:

- Count total records
- Calculate overall sales
- Check duplicate Transaction IDs

---

## Key Findings

- Electronics generated the highest total sales, followed by Clothing and Beauty.
- The average age of Beauty customers was **40.39 years**.
- Customer ID **3** recorded the highest cumulative purchases.
- December was the highest sales month in both years included in the analysis.
- The Evening shift recorded the largest number of transactions.
- Clothing had the highest number of unique customers.
- Transaction counts varied across gender and product categories, supporting further customer behavior analysis.

---

## Business Value

This analysis helps businesses:

- Compare sales performance across product categories.
- Understand customer demographics.
- Identify high-value customers for retention strategies.
- Recognize seasonal sales trends for inventory planning.
- Improve staffing decisions using transaction timing.
- Evaluate customer reach across product categories.
- Support business decisions using SQL-based analysis.

---

## Conclusion

This project demonstrates how PostgreSQL can be used to clean, organize, and analyze retail sales data. The analysis provides insights into category performance, customer demographics, top customers, seasonal trends, and transaction timing, helping support marketing, inventory, and operational planning. Additional analysis would be required to determine the underlying causes of these observed patterns.

---

## Author
Shakthi Sharma
