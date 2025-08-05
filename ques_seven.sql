/*
Request 7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount */

SELECT 
	CONCAT(MONTHNAME(fs.date), ' (', YEAR(fs.date), ')') AS 'Month', 
	fs.fiscal_year,
    (gp.gross_price * fs.sold_quantity) AS gross_sales_amount
FROM fact_sales_monthly fs
JOIN dim_customer c
ON fs.customer_code = c.customer_code
JOIN fact_gross_price gp
ON fs.product_code = gp.product_code
WHERE c.customer = 'Atliq Exclusive'
GROUP BY Month, fs.fiscal_year
ORDER BY fs.fiscal_year;
