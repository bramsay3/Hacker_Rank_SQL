# MySQL
# https://www.hackerrank.com/challenges/symmetric-pairs/problem
/*
Takeaways:

* Using UNION ALL
* Aggrigations with HAVING

*/

 SELECT a, b
 FROM
    (SELECT func1.X AS a, func1.Y AS b
    FROM Functions func1
    JOIN Functions func2 ON func1.Y=func2.X
    WHERE func1.X=func2.Y
    AND func1.X!=func1.Y
    UNION ALL
    SELECT f.X AS a, f.Y AS b
    FROM Functions f
    WHERE f.X=f.Y
    GROUP BY f.X, f.Y
    HAVING count(*)>1) as sym
WHERE a<=b
ORDER BY a