-- Deliverable 9)
SELECT
  COUNT(EntityName) as 'Total Count'
FROM
  Entity_Table
WHERE
  -- Based on https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/ there is no reliable way to determine if a name is a first name or last name.
  EntityName LIKE '%Bo%';

-- Deliverable 10)
SELECT
  Zip,
  Total_Sales AS "Total Sales"
FROM
  Receipt_Table
ORDER BY
  Total_Sales DESC;