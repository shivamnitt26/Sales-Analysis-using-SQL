/*
Request 3. Provide a report with all the unique product counts for each  segment.  and 
sort them in descending order of product counts. The final output contains 2 fields, 
*/



SELECT segment, COUNT(DISTINCT(product_code)) AS product_counts 
FROM dim_product
GROUP BY segment
ORDER BY product_counts DESC;



