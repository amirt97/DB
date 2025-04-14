SELECT DISTINCT m.name, mik.party
FROM members m
JOIN memberInKnesset mik ON m.uid = mik.uid
WHERE mik.number = 1
ORDER BY m.name, mik.party;
