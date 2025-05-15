SELECT 
    number, 
    AVG(startYear - birthYear) AS avgAge
FROM 
    knessets 
NATURAL JOIN 
    memberInKnesset 
NATURAL JOIN 
    members
GROUP BY 
    number
ORDER BY 
    number;
