SELECT m.name, mk.number
FROM members m
JOIN memberInKnesset mk ON m.uid = mk.uid
WHERE NOT EXISTS (
  SELECT 1
  FROM memberInKnesset mk2
  JOIN members m2 ON mk2.uid = m2.uid
  WHERE mk2.number = mk.number
    AND m2.birthYear < m.birthYear
)
ORDER BY mk.number, m.name;
