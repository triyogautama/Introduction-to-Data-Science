# This project is a compilation of the simple use of mySql script that covers; USE, SELECT-FROM, DISTINCT, ORDER BY, LIMIT, COUNT, SUM, AVERAGE, WHERE, LIKE, conditional WHERE, BETWEEN, NOT BETWEEN, GROUP BY, HAVING , AS. For this project, world database is used
use world;

# Show all content of table city
SELECT * 
FROM city;

# Show distict name from name column from table city
SELECT DISTINCT name
FROM city;

# show distict name from name column sorted Descending from table city
SELECT DISTINCT name
FROM city
ORDER BY name DESC;

# show top 10 distict name from name column sorted Ascending from table city
SELECT DISTINCT name
FROM city
ORDER BY name ASC
LIMIT 10;

#Show top 8 distinct name and its continent Descending from table country
SELECT DISTINCT name, continent
FROM country
ORDER BY name DESC
LIMIT 8;

# Count number of distinct name from name column from table city
SELECT COUNT(DISTINCT name) as total_city
FROM city;


# Count number of distict country name from table country
SELECT COUNT(DISTINCT name) as total_country
FROM country;

# Sum is mostly used in numerical value, here we want to sum up the total population of the country table
SELECT SUM(population)
FROM country;

# Sum up the total GNP of the country table
SELECT SUM(GNP)
FROM country;

# Average the population of the country table
SELECT AVG(population)
FROM country;

# Average the lifeExpectancy of the country table
SELECT AVG(LifeExpectancy)
FROM country;

# Filter the result of the select method using WHERE. Here, we only want to show distinct name of the city which initiated by 'A' from table city
SELECT DISTINCT name
FROM city
WHERE name LIKE 'A%';

# Show distinct name of the country that ended by 'RA' from table country
SELECT DISTINCT name
FROM country
WHERE name LIKE '%RA';

# Show distinct name of the country that having by 'AND' in the middle from table country
SELECT DISTINCT name
FROM country
WHERE name LIKE '%AND%';

# Show distinct name of the country and its population that having population more than 10.000.000 from table country
SELECT DISTINCT name, population
FROM country
WHERE population>10000000;

# Show distinct name of the country, its population, and lifeexpectancy that having life expectancy above average from table country
SELECT DISTINCT name, population, lifeexpectancy
FROM country
WHERE lifeexpectancy > (SELECT AVG(lifeexpectancy) from country);

# Show distinct name of the country, its GNP, and lifeexpectancy that having GNP below or same as average from table country sorted by name DESC
SELECT DISTINCT name, gnp, lifeexpectancy
FROM country
WHERE gnp <= (SELECT AVG(gnp) from country)
ORDER BY name DESC;

# Show 10 distinct name of the country, its GNP, and lifeexpectancy that having GNP above average from table country sorted by name(1) ASC
SELECT DISTINCT name, gnp, lifeexpectancy
FROM country
WHERE gnp > (SELECT AVG(gnp) from country)
ORDER BY 1 ASC
LIMIT 10;

# Show 7 distinct name of the city, its country code, and population that having population between 5.000.000 and 10.000.000 from table city sorted by name(1) ASC
SELECT DISTINCT name, countrycode, population
FROM city
WHERE population BETWEEN 5000000 AND 10000000
ORDER BY 1 ASC
LIMIT 7;

# Show 15 ID, distinct name of the city, its country code, and population that having Id index 15 AND 35 from table city sorted by name(1) ASC
SELECT DISTINCT name, id, countrycode, population
FROM city
WHERE id BETWEEN 15 AND 35
ORDER BY 2 ASC
LIMIT 15;

# Show distinct name of the city, its country code, and population that having Id index not between 15 AND 35 from table city sorted by name(1) ASC
SELECT DISTINCT name, id, countrycode, population
FROM city
WHERE id NOT BETWEEN 15 AND 35
ORDER BY 2 ASC;

# Group by-show name of the region, total country for each region, and total population of each region that having population is above average sorted by region ASC from table country
SELECT region, COUNT(name), sum(population)
FROM country
WHERE population > (SELECT AVG(population) FROM country)
GROUP BY 1
ORDER BY 1 ASC;




# AS-show Continent, the total population of each continent alias sum_of_population, total country of each continent alias sum_of_country, and total GNP alias sum_of_GNP of each continent which continent is having 'AMERICA' sort by total population DESC
SELECT continent, SUM(population) AS sum_of_population, COUNT(name) AS sum_of_country, SUM(GNP) AS sum_of_GNP
FROM country
WHERE continent LIKE '%America'
GROUP BY 1
ORDER BY 2 DESC;

# Having-used as second filter after where clause that placed only after grouping.  this script is used to show average population (alias avg_population) and city name that located in USA grouped by city name and having avg_population more than 500.000, then sorted by its total population ASC from table city
SELECT AVG(population) AS avg_population, name AS city_name
FROM city
WHERE countrycode = 'USA'
GROUP BY 2
HAVING avg_population > 500000
ORDER BY 1 ASC; 