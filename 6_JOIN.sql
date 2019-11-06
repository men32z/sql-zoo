/*test for link https://sqlzoo.net/wiki/The_JOIN_operation */

/* 1 */
SELECT matchid, player FROM goal WHERE teamid = 'GER'

/* 2 */
SELECT id,stadium,team1,team2 FROM game where id = 1012

/* 3 */
SELECT player,teamid, stadium, mdate FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

/* 4 */
SELECT team1, team2, player FROM game JOIN goal ON (id=matchid) WHERE player LIKE 'Mario%'

/* 5 */
SELECT player, teamid, coach, gtime FROM goal inner join eteam on teamid=id WHERE gtime<=10

/* 6 */
SELECT mdate, teamname from game inner join eteam on game.team1 = eteam.id where coach = 'Fernando Santos'

/* 7 */
select player from goal inner join game on matchid = id where stadium = 'National Stadium, Warsaw'

/* 8 */
SELECT DISTINCT player FROM game JOIN goal ON matchid = id  WHERE (team1='GER' && teamid != 'GER') || (team2='GER' && teamid != 'GER')

/* 9 */
SELECT teamname, COUNT(matchid) FROM eteam JOIN goal ON id=teamid GROUP BY teamname

/* 10 */
SELECT stadium, COUNT(matchid) FROM game JOIN goal ON id=matchid GROUP BY stadium

/* 11 */
SELECT matchid, mdate, COUNT(matchid) FROM game JOIN goal ON matchid = id  WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY  matchid, mdate

/* 12 */
select matchid, mdate, COUNT(matchid) from game inner join goal on id=matchid where teamid='GER' GROUP BY matchid, mdate

/* 13 */
SELECT game.mdate,
       game.team1,
       SUM(CASE WHEN goal.teamid = game.team1
                THEN 1
                ELSE 0
           END)
       AS score1,
       game.team2,
       SUM(CASE WHEN goal.teamid = game.team2
                THEN 1
                ELSE 0
           END)
       AS score2
FROM game
LEFT JOIN goal ON goal.matchid = game.id
GROUP BY game.mdate, game.team1, game.team2
ORDER BY game.mdate