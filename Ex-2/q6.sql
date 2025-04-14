SELECT DISTINCT name
FROM members m1
WHERE NOT EXISTS (
    SELECT *
    FROM memberInKnesset mk2
    NATURAL JOIN members m2
    NATURAL JOIN knessets k2
    WHERE m2.name = 'David Ben-Gurion'
      AND mk2.party = 'Mapai'
      AND number NOT IN (
          SELECT number
          FROM memberInKnesset mk3
          WHERE mk3.uid = m1.uid AND mk3.party = 'Mapai'
      )
)
ORDER BY name;
