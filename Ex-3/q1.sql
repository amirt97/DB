SELECT 
    number,
    COUNT(DISTINCT party) AS partyCount
FROM 
    memberInKnesset
GROUP BY 
    number
ORDER BY 
    number;
