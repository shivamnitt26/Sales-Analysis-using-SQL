/*
Request 5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost
*/

SELECT 
	fmc.product_code, 
	p.product, 
	fmc.manufacturing_cost
FROM fact_manufacturing_cost fmc
JOIN dim_product p
ON fmc.product_code = p.product_code
WHERE fmc.manufacturing_cost  IN (
	 SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost
     UNION
     SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost
)
ORDER BY manufacturing_cost DESC;