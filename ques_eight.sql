/*
Request 8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

SELECT   
CASE 
	WHEN MONTH(date) IN (9, 10, 11) THEN '1Q'
    WHEN MONTH(date) IN (12, 1, 2) THEN '2Q'
    WHEN MONTH(date) IN (3, 4, 5) THEN '3Q'
    WHEN MONTH(date) IN (6, 7, 8) THEN '4Q'
 END AS Quarters,
ROUND(SUM(sold_quantity)/1000000,2) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
ORDER BY total_sold_quantity DESC
;

