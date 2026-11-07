-- ============================================================
-- SQL RETAIL SALES ANALYSIS PROJECT
-- Database: Retail
-- ============================================================


-- ============================================================
--1. CREATE TABLE
-- ============================================================

DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales
(
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
	price_per_unit FLOAT,
    quantity INT,
    cogs FLOAT,
    total_sale FLOAT
);


-- View the data

SELECT *
	FROM retail_sales;





-- ============================================================
-- 2. DATA CLEANING
-- ============================================================

-- Check records containing NULL values

SELECT * 
	FROM retail_sales
	WHERE transaction_id IS NULL

SELECT * 
	FROM retail_sales
	WHERE sale_date IS NULL

SELECT * 
	FROM retail_sales
	WHERE transaction_id IS NULL
		OR sale_date IS NULL
		OR sale_time IS NULL
		OR customer_id IS NULL
	   	OR gender IS NULL
	   	OR age IS NULL
	   	OR category IS NULL
	  	OR quantity IS NULL
	   	OR price_per_unit IS NULL
	   	OR cogs IS NULL
	   	OR total_sale IS NULL;

-- Delete rows containing NULL values or blank strings
-- in text columns

DELETE  
	FROM retail_sales
	WHERE transaction_id IS NULL
		OR sale_date IS NULL
		OR sale_time IS NULL
		OR customer_id IS NULL
	   	OR gender IS NULL
	   	OR age IS NULL
	   	OR category IS NULL
	  	OR quantity IS NULL
	   	OR price_per_unit IS NULL
	   	OR cogs IS NULL
	   	OR total_sale IS NULL;


SELECT *
	FROM retail_sales;


-- Replace M with Male and F with Female

SELECT DISTINCT gender
FROM retail_sales;

UPDATE retail_sales
SET gender='Male'
WHERE gender='M';

UPDATE retail_sales
SET gender='Female'
WHERE gender='F';



-- Verify cleaned data


SELECT *
	FROM retail_sales;


-- ============================================================
-- 3. DATA ANALYSIS & BUSINESS QUESTIONS
-- ============================================================


-- Q1. Retrieve all columns for sales made on November 5, 2022.

SELECT * FROM retail_sales
	WHERE sale_date= '2022-11-05';


-- Q2. Retrieve all transactions where the category is
-- Clothing, quantity sold is greater than 2,
-- and the transaction occurred in November 2022.

SELECT * FROM retail_sales
	WHERE category= 'Clothing'
	AND quantity>2
	AND sale_date >='2022-11-01'
	AND sale_date<'2022-12-01'
	ORDER BY quantity;


-- Q3. Calculate total sales revenue and the total number
-- of transactions for each product category.

SELECT category,
	SUM(total_sale) AS net_sales,
	COUNT(transaction_id) AS total_orders
		FROM retail_sales
		GROUP BY category;

-- Q4. Find the average age of customers who purchased
-- products from the Beauty category.

SELECT
	ROUND(AVG(age), 2) AS avg_customer_age
		FROM retail_sales
		WHERE category= 'Beauty';



SELECT *
	FROM retail_sales;

	
-- Q5. Retrieve all transactions where total sales
-- exceeded 1000.

SELECT * FROM retail_sales
	WHERE total_sale >= 1000
	ORDER BY total_sale;


-- Q6. Calculate the total number of transactions
-- made by each gender in each product category.

SELECT 
	gender,
	category,
	COUNT(transaction_id) AS total_transactions
		FROM retail_sales
		GROUP BY gender, category;

-- Q7. Calculate total monthly sales for each year
-- and identify the best-selling month in each year.

WITH monthly_sales AS (
	SELECT
		EXTRACT(YEAR FROM sale_date) AS year,
		EXTRACT(MONTH FROM sale_date) AS month,
		SUM(total_sale) AS total_sales,
		RANK() OVER( PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY SUM(total_sale) DESC
					) AS rnk
					FROM retail_sales
					GROUP BY 1,2
					)
					SELECT * FROM 
					monthly_sales
					WHERE rnk=1;

					
-- Q8. Identify the top 5 customers based on
-- their highest total sales.

SELECT 
	customer_id,
	SUM(total_sale) AS total_sales
	FROM retail_sales
	GROUP BY customer_id
	ORDER BY total_sales DESC
	LIMIT 5;




SELECT *
	FROM retail_sales;	



-- Q9. Calculate the number of unique customers
-- who purchased products from each category.

SELECT 
	category,
	COUNT(DISTINCT customer_id) AS unique_customers
	FROM retail_sales
	GROUP BY category
	ORDER BY unique_customers DESC;

-- Q10. Categorize transactions into Morning, Afternoon,
-- and Evening shifts and count the orders in each shift.
--
-- Morning: Before 12:00 PM
-- Afternoon: 12:00 PM to before 6:00 PM
-- Evening: 6:00 PM onward

SELECT
	CASE 
		WHEN sale_time<'12:00:00' THEN 'MORNING'
		WHEN sale_time<'18:00:00' THEN 'AFTERNOON'
		ELSE 'EVENING'
		END AS shift,
		COUNT(*) AS total_orders
			 FROM retail_sales
			 GROUP BY shift
			 ORDER BY total_orders DESC;

SELECT *, 
	CASE 
		WHEN sale_time<'12:00:00' THEN 'MORNING'
		WHEN sale_time<'18:00:00' THEN 'AFTERNOON'
		ELSE 'EVENING'
		END AS shift
			from retail_sales;










-- ============================================================
-- END OF RETAIL SALES ANALYSIS PROJECT
-- ============================================================