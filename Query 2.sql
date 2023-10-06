SELECT
  EntityName as 'Customer Name',
  Telephone_Number as 'Phone number',
  Zip as 'Zip code'
FROM
  Entity_Table
  LEFT JOIN Telephone_Numbers ON Telephone_Numbers.Entity_ID = Entity_Table.Entity_ID
WHERE
  Zip = (
    SELECT
      Zip
    FROM
      Entity_Table
    GROUP BY
      Zip
    ORDER BY
      COUNT(Zip) DESC
    LIMIT
      1
  )
  OR Zip = (
    SELECT
      Zip
    FROM
      Entity_Table
    GROUP BY
      Zip
    ORDER BY
      COUNT(Zip) DESC
    LIMIT
      1, 1
  )
ORDER BY
  Zip;