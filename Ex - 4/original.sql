EXPLAIN ANALYZE
SELECT DISTINCT e1.year, e1.name, e1.state
FROM elected_officials e1
WHERE votes = (
  SELECT MAX(votes)
  FROM elected_officials e2
  WHERE e2.year = e1.year
)
ORDER BY year;
