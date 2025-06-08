EXPLAIN ANALYZE
SELECT e1.year, e1.name, e1.state
FROM elected_officials e1
JOIN (
    SELECT year, MAX(votes) AS max_votes
    FROM elected_officials
    GROUP BY year
) e2 ON e1.year = e2.year AND e1.votes = e2.max_votes
ORDER BY e1.year, e1.name;
