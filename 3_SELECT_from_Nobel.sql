/*test for link https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial */

/* 1 */
SELECT yr, subject, winner FROM nobel WHERE yr = 1950

/* 2 */
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'

/* 3 */
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'

/* 4 */
SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000

/* 5 */
SELECT * FROM nobel WHERE subject = 'Literature ' AND yr >= 1980 AND yr <= 1989

/* 6 */
SELECT * FROM nobel WHERE winner IN ('Barack Obama', 'Jimmy Carter', 'Woodrow Wilson', 'Theodore Roosevelt')

/* 7 */
SELECT winner FROM nobel WHERE winner like 'John%'

/* 8 */
SELECT yr, subject, winner FROM nobel WHERE (subject = 'Physics ' AND yr=1980) OR (subject = 'Chemistry ' AND yr=1984)

/* 9 */
SELECT yr, subject, winner FROM nobel WHERE yr=1980 AND subject != 'Medicine' AND subject != 'Chemistry'

/* 10 */
SELECT yr, subject, winner FROM nobel WHERE (subject = 'Medicine' AND yr<1910) OR (subject = 'Literature' AND yr>=2004)

/* 11 */
SELECT * FROM nobel WHERE winner like 'PETER GR_NBERG'

/* 12 */
SELECT * FROM nobel WHERE winner = 'EUGENE O\'NEILL '

/* 13 */
SELECT winner, yr, subject FROM nobel WHERE winner like 'Sir%'

/* 14 */
SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'), subject, winner
