SELECT DISTINCT name
FROM members
NATURAL JOIN (
    SELECT uid
    FROM memberInKnesset
    EXCEPT
    SELECT m1.uid
    FROM memberInKnesset m1, memberInKnesset m2
    WHERE m1.number <> m2.number AND m1.uid = m2.uid
) AS t
WHERE birthPlace = 'Jerusalem'
ORDER BY name;
