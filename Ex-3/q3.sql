SELECT 
    m.name
FROM 
    memberInKnesset mik
JOIN 
    members m ON mik.uid = m.uid
GROUP BY 
    mik.uid, m.name
HAVING 
    COUNT(DISTINCT mik.number) >= 5
    AND COUNT(DISTINCT mik.party) = 1
ORDER BY 
    m.name;
