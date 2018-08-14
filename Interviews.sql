# MySQL
# https://www.hackerrank.com/challenges/interviews/problem
/*
Takeaways:

* Understanding Multi-Table dynamics
* Complex Joins
* Only only group fields can be with aggregations in SELECT field

*/

SELECT cont.contest_id, cont.hacker_id, cont.name, agg.ts_sum, agg.tas_sum, agg.tv_sum, agg.tuv_sum
FROM Contests cont
JOIN
    (SELECT coll.contest_id, SUM(total_submissions) AS ts_sum, SUM(total_accepted_submissions) AS tas_sum, SUM(total_views) AS tv_sum, SUM(total_unique_views) AS tuv_sum
    FROM Colleges coll
    JOIN Challenges chall ON coll.college_id=chall.college_id
    JOIN View_Stats view ON chall.challenge_id=view.challenge_id
    JOIN Submission_Stats sub ON chall.challenge_id=sub.challenge_id
    GROUP BY contest_id
    ORDER BY contest_id ASC) AS agg
ON cont.contest_id=agg.contest_id
WHERE (agg.ts_sum<>0
    AND agg.tas_sum<>0
    AND agg.tv_sum<>0
    AND agg.tuv_sum<>0)