Select
  EntityName,
  Concat (
    Street_Name,
    ", ",
    City,
    ", ",
    StateName,
    ", ",
    Zip
  ) As "Full Address"
FROM
  Entity_Table;

/*
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
 */