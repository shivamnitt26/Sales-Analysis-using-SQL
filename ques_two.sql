/*
Request 2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields: unique_products_2020, unique_products_2021 and percentage_chg
*/

WITH 
	products_20 AS 
	( SELECT COUNT(DISTINCT(product_code)) AS count_2020 
	FROM fact_sales_monthly WHERE fiscal_year = 2020 ),
	products_21 AS
	( SELECT COUNT(DISTINCT(product_code)) AS count_2021 
	FROM fact_sales_monthly WHERE fiscal_year = 2021 )
    
SELECT 
	p20.count_2020, 
	p21.count_2021,
    ROUND((count_2021-count_2020)*100.0/count_2020, 2) AS pct_change
FROM products_20 p20
CROSS JOIN products_21 p21;