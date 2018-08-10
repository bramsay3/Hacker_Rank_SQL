# MySQL
# https://www.hackerrank.com/challenges/placements/problem

/*
Takeaways:

* Multi-Join
* Join same table twice

*/

SELECT name
FROM students s
JOIN friends f ON s.ID=f.ID
JOIN packages p1 ON f.ID=p1.ID
JOIN packages p2 ON f.friend_ID=p2.ID
WHERE p1.salary<p2.salary
ORDER BY p2.salary ASC;