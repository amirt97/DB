SELECT DISTINCT name
FROM members
WHERE educatedAt = 'Hebrew University of Jerusalem'
  AND birthYear > 1970
ORDER BY name;
