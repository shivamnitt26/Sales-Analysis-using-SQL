/*
Request 9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

WITH channel_sale AS (
SELECT
c.channel,
ROUND(SUM(gross_price*sold_quantity/1000000), 2) AS gross_sales_mln
FROM fact_sales_monthly fs
JOIN dim_customer c
ON fs.customer_code = c.customer_code
JOIN fact_gross_price fg
ON fs.product_code = fg.product_code
WHERE fs.fiscal_year = 2021
GROUP BY c.channel )

SELECT 
channel, 
gross_sales_mln, 
ROUND(gross_sales_mln / SUM(gross_sales_mln) OVER() * 100, 2) AS percentage_contribution 
FROM channel_sale
ORDER BY gross_sales_mln;

