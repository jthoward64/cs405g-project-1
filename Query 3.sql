/*
Query #3:
Search all receipts and provide a report of the following

| Customer name | Business Name | Highest Price | Total Sale | State | Zip |


25 points: Deliverable 8) Deliverables for this part of the assignment will be:
a) the query you wrote
b) the output it produced.
*/

-- Query Wrote
SELECT
    Buyer.EntityName AS "Customer name",
    Seller.EntityName AS "Business Name",
    ReceiptTable.Highest_Price AS "Highest Price",
    ReceiptTable.Total_Sales AS "Total Sale",
    ReceiptTable.StateName AS "State"
FROM Receipt_Table AS ReceiptTable
INNER JOIN Entity_Table AS Seller ON ReceiptTable.Seller_Key = Seller.Entity_ID
INNER JOIN Entity_Table AS Buyer ON ReceiptTable.Buyer_Key = Buyer.Entity_ID;

-- Output Produced as of 7:45 PM EST.
/*
+-------------------------+-----------------------+-----------------+-----------------+-------+
| Customer name           | Business Name         | Highest Price   | Total Sale      | State |
+-------------------------+-----------------------+-----------------+-----------------+-------+
| Mr. Ray L. Hyatt Jr.    | Kroger                |            5.00 |           25.00 | KY    |
| Michael Stacy           | The Home Depot        |            6.99 |           30.00 | KY    |
| Tony Stark              | Chick-fil-A           |           13.37 |           29.75 | KY    |
| Tag Howard              | Target                |           12.00 |           36.04 | KY    |
| John Wick               | DV8 Kitchen           |           15.00 |           30.02 | KY    |
| Dr. Stephen Strange     | Kroger                |            6.49 |           22.10 | KY    |
| Tag Howard              | Headliners Music Hall |           16.53 |           16.53 | KY    |
| Mr. Ray L. Hyatt Jr.    | Kroger                |           23.00 |           47.44 | KY    |
| President Eli Capilouto | Culver's              |            9.99 |           25.00 | KY    |
| Bob Porter c/o Intech   | Magic Kingdom Park    |           15.99 |           78.25 | FL    |
| Bob C. Smith            | Walmart Supercenter   |           20.83 |           57.80 | KY    |
| Tag Howard              | Target                |           30.67 |           80.97 | KY    |
| Michael Stacy           | Jersey Mike's Subs    |           15.60 |           40.28 | KY    |
| Michael Stacy           | Busch Stadium         |        36213.35 |        36217.34 | DC    |
| Pentagon                | White House           | 705392000000.00 | 705392000000.00 | DC    |
+-------------------------+-----------------------+-----------------+-----------------+-------+
*/