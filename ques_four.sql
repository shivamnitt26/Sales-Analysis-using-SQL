/*
Request 4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference

*/

WITH products_20 AS 
    (
	SELECT p.segment,
	COUNT(DISTINCT(fs.product_code)) AS product_counts_20
	FROM fact_sales_monthly fs
	JOIN dim_product p
	ON fs.product_code = p.product_code
	WHERE fs.fiscal_year = 2020
	GROUP BY segment
	),
products_21 AS
	(
	SELECT p.segment,
	COUNT(DISTINCT(fs.product_code)) AS product_counts_21
	FROM fact_sales_monthly fs
	JOIN dim_product p
	ON fs.product_code = p.product_code
	WHERE fs.fiscal_year = 2021
	GROUP BY segment
)

SELECT 
	p20.segment,
	p20.product_counts_20, 
	p21.product_counts_21,
    (p21.product_counts_21-p20.product_counts_20) AS difference
FROM products_20 p20
JOIN products_21 p21
ON p20.segment = p21.segment
ORDER BY difference DESC
;