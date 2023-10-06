-- mySQL instructions: https://www.cs.uky.edu/docs/users/mysql.html
-- `mysql -h mysql.cs.uky.edu -p -u LINKBLUE` and copy-paste the contents of this file into the terminal
-- OR `mysql -h mysql.cs.uky.edu -p -u LINKBLUE < Project%201.sql` to run this file directly

USE jtho264; -- Your DB table name here (same as your linkblue)

ALTER TABLE Entity_Table
DROP FOREIGN KEY fk_Telephone_Number;
DROP TABLE IF EXISTS Receipt_Table;
DROP TABLE IF EXISTS Telephone_Numbers;
DROP TABLE IF EXISTS Entity_Table;

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
  Total_Sales decimal(15 , 2) NOT NULL,
  Highest_Price decimal(15 , 2) NOT NULL,
  Lowest_Price decimal(15 , 2) NOT NULL,
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

INSERT INTO Entity_Table(Entity_ID ,  Street_Name ,  Zip ,  City ,  StateName ,  EntityName)
VALUES
(1 , '300 Rose Street Room 102 Hardymon Building' , '40506' , 'Lexington' , 'KY' , 'Mr. Ray L. Hyatt Jr.' ),
(2 , '301 Hilltop Avenue, Room 102' , '40506' , 'Lexington' , 'KY' , 'Mr. Ray L. Hyatt Jr.' ),
(3 , '82 Beaver St Room 1301' , '10005' , 'New York' , 'NY' , 'John Wick' ),
(4 , '200 Park Avenue Penthouse' , '10001' , 'New York' , 'NY' , 'Tony Stark' ),
(5 , '117A Bleecker Street' , '10001' , 'New York' , 'NY' , 'Dr. Stephen Strange' ),
(6 , '200 Park Avenue Apartment 221' , '10001' , 'New York' , 'NY' , 'Bob C. Smith' ),
(7 , '#1 Avenue of Champions' , '40506' , 'Lexington' , 'KY' , 'Bowman F. Wildcat' ),
(8 , '200 Park Avenue' , '40507' , 'Lexington' , 'KY' , 'Bob C. Smith' ),
(9 , '1 Dead End Row Room 200' , '12347' , 'Dallas' , 'TX' , 'Bob Porter c/o Intech' ),
(10 , '1 Dead End Row Room 200' , '12347' , 'Dallas' , 'TX' , 'Mr. Bob Sydell c/o Intech' ),
(11 , '2299 Richmond Rd' , '40502' , 'Lexington' , 'KY' , 'Chick-fil-A' ),
(12 , '471 Rose St' , '40508' , 'Lexington' , 'KY' , 'President Eli Capilouto' ),
(13 , '150 W Lowry Ln #190' , '40503' , 'Lexington' , 'KY' , 'Kroger' ),
(14 , '2161 Paul Jones Way' , '40509' , 'Lexington' , 'KY' , 'Culver''s' ),
(15 , '1180 Seven Seas Dr' , '32830' , 'Lake Buena Vista' , 'FL' , 'Magic Kingdom Park' ),
(16 , '500 W New Circle Rd' , '40511' , 'Lexington' , 'KY' , 'Walmart Supercenter' ),
(17 , '123 NotAReal St' , '40502' , 'Lexington' , 'KY' , 'Tag Howard' ),
(18 , '1600 Pennsylvania Ave NW' , '20500' , 'Washington' , 'DC' , 'White House' ),
(19 , '1400 Defense Pentagon' , '20301' , 'Washington' , 'DC' , 'Pentagon' ),
(20 , '101 Cochran Rd' , '40502' , 'Lexington' , 'KY' , 'Joella''s Hot Chicken' ),
(21 , '867 South Broadway' , '40504' , 'Lexington' , 'KY' , 'Jersey Mike''s Subs' ),
(22 , '700 Clark Ave' , '63102' , 'St. Louis' , 'MO' , 'Busch Stadium' ),
(23 , 'Antarctic Support Contract 7400 S. Tucson Way' , '80112' , 'Centennial' , 'CO' , 'Palmer Station (Antarctica)' ),
(24 , '1386 Lexington Rd' , '40206' , 'Louisville' , 'KY' , 'Headliners Music Hall' ),
(25 , '867 South Broadway' , '40504' , 'Lexington' , 'KY' , 'Miyako Poke Bowl' ),
(26 , '899 Manchester St' , '40508' , 'Lexington' , 'KY' , 'Manchester Music Hall' ),
(27 , '1649 M-32' , '49735' , 'Gaylord' , 'MI' , 'E-Free Church Gaylord Campus' ),
(28 , '7345 Delridge Way SW' , '98106' , 'Seattle' , 'WA' , 'The Home Depot' ),
(29 , '500 S Upper St STE 110' , '40508' , 'Lexington' , 'KY' , 'Target' ),
(30 , '211 NE Revere Avenue' , '97701' , 'Bend' , 'OR' , 'Blockbuster' ),
(31 , '1837 Plaudit Pl' , '40509' , 'Lexington' , 'KY' , 'Michael Stacy' ),
(32 , '525 Alakawa St' , '96817' , 'Honolulu' , 'HI' , 'Costco Wholesale' ),
(33 , '2021 Harrodsburg Rd' , '40504' , 'Lexington' , 'KY' , 'The Home Depot' ),
(34 , '2039 El Camino Real' , '95050' , 'Santa Clara' , 'CA' , 'Patel Brothers' ),
(35 , '918 Natural Bridge Rd' , '40376' , 'Slade' , 'KY' , 'Thatcher Barbecue Company' ),
(36 , '867 S Broadway' , '40504' , 'Lexington' , 'KY' , 'DV8 Kitchen' ),
(37 , '3400 Vine St' , '45220' , 'Cincinnati' , 'OH' , 'Cincinnati Zoo & Botanical Garden' ),
(38 , '417 E Maxwell St Unit B' , '40508' , 'Lexington' , 'KY' , 'Kentucky Native Café' ),
(39 , '4055 Nichols Park Dr' , '40503' , 'Lexington' , 'KY' , 'Lowe''s' ),
(40 , '4081 Finn Way' , '40503' , 'Lexington' , 'KY' , 'J. Alexander''s Restaurant' );

INSERT INTO Receipt_Table(Transaction_Number ,  Seller_Key ,  Buyer_Key ,  Picture ,  Zip ,  StateName ,  Total_Sales, Number_Of_Items,  Highest_Price ,  Lowest_Price)
VALUES
(1 , 13 , 1 , NULL , '40503' , 'KY' , 25 , 5 , 5 , 5),
(2 , 33 , 31 , NULL , '40504' , 'KY' , 30 , 5 , 6.99 , 3.49),
(3 , 11 , 4 , NULL , '40502' , 'KY' , 29.75 , 3 , 13.37 , 6.49),
(4 , 29 , 17 , NULL , '40509' , 'KY' , 36.04 , 5 , 12 , 2.89),
(5 , 36 , 3 , NULL , '40504' , 'KY' , 30.02 , 4 , 15 , 3),
(6 , 13 , 5 , NULL , '40503' , 'KY' , 22.1 , 5 , 6.49 , 0.24),
(7 , 24 , 17 , NULL , '40508' , 'KY' , 16.53 , 1 , 16.53 , 16.53),
(8 , 13 , 2 , NULL , '40503' , 'KY' , 47.44 , 5 , 23 , 4.49),
(9 , 14 , 12 , NULL , '40509' , 'KY' , 25 , 4 , 9.99 , 4),
(10 , 15 , 9 , NULL , '32830' , 'FL' , 78.25 , 6 , 15.99 , 9.99),
(11 , 16 , 8 , NULL , '40511' , 'KY' , 57.8 , 4 , 20.83 , 10.87),
(12 , 29 , 17 , NULL , '40508' , 'KY' , 80.97 , 6 , 30.67 , 5.87),
(13 , 21 , 31 , NULL , '40527' , 'KY' , 40.28 , 4 , 15.6 , 6),
(14 , 22 , 31 , NULL , '20500' , 'DC' , 36217.34 , 2 , 36213.35 , 3.99),
(15 , 18 , 19 , NULL , '20301' , 'DC' , 705392000000.00 , 1 , 705392000000.00 , 705392000000.00);

ALTER TABLE Entity_Table
ADD Primary_Telephone_Number varchar(32);

ALTER TABLE Entity_Table
ADD CONSTRAINT fk_Telephone_Number
FOREIGN KEY (Primary_Telephone_Number) REFERENCES Telephone_Numbers(Telephone_Number);

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


-- Example:
SELECT * from Entity_Table LEFT  JOIN Telephone_Numbers ON Telephone_Numbers.Entity_ID = Entity_Table.Entity_ID;







