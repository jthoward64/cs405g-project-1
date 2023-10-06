-- Deliverable 9)
SELECT 
  EntityName AS "Total Number" 
FROM Entity_Table
WHERE EntityName LIKE '%bo%';

-- Deliverable 10)
SELECT Zip, 
  Total_Sales AS "Total Sales"
FROM Receipt_Table
ORDER BY Total_Sales DESC;
