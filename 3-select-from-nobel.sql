SELECT * FROM nobel WHERE yr = 1950;

SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature';

SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein';

SELECT winner FROM nobel WHERE yr >= 2000 AND subject = 'Peace';

SELECT * FROM nobel WHERE subject = 'Literature' and yr >= 1980 and yr < 1990;

SELECT * FROM nobel WHERE winner
IN ('Barack Obama', 'Woodrow Wilson', 'Jimmy Carter', 'Theodore Roosevelt');

SELECT winner FROM nobel WHERE winner LIKE 'John%';

SELECT * FROM nobel
WHERE (subject = 'Physics' AND yr = 1980)
  OR (subject = 'Chemistry' AND yr = 1984);

SELECT * FROM nobel
WHERE yr = 1980 and subject != 'Medicine' and subject != 'Chemistry';

SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
  OR (subject = 'Literature' AND yr >= 2004);

SELECT * FROM nobel
WHERE winner = 'Peter Grünberg';

SELECT * FROM nobel
WHERE winner = 'Eugene O''Neill';

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner ASC;

SELECT winner, subject FROM nobel
WHERE yr=1984
ORDER BY (subject IN ('Chemistry', 'Physics')), subject, winner;
