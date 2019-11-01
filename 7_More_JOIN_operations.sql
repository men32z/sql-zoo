/*test for link https://sqlzoo.net/wiki/The_JOIN_operation */

/* 1 */
SELECT id, title FROM movie WHERE yr=1962

/* 2 */
SELECT yr FROM movie WHERE title='Citizen Kane'

/* 3 */
SELECT id, title, yr FROM movie where title like '%Star Trek%' order by 'yr'

/* 4 */
select id from actor where name = 'Glenn Close'

/* 5 */
select id from movie where title = 'Casablanca'

/* 6 */
select actor.name from casting inner join actor on actor.id = casting.actorid inner join movie on movie.id = casting.movieid where movie.title =  'Casablanca'

/* 7 */
select actor.name from casting inner join actor on actor.id = casting.actorid inner join movie on movie.id = casting.movieid where movie.title =  'Alien'

/* 8 */
select movie.title from casting inner join actor on actor.id = casting.actorid inner join movie on movie.id = casting.movieid where actor.name = 'Harrison Ford'

/* 9 */
select movie.title from casting inner join actor on actor.id = casting.actorid inner join movie on movie.id = casting.movieid where actor.name = 'Harrison Ford' && casting.ord != 1

/* 10 */
select movie.title, actor.name from casting inner join actor on actor.id = casting.actorid inner join movie on movie.id = casting.movieid where  casting.ord = 1 && movie.yr = 1962

/* 11 */
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

/* 12 */
SELECT movie.title, actor.name FROM casting
INNER JOIN movie ON movie.id  = casting.movieid
INNER JOIN actor ON actor.id = casting.actorid
WHERE movieid IN (
  SELECT movieid FROM casting INNER JOIN actor ON actor.id = casting.actorid
  WHERE name='Julie Andrews')
AND casting.ord = 1

/* 13 */
SELECT actor.name FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(ord) >= 30

/* 14 */
SELECT movie.title, COUNT(actorid) FROM
  movie JOIN casting ON movie.id=movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(actorid) desc, movie.title asc

/* 15 */
SELECT actor.name FROM casting INNER JOIN actor ON actor.id = casting.actorid
WHERE movieid IN(select movieid from casting inner join actor on actor.id = casting.actorid where actor.name =  'Art Garfunkel')
AND actor.name !='Art Garfunkel'
