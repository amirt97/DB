SELECT 
    mik.number,
    AVG(k.startYear - m.birthYear) AS avgAge
FROM 
    memberInKnesset mik
JOIN 
    members m ON mik.uid = m.uid
JOIN 
    knessets k ON mik.number = k.number
GROUP BY 
    mik.number
ORDER BY 
    mik.number;
