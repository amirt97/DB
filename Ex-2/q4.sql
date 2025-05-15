SELECT DISTINCT name
FROM members
NATURAL JOIN memberInKnesset
WHERE number = 23
  AND gender = 'female'
  AND occupation <> 'politician'
  AND uid IN (
    SELECT uid
    FROM memberInKnesset
    WHERE number = 24
  )
ORDER BY name;
