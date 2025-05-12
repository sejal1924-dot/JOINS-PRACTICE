Scenario: Analyze Monthly Sales Trends for Each Salesperson
 Tables:

sale_id	salesperson_id	amount	sale_date
 1	        101	         500	2024-01-15
 2	        101	         700	2024-02-10
 3	        102	         300	2024-01-20
 4	        102	         600	2024-03-05
 5	        101	         400	2024-03-12
 6	        103	         800	2024-02-22

salespersons
salesperson_id	      name
  101	              Alice
  102	               Bob
  103	              Charlie

 STEP 1: CTE to Extract Monthly Sales Totals

WITH monthly_sales AS (
  SELECT
    s.salesperson_id,
    sp.name,
    DATE_FORMAT(s.sale_date, '%Y-%m') AS sale_month,
    SUM(s.amount) AS total_sales
  FROM sales s
  JOIN salespersons sp ON s.salesperson_id = sp.salesperson_id
  GROUP BY s.salesperson_id, sale_month
)

    STEP 2: Use Window Function to Compare Monthly Sales with Previous Month

, sales_with_trend AS (
  SELECT
    *,
    LAG(total_sales) OVER (PARTITION BY salesperson_id ORDER BY sale_month) AS previous_month_sales,
    total_sales - LAG(total_sales) OVER (PARTITION BY salesperson_id ORDER BY sale_month) AS sales_change
  FROM monthly_sales
)

 STEP 3: Final Output Query

SELECT
  name,
  sale_month,
  total_sales,
  previous_month_sales,
  sales_change,
  CASE 
    WHEN sales_change > 0 THEN '📈 Increase'
    WHEN sales_change < 0 THEN '📉 Decrease'
    ELSE '— No Change'
  END AS trend
FROM sales_with_trend
ORDER BY name, sale_month;

 Sample Output:
name	sale_month	total_sales 	previous_month_sales	     sales_change	           trend
Alice	2024-01     	500	                NULL	                 NULL	            — No Change
Alice	2024-02	        700	                 500	                 200	            📈 Increase
Alice	2024-03	        400	                 700	                -300	            📉 Decrease
Bob	    2024-01	        300	                 NULL	                 NULL	            — No Change
Bob	    2024-03	        600         	     300	                 300	            📈 Increase
Charlie	2024-02	        800	                 NULL	                 NULL	            — No Change

