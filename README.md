# Group 3 Submission Document

[GitHub repo we used](https://github.com/jthoward64/cs405g-project-1)

## Deliverable 1

### Place all your your group members names and email contacts in your assignment.

- Michael Stacy: jmst231@uky.edu

- DeMarkus Butler: dlbu228@uky.edu

- Tag Howard: tag@jthoward.dev

- Keegan McCorkle: kjmc240@uky.edu

### Note in your submission if you did this Deliverable by Deliverable or read the complete assignment prior to starting.

We read the entire assignment prior to starting

## Deliverable 2

### Show the commands you used to build your table(s).

```sql
CREATE TABLE Entity_Table (
  Entity_ID INT NOT NULL AUTO_INCREMENT,
  Street_Name VARCHAR(50) NOT NULL,
  Zip varchar(5) NOT NULL,
  City varchar(128) NOT NULL,
  StateName char(2) NOT NULL,
  EntityName varchar(128) NOT NULL,
  PRIMARY KEY (Entity_ID)
);

CREATE TABLE Receipt_Table (
  Transaction_Number INT NOT NULL AUTO_INCREMENT,
  Seller_Key INT NOT NULL,
  Buyer_Key INT NOT NULL,
  Picture BLOB,
  Zip varchar(5) NOT NULL,
  StateName char(2) NOT NULL,
  Number_Of_Items INT NOT NULL,
  Total_Sales decimal(15, 2) NOT NULL,
  Highest_Price decimal(15, 2) NOT NULL,
  Lowest_Price decimal(15, 2) NOT NULL,
  PRIMARY KEY (Transaction_Number),
  FOREIGN KEY (Seller_Key) REFERENCES Entity_Table(Entity_ID),
  FOREIGN KEY (Buyer_Key) REFERENCES Entity_Table(Entity_ID)
);

CREATE TABLE Telephone_Numbers (
  Telephone_Number varchar(32) NOT NULL,
  Entity_ID INT NOT NULL,
  PRIMARY KEY (Telephone_Number),
  FOREIGN KEY (Entity_ID) REFERENCES Entity_Table(Entity_ID)
);
```

## Deliverable 3

### Show the commands you used to load your table(s).

```sql
INSERT INTO Entity_Table(Entity_ID, Street_Name, Zip, City, StateName, EntityName)
VALUES
(3, '82 Beaver St Room 1301', '10005', 'New York', 'NY', 'John Wick' );

INSERT INTO Entity_Table(Entity_ID, Street_Name, Zip, City, StateName, EntityName)
VALUES
(40, '4081 Finn Way', '40503', 'Lexington', 'KY', 'J. Alexander''s Restaurant' );
```

### Show two of the commands you used to load a receipt entity data into your table(s).

```sql
INSERT INTO Receipt_Table(Transaction_Number, Seller_Key, Buyer_Key, Picture, Zip, StateName, Total_Sales, Number_Of_Items,  Highest_Price, Lowest_Price)
VALUES
(1, 13, 1, NULL, '40503', 'KY', 25, 5, 5, 5);

INSERT INTO Receipt_Table(Transaction_Number, Seller_Key, Buyer_Key, Picture, Zip, StateName, Total_Sales, Number_Of_Items,  Highest_Price, Lowest_Price)
VALUES
(2, 33, 31, NULL, '40504', 'KY', 30, 5, 6.99, 3.49),
```

## Deliverable 4

### run show tables; from your database prompt after connecting to your database.

```sql
+-------------------+
| Tables_in_jtho264 |
+-------------------+
| Entity_Table      |
| Receipt_Table     |
| Telephone_Numbers |
+-------------------+
```

## Deliverable 5

### run select \* from <tablename>; where <tablename> is the name of the table(s) you created in your database.

```sql
SELECT * from Entity_Table;
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+
| Entity_ID | Street_Name                                   | Zip   | City             | StateName | EntityName                        |
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+
|         1 | 300 Rose Street Room 102 Hardymon Building    | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              |
|         2 | 301 Hilltop Avenue, Room 102                  | 40506 | Lexington        | KY        | Mr. Ray L. Hyatt Jr.              |
|         3 | 82 Beaver St Room 1301                        | 10005 | New York         | NY        | John Wick                         |
|         4 | 200 Park Avenue Penthouse                     | 10001 | New York         | NY        | Tony Stark                        |
|         5 | 117A Bleecker Street                          | 10001 | New York         | NY        | Dr. Stephen Strange               |
|         6 | 200 Park Avenue Apartment 221                 | 10001 | New York         | NY        | Bob C. Smith                      |
|         7 | #1 Avenue of Champions                        | 40506 | Lexington        | KY        | Bowman F. Wildcat                 |
|         8 | 200 Park Avenue                               | 40507 | Lexington        | KY        | Bob C. Smith                      |
|         9 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Bob Porter c/o Intech             |
|        10 | 1 Dead End Row Room 200                       | 12347 | Dallas           | TX        | Mr. Bob Sydell c/o Intech         |
|        11 | 2299 Richmond Rd                              | 40502 | Lexington        | KY        | Chick-fil-A                       |
|        12 | 471 Rose St                                   | 40508 | Lexington        | KY        | President Eli Capilouto           |
|        13 | 150 W Lowry Ln #190                           | 40503 | Lexington        | KY        | Kroger                            |
|        14 | 2161 Paul Jones Way                           | 40509 | Lexington        | KY        | Culver's                          |
|        15 | 1180 Seven Seas Dr                            | 32830 | Lake Buena Vista | FL        | Magic Kingdom Park                |
|        16 | 500 W New Circle Rd                           | 40511 | Lexington        | KY        | Walmart Supercenter               |
|        17 | 123 NotAReal St                               | 40502 | Lexington        | KY        | Tag Howard                        |
|        18 | 1600 Pennsylvania Ave NW                      | 20500 | Washington       | DC        | White House                       |
|        19 | 1400 Defense Pentagon                         | 20301 | Washington       | DC        | Pentagon                          |
|        20 | 101 Cochran Rd                                | 40502 | Lexington        | KY        | Joella's Hot Chicken              |
|        21 | 867 South Broadway                            | 40504 | Lexington        | KY        | Jersey Mike's Subs                |
|        22 | 700 Clark Ave                                 | 63102 | St. Louis        | MO        | Busch Stadium                     |
|        23 | Antarctic Support Contract 7400 S. Tucson Way | 80112 | Centennial       | CO        | Palmer Station (Antarctica)       |
|        24 | 1386 Lexington Rd                             | 40206 | Louisville       | KY        | Headliners Music Hall             |
|        25 | 867 South Broadway                            | 40504 | Lexington        | KY        | Miyako Poke Bowl                  |
|        26 | 899 Manchester St                             | 40508 | Lexington        | KY        | Manchester Music Hall             |
|        27 | 1649 M-32                                     | 49735 | Gaylord          | MI        | E-Free Church Gaylord Campus      |
|        28 | 7345 Delridge Way SW                          | 98106 | Seattle          | WA        | The Home Depot                    |
|        29 | 500 S Upper St STE 110                        | 40508 | Lexington        | KY        | Target                            |
|        30 | 211 NE Revere Avenue                          | 97701 | Bend             | OR        | Blockbuster                       |
|        31 | 1837 Plaudit Pl                               | 40509 | Lexington        | KY        | Michael Stacy                     |
|        32 | 525 Alakawa St                                | 96817 | Honolulu         | HI        | Costco Wholesale                  |
|        33 | 2021 Harrodsburg Rd                           | 40504 | Lexington        | KY        | The Home Depot                    |
|        34 | 2039 El Camino Real                           | 95050 | Santa Clara      | CA        | Patel Brothers                    |
|        35 | 918 Natural Bridge Rd                         | 40376 | Slade            | KY        | Thatcher Barbecue Company         |
|        36 | 867 S Broadway                                | 40504 | Lexington        | KY        | DV8 Kitchen                       |
|        37 | 3400 Vine St                                  | 45220 | Cincinnati       | OH        | Cincinnati Zoo & Botanical Garden |
|        38 | 417 E Maxwell St Unit B                       | 40508 | Lexington        | KY        | Kentucky Native Café              |
|        39 | 4055 Nichols Park Dr                          | 40503 | Lexington        | KY        | Lowe's                            |
|        40 | 4081 Finn Way                                 | 40503 | Lexington        | KY        | J. Alexander's Restaurant         |
+-----------+-----------------------------------------------+-------+------------------+-----------+-----------------------------------+
```

```sql
SELECT * from Receipt_Table;
+--------------------+------------+-----------+---------+-------+-----------+-----------------+-----------------+-----------------+-----------------+
| Transaction_Number | Seller_Key | Buyer_Key | Picture | Zip   | StateName | Number_Of_Items | Total_Sales     | Highest_Price   | Lowest_Price    |
+--------------------+------------+-----------+---------+-------+-----------+-----------------+-----------------+-----------------+-----------------+
|                  1 |         13 |         1 | NULL    | 40503 | KY        |               5 |           25.00 |            5.00 |            5.00 |
|                  2 |         33 |        31 | NULL    | 40504 | KY        |               5 |           30.00 |            6.99 |            3.49 |
|                  3 |         11 |         4 | NULL    | 40502 | KY        |               3 |           29.75 |           13.37 |            6.49 |
|                  4 |         29 |        17 | NULL    | 40509 | KY        |               5 |           36.04 |           12.00 |            2.89 |
|                  5 |         36 |         3 | NULL    | 40504 | KY        |               4 |           30.02 |           15.00 |            3.00 |
|                  6 |         13 |         5 | NULL    | 40503 | KY        |               5 |           22.10 |            6.49 |            0.24 |
|                  7 |         24 |        17 | NULL    | 40508 | KY        |               1 |           16.53 |           16.53 |           16.53 |
|                  8 |         13 |         2 | NULL    | 40503 | KY        |               5 |           47.44 |           23.00 |            4.49 |
|                  9 |         14 |        12 | NULL    | 40509 | KY        |               4 |           25.00 |            9.99 |            4.00 |
|                 10 |         15 |         9 | NULL    | 32830 | FL        |               6 |           78.25 |           15.99 |            9.99 |
|                 11 |         16 |         8 | NULL    | 40511 | KY        |               4 |           57.80 |           20.83 |           10.87 |
|                 12 |         29 |        17 | NULL    | 40508 | KY        |               6 |           80.97 |           30.67 |            5.87 |
|                 13 |         21 |        31 | NULL    | 40527 | KY        |               4 |           40.28 |           15.60 |            6.00 |
|                 14 |         22 |        31 | NULL    | 20500 | DC        |               2 |        36217.34 |        36213.35 |            3.99 |
|                 15 |         18 |        19 | NULL    | 20301 | DC        |               1 | 705392000000.00 | 705392000000.00 | 705392000000.00 |
+--------------------+------------+-----------+---------+-------+-----------+-----------------+-----------------+-----------------+-----------------+
15 rows in set (0.001 sec)
```

## Deliverable 6

### the query you wrote

```sql
Select EntityName, Concat(Street_Name, ", ", City, ", ", StateName, ", ", Zip) As "Full Address" FROM Entity_Table;
```

### the output it produced

## Deliverable 7

```sql
+-----------------------------------+----------------------------------------------------------------------+
| EntityName                        | Full Address                                                         |
+-----------------------------------+----------------------------------------------------------------------+
| Mr. Ray L. Hyatt Jr.              | 300 Rose Street Room 102 Hardymon Building, Lexington, KY, 40506     |
| Mr. Ray L. Hyatt Jr.              | 301 Hilltop Avenue, Room 102, Lexington, KY, 40506                   |
| John Wick                         | 82 Beaver St Room 1301, New York, NY, 10005                          |
| Tony Stark                        | 200 Park Avenue Penthouse, New York, NY, 10001                       |
| Dr. Stephen Strange               | 117A Bleecker Street, New York, NY, 10001                            |
| Bob C. Smith                      | 200 Park Avenue Apartment 221, New York, NY, 10001                   |
| Bowman F. Wildcat                 | #1 Avenue of Champions, Lexington, KY, 40506                         |
| Bob C. Smith                      | 200 Park Avenue, Lexington, KY, 40507                                |
| Bob Porter c/o Intech             | 1 Dead End Row Room 200, Dallas, TX, 12347                           |
| Mr. Bob Sydell c/o Intech         | 1 Dead End Row Room 200, Dallas, TX, 12347                           |
| Chick-fil-A                       | 2299 Richmond Rd, Lexington, KY, 40502                               |
| President Eli Capilouto           | 471 Rose St, Lexington, KY, 40508                                    |
| Kroger                            | 150 W Lowry Ln #190, Lexington, KY, 40503                            |
| Culver's                          | 2161 Paul Jones Way, Lexington, KY, 40509                            |
| Magic Kingdom Park                | 1180 Seven Seas Dr, Lake Buena Vista, FL, 32830                      |
| Walmart Supercenter               | 500 W New Circle Rd, Lexington, KY, 40511                            |
| Tag Howard                        | 123 NotAReal St, Lexington, KY, 40502                                |
| White House                       | 1600 Pennsylvania Ave NW, Washington, DC, 20500                      |
| Pentagon                          | 1400 Defense Pentagon, Washington, DC, 20301                         |
| Joella's Hot Chicken              | 101 Cochran Rd, Lexington, KY, 40502                                 |
| Jersey Mike's Subs                | 867 South Broadway, Lexington, KY, 40504                             |
| Busch Stadium                     | 700 Clark Ave, St. Louis, MO, 63102                                  |
| Palmer Station (Antarctica)       | Antarctic Support Contract 7400 S. Tucson Way, Centennial, CO, 80112 |
| Headliners Music Hall             | 1386 Lexington Rd, Louisville, KY, 40206                             |
| Miyako Poke Bowl                  | 867 South Broadway, Lexington, KY, 40504                             |
| Manchester Music Hall             | 899 Manchester St, Lexington, KY, 40508                              |
| E-Free Church Gaylord Campus      | 1649 M-32, Gaylord, MI, 49735                                        |
| The Home Depot                    | 7345 Delridge Way SW, Seattle, WA, 98106                             |
| Target                            | 500 S Upper St STE 110, Lexington, KY, 40508                         |
| Blockbuster                       | 211 NE Revere Avenue, Bend, OR, 97701                                |
| Michael Stacy                     | 1837 Plaudit Pl, Lexington, KY, 40509                                |
| Costco Wholesale                  | 525 Alakawa St, Honolulu, HI, 96817                                  |
| The Home Depot                    | 2021 Harrodsburg Rd, Lexington, KY, 40504                            |
| Patel Brothers                    | 2039 El Camino Real, Santa Clara, CA, 95050                          |
| Thatcher Barbecue Company         | 918 Natural Bridge Rd, Slade, KY, 40376                              |
| DV8 Kitchen                       | 867 S Broadway, Lexington, KY, 40504                                 |
| Cincinnati Zoo & Botanical Garden | 3400 Vine St, Cincinnati, OH, 45220                                  |
| Kentucky Native Café              | 417 E Maxwell St Unit B, Lexington, KY, 40508                        |
| Lowe's                            | 4055 Nichols Park Dr, Lexington, KY, 40503                           |
| J. Alexander's Restaurant         | 4081 Finn Way, Lexington, KY, 40503                                  |
+-----------------------------------+----------------------------------------------------------------------+
```

### Show the command you used to modify the table(s)

```sql
ALTER TABLE Entity_Table
ADD Primary_Telephone_Number varchar(32);

ALTER TABLE Entity_Table
ADD CONSTRAINT fk_Telephone_Number
FOREIGN KEY (Primary_Telephone_Number) REFERENCES Telephone_Numbers(Telephone_Number);
```

### Show the command(s) you used to modify the entities when you added the phone numbers

```sql
-- Primary phone numbers
INSERT INTO Telephone_Numbers(Telephone_Number ,  Entity_ID)
VALUES
('555-555-5555', 3),
('555-555-3142', 4),
('(555)555-4321', 5),
('(859)335-9856', 11),
('859-257-1701', 12),
('(859) 278-6228', 13),
('(859)263-7777', 14),
('(407)939-5277', 15),
('(859)381-9370', 16),
('(859)684-8444', 17),
('(202)456-1414', 18),
('(703)697-1776', 19),
('(859) 269-9593', 20),
('(859)288-0008', 21),
('13143459600', 22),
('(502) 584-8088', 24),
('(859)469-9098', 25),
('(859) 537-7321', 26),
('19897322647', 27),
('12067622126', 28),
('18592863352', 29),
('(541)385-9111', 30),
('(859)789-0812', 31),
('(808)526-6100', 32),
('(859) 373-0594', 33),
('14082613555', 34),
('(606)947-8040', 35),
('(859) 955-0388', 36),
('(513)281-4700', 37),
('(859)281-1718', 38),
('(859) 971-8300', 39),
('(859)687-0099', 40);

-- Citation:https://stackoverflow.com/questions/2015527/copy-one-column-from-one-table-to-another
-- UPDATE results, build
-- SET    results.platform_to_insert = build.correct_platform
-- WHERE  results.BuildID = build.BuildID

UPDATE Entity_Table, Telephone_Numbers
SET Entity_Table.Primary_Telephone_Number = Telephone_Numbers.Telephone_Number
WHERE Entity_Table.Entity_ID = Telephone_Numbers.Entity_ID;

-- Other phone numbers
INSERT INTO Telephone_Numbers(Telephone_Number ,  Entity_ID)
VALUES
('1-800-591-3869', 29),
('(859)260-9410', 33),
('(859)260-9404', 33);
```

### Show the select statement(s) you wrote

```sql
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
```

### Show the output your queries produced

```sql
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
```

### Show the output from select \* from <tablename> for each of your tables.

```sql
SELECT * from Entity_Table;
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
```

```sql
SELECT * from Receipt_Table;
+--------------------+------------+-----------+------------------+-------+-----------+-----------------+-----------------+-----------------+-----------------+
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
```

```sql
SELECT * from Telephone_Numbers;
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
```

## Deliverable 8

### the query you wrote

```sql
SELECT
    Buyer.EntityName AS "Customer name",
    Seller.EntityName AS "Business Name",
    ReceiptTable.Highest_Price AS "Highest Price",
    ReceiptTable.Total_Sales AS "Total Sale",
    ReceiptTable.StateName AS "State"
FROM Receipt_Table AS ReceiptTable
INNER JOIN Entity_Table AS Seller ON ReceiptTable.Seller_Key = Seller.Entity_ID
INNER JOIN Entity_Table AS Buyer ON ReceiptTable.Buyer_Key = Buyer.Entity_ID;
```

### the output it produced

```sql
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
```

## Deliverable 9

### the query you wrote

```sql
SELECT EntityName FROM Entity_Table
WHERE EntityName LIKE '%bob%';
```

### the output it produced

```sql
+---------------------------+
| EntityName                |
+---------------------------+
| Bob C. Smith              |
| Bob C. Smith              |
| Bob Porter c/o Intech     |
| Mr. Bob Sydell c/o Intech |
+---------------------------+
```

## Deliverable 10

### the query you wrote

```sql
SELECT Zip , Total_Sales FROM Receipt_Table
ORDER BY Total_Sales DESC;
```

### the output it produced

```sql
+-------+-----------------+
| Zip   | Total_Sales     |
+-------+-----------------+
| 20301 | 705392000000.00 |
| 20500 |        36217.34 |
| 40508 |           80.97 |
| 32830 |           78.25 |
| 40511 |           57.80 |
| 40503 |           47.44 |
| 40527 |           40.28 |
| 40509 |           36.04 |
| 40504 |           30.02 |
| 40504 |           30.00 |
| 40502 |           29.75 |
| 40509 |           25.00 |
| 40503 |           25.00 |
| 40503 |           22.10 |
| 40508 |           16.53 |
+-------+-----------------+
```

## Deliverable 11

### Show the commands you used to do this and place these in your submission.

```bash
/usr/bin/mysqldump -h mysql.cs.uky.edu -p -u jtho264 --single-transaction --databases jtho264 > cs405.group3.sql
```

## Deliverable 12

The information we had at hand influenced this project in many ways. As mentioned in deliverable 1, we chose to read the full assignment before starting. This was done because we wanted to ensure we understood the complexities of the assignment before starting and could ensure our work met all of the project requirements. Because of this, we formatted our receipt table to include the highest and lowest valued items in the beginning. If we did not have this information initially, we may not have included these values in the initial table creation.
Despite having read the entire assignment, our characteristic college student haste did mean we missed or misinterpreted some details of the assignment initially. For example, our initial design did not include the ability to store multiple phone numbers per entity. To address this simply (and without needing to change too much else), we repurposed our initial phone number column as a ‘primary’ phone number column and made it a foreign key to a new table. This new table stored all phone numbers and only had a primary key to store the number and a foreign key for the entity’s ID.
From the above, we see that information availability can influence how projects are designed and completed. At times, like in the first example, this previous knowledge helped our team complete the project more efficiently. However, if too much information is presented at once, important details can be missed. This occurred with our team in the second example. Overall, there needs to be a balance between providing enough information to complete tasks without overloading teams with details.
