#MySQL
#https://www.hackerrank.com/challenges/projects/problem

/*
Takeaways:

* datediff
* cross multiply
    ~ cross(sub1,sub2) = SELECT * FROM (sub1),(sub2)
*/

SELECT Start_Date, MIN(End_Date)
FROM 
    (SELECT Start_Date
    FROM Projects
    WHERE Start_Date not in
        (SELECT End_Date 
        FROM Projects)) as s,
    (SELECT End_Date
    FROM Projects
    WHERE End_Date not in 
        (SELECT Start_Date 
        FROM Projects)) as e
WHERE Start_Date<End_Date
GROUP BY Start_Date
ORDER BY datediff(MIN(End_Date), Start_Date), Start_Date;