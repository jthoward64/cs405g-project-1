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

/*
Output:
+-------------------------+----------------+----------+
| Customer Name           | Phone number   | Zip code |
+-------------------------+----------------+----------+
| Jersey Mike's Subs      | (859)288-0008  | 40504    |
| Miyako Poke Bowl        | (859)469-9098  | 40504    |
| The Home Depot          | (859) 373-0594 | 40504    |
| The Home Depot          | (859)260-9404  | 40504    |
| The Home Depot          | (859)260-9410  | 40504    |
| DV8 Kitchen             | (859) 955-0388 | 40504    |
| President Eli Capilouto | 859-257-1701   | 40508    |
| Manchester Music Hall   | (859) 537-7321 | 40508    |
| Target                  | 1-800-591-3869 | 40508    |
| Target                  | 18592863352    | 40508    |
| Kentucky Native Café    | (859)281-1718  | 40508    |
+-------------------------+----------------+----------+
11 rows in set (0.00 sec)
 */
/*
mysql> SELECT * from Entity_Table;
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+--------------------------+
| Entity_ID | Street_Name                                   | Zip   | City             | StateName | EntityName                        | Primary_Telephone_Number |
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+--------------------------+
|         1 | 300 Rose Street Room 102 Hardymon Building    | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              | NULL                     |
|         2 | 301 Hilltop Avenue, Room 102                  | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              | NULL                     |
|         3 | 82 Beaver St Room 1301                        | 10005 | New York         | NY        | John Wick                         | 555-555-5555             |
|         4 | 200 Park Avenue Penthouse                     | 10001 | New York         | NY        | Tony Stark                        | 555-555-3142             |
|         5 | 117A Bleecker Street                          | 10001 | New York         | NY        | Dr. Stephen Strange               | (555)555-4321            |
|         6 | 200 Park Avenue Apartment 221                 | 10001 | New York         | NY        | Bob C. Smith                      | NULL                     |
|         7 | #1 Avenue of Champions                        | 40506 | Lexington        | KY        | Bowman F. Wildcat                 | NULL                     |
|         8 | 200 Park Avenue                               | 40507 | Lexington        | KY        | Bob C. Smith                      | NULL                     |
|         9 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Bob Porter c/o Intech             | NULL                     |
|        10 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Mr. Bob Sydell c/o Intech         | NULL                     |
|        11 | 2299 Richmond Rd                              | 40502 | Lexington        | KY        | Chick-fil-A                       | (859)335-9856            |
|        12 | 471 Rose St                                   | 40508 | Lexington        | KY        | President Eli Capilouto           | 859-257-1701             |
|        13 | 150 W Lowry Ln #190                           | 40503 | Lexington        | KY        | Kroger                            | (859) 278-6228           |
|        14 | 2161 Paul Jones Way                           | 40509 | Lexington        | KY        | Culver's                          | (859)263-7777            |
|        15 | 1180 Seven Seas Dr                            | 32830 | Lake Buena Vista | FL        | Magic Kingdom Park                | (407)939-5277            |
|        16 | 500 W New Circle Rd                           | 40511 | Lexington        | KY        | Walmart Supercenter               | (859)381-9370            |
|        17 | 111 Avenue of Champions Holmes Hall 803       | 40527 | Lexington        | KY        | Tag Howard                        | (859)684-8444            |
|        18 | 1600 Pennsylvania Ave NW                      | 20500 | Washington       | DC        | White House                       | (202)456-1414            |
|        19 | 1400 Defense Pentagon                         | 20301 | Washington       | DC        | Pentagon                          | (703)697-1776            |
|        20 | 101 Cochran Rd                                | 40502 | Lexington        | KY        | Joella's Hot Chicken              | (859) 269-9593           |
|        21 | 867 South Broadway                            | 40504 | Lexington        | KY        | Jersey Mike's Subs                | (859)288-0008            |
|        22 | 700 Clark Ave                                 | 63102 | St. Louis        | MO        | Busch Stadium                     | 13143459600              |
|        23 | Antarctic Support Contract 7400 S. Tucson Way | 80112 | Centennial       | CO        | Palmer Station (Antarctica)       | NULL                     |
|        24 | 1386 Lexington Rd                             | 40206 | Louisville       | KY        | Headliners Music Hall             | (502) 584-8088           |
|        25 | 867 South Broadway                            | 40504 | Lexington        | KY        | Miyako Poke Bowl                  | (859)469-9098            |
|        26 | 899 Manchester St                             | 40508 | Lexington        | KY        | Manchester Music Hall             | (859) 537-7321           |
|        27 | 1649 M-32                                     | 49735 | Gaylord          | MI        | E-Free Church Gaylord Campus      | 19897322647              |
|        28 | 7345 Delridge Way SW                          | 98106 | Seattle          | WA        | The Home Depot                    | 12067622126              |
|        29 | 500 S Upper St STE 110                        | 40508 | Lexington        | KY        | Target                            | 18592863352              |
|        30 | 211 NE Revere Avenue                          | 97701 | Bend             | OR        | Blockbuster                       | (541)385-9111            |
|        31 | 1837 Plaudit Pl                               | 40509 | Lexington        | KY        | Michael Stacy                     | (859)789-0812            |
|        32 | 525 Alakawa St                                | 96817 | Honolulu         | HI        | Costco Wholesale                  | (808)526-6100            |
|        33 | 2021 Harrodsburg Rd                           | 40504 | Lexington        | KY        | The Home Depot                    | (859) 373-0594           |     
|        34 | 2039 El Camino Real                           | 95050 | Santa Clara      | CA        | Patel Brothers                    | 14082613555              |     
|        35 | 918 Natural Bridge Rd                         | 40376 | Slade            | KY        | Thatcher Barbecue Company         | (606)947-8040            |     
|        36 | 867 S Broadway                                | 40504 | Lexington        | KY        | DV8 Kitchen                       | (859) 955-0388           |     
|        37 | 3400 Vine St                                  | 45220 | Cincinnati       | OH        | Cincinnati Zoo & Botanical Garden | (513)281-4700            |     
|        38 | 417 E Maxwell St Unit B                       | 40508 | Lexington        | KY        | Kentucky Native Café              | (859)281-1718            |     
|        39 | 4055 Nichols Park Dr                          | 40503 | Lexington        | KY        | Lowe's                            | (859) 971-8300           |     
|        40 | 4081 Finn Way                                 | 40503 | Lexington        | KY        | J. Alexander's Restaurant         | (859)687-0099            |     
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+--------------------------+     
40 rows in set (0.00 sec)

mysql> SELECT * from Receipt_Table;
CT * +--------------------+------------+-----------+------------------+-------+-----------+-----------------+-----------------+-----------------+-----------------+     
| Transaction_Number | Seller_Key | Buyer_Key | Picture          | Zip   | StateName | Number_Of_Items | Total_Sales     | Highest_Price   | Lowest_Price    |
+--------------------+------------+-----------+------------------+-------+-----------+-----------------+-----------------+-----------------+-----------------+
|                  1 |         13 |         1 | NULL             | 40503 | KY        |               5 |           25.00 |            5.00 |            5.00 |
|                  2 |         33 |        31 | NULL             | 40504 | KY        |               5 |           30.00 |            6.99 |            3.49 |
|                  3 |         11 |        29 | NULL             | 40502 | KY        |               3 |           29.75 |           13.37 |            6.49 |
|                  4 |         29 |        17 | NULL             | 40509 | KY        |               5 |           36.04 |           12.00 |            2.89 |
|                  5 |         36 |         3 | NULL             | 40504 | KY        |               4 |           30.02 |           15.00 |            3.00 |
|                  6 |         13 |         5 | NULL             | 40503 | KY        |               5 |           22.10 |            6.49 |            0.24 |
|                  7 |         24 |        17 | NULL             | 40508 | KY        |               1 |           16.53 |           16.53 |           16.53 |
|                  8 |         13 |        32 | NULL             | 40503 | KY        |               5 |           47.44 |           23.00 |            4.49 |
|                  9 |         14 |        21 | NULL             | 40509 | KY        |               4 |           25.00 |            9.99 |            4.00 |
|                 10 |         15 |        29 | NULL             | 32830 | FL        |               6 |           78.25 |           15.99 |            9.99 |
|                 11 |         16 |        29 | NULL             | 40511 | KY        |               4 |           57.80 |           20.83 |           10.87 |
|                 12 |         29 |        17 | NULL             | 40508 | KY        |               6 |           80.97 |           30.67 |            5.87 |
|                 13 |         21 |        31 | NULL             | 40527 | KY        |               4 |           40.28 |           15.60 |            6.00 |
|                 14 |         22 |        31 | NULL             | 20500 | DC        |               2 |        36217.34 |        36213.35 |            3.99 |
|                 15 |         18 |        19 | NULL             | 20301 | DC        |               1 | 705392000000.00 | 705392000000.00 | 705392000000.00 |
+--------------------+------------+-----------+------------------+-------+-----------+-----------------+-----------------+-----------------+-----------------+
15 rows in set (0.00 sec)

mysql> SELECT * from Telephone_Numbers;
+------------------+-----------+
| Telephone_Number | Entity_ID |
+------------------+-----------+
| 555-555-5555     |         3 |
| 555-555-3142     |         4 |
| (555)555-4321    |         5 |
| (859)335-9856    |        11 |
| 859-257-1701     |        12 |
| (859) 278-6228   |        13 |
| (859)263-7777    |        14 |
| (407)939-5277    |        15 |
| (859)381-9370    |        16 |
| (859)684-8444    |        17 |
| (202)456-1414    |        18 |
| (703)697-1776    |        19 |
| (859) 269-9593   |        20 |
| (859)288-0008    |        21 |
| 13143459600      |        22 |
| (502) 584-8088   |        24 |
| (859)469-9098    |        25 |
| (859) 537-7321   |        26 |
| 19897322647      |        27 |
| 12067622126      |        28 |
| 1-800-591-3869   |        29 |
| 18592863352      |        29 |
| (541)385-9111    |        30 |
| (859)789-0812    |        31 |
| (808)526-6100    |        32 |
| (859) 373-0594   |        33 |
| (859)260-9404    |        33 |
| (859)260-9410    |        33 |
| 14082613555      |        34 |
| (606)947-8040    |        35 |
| (859) 955-0388   |        36 |
| (513)281-4700    |        37 |
| (859)281-1718    |        38 |
| (859) 971-8300   |        39 |
| (859)687-0099    |        40 |
+------------------+-----------+
35 rows in set (0.00 sec)
 */