/*test for link https://sqlzoo.net/wiki/Using_Null */

/* 1 */
select name from teacher where dept IS NULL

/* 2 */
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)

/* 3 */
SELECT teacher.name, dept.name FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)

/* 4 */
SELECT teacher.name, dept.name FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)

/* 5 */
SELECT name, COALESCE(mobile, '07986 444 2266') from teacher

/* 6 */
SELECT teacher.name, COALESCE(dept.name, 'None') from teacher left join dept on dept.id =  teacher.dept

/* 7 */
SELECT count(name), count(mobile) from teacher

/* 8 */
SELECT dept.name, count(teacher.dept) FROM teacher RIGHT JOIN dept ON dept.id =  teacher.dept GROUP BY dept.name

/* 9 */
SELECT teacher.name , CASE WHEN teacher.dept = 1 OR teacher.dept = 2
                           THEN 'Sci'
                           ELSE 'Art'
                      END
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)

/* 10 */
SELECT teacher.name , CASE WHEN teacher.dept = 1 OR teacher.dept = 2
                           THEN 'Sci'
                           WHEN teacher.dept = 3
                           THEN 'Art'
                           ELSE 'None'
                      END
FROM teacher LEFT JOIN dept ON (teacher.dept = dept.id)
