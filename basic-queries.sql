-- Q1: Cities with population > 100000
SELECT *
FROM CITY
WHERE CountryCode = 'USA'
  AND Population > 100000;

-- Q2: City names with population > 120000
SELECT NAME
FROM CITY
WHERE CountryCode = 'USA'
  AND Population > 120000;

-- Q3: Query all columns for every row in the CITY table
SELECT *
FROM CITY;

-- Q4: Query all columns for a city with ID = 1661
SELECT *
FROM CITY
WHERE ID = 1661;

-- Q5: Query all attributes of every Japanese city
SELECT *
FROM CITY
WHERE CountryCode = 'JPN';

-- Q6: Query the names of all Japanese cities
SELECT NAME
FROM CITY
WHERE CountryCode = 'JPN';

-- Q7: Query a list of CITY and STATE from the STATION table
SELECT CITY, STATE
FROM STATION;

-- Q8: List of employee names in alphabetical order
SELECT name
FROM Employee
ORDER BY name;

-- Q9: Count of cities having population more than 100000
SELECT COUNT(*) AS CityCount
FROM CITY
WHERE Population > 100000;

-- Q10: Total population of all cities where District is California
SELECT SUM(Population) AS TotalPopulation
FROM CITY
WHERE District = 'California';

-- Q11: Average population of all cities where District is California
SELECT AVG(Population) AS AveragePopulation
FROM CITY
WHERE District = 'California';

-- Q12: Average population of all cities rounded down to the nearest integer
SELECT FLOOR(AVG(Population)) AS AveragePopulation
FROM CITY;

-- Q13: Sum of populations of all Japanese cities (CountryCode = 'JPN')
SELECT SUM(Population) AS TotalPopulation
FROM CITY
WHERE CountryCode = 'JPN';
