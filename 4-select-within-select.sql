SELECT name FROM world
WHERE population >
  (SELECT population FROM world
   WHERE name='Russia');

SELECT name FROM world
WHERE continent = 'Europe' AND gdp / population >
  (SELECT gdp / population FROM world WHERE name = 'United Kingdom');

SELECT name, continent FROM world
WHERE continent IN
  ((SELECT continent FROM world WHERE name = 'Argentina')
  ,(SELECT continent FROM world WHERE name = 'Australia'))
ORDER BY name;

SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
  AND population < (SELECT population FROM world WHERE name = 'Poland');

SELECT name, CONCAT(ROUND(population * 100/
               (SELECT population FROM world WHERE name = 'Germany'), 0), '%')

FROM world
WHERE continent = 'Europe';

SELECT name FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe' AND gdp > 0);

SELECT continent, NAME, area FROM world
WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent);

SELECT continent, NAME from world
WHERE name IN (SELECT MIN(name) FROM world GROUP BY continent);

SELECT name, continent, population FROM world
WHERE continent in
  (SELECT continent FROM
    (SELECT continent, MAX(population) AS max_population
      FROM world GROUP BY continent) AS pops WHERE max_population < 25000000);

#TODO 10
