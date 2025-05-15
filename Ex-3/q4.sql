WITH partySize(number, party, psize) AS (
    SELECT 
        number, 
        party, 
        COUNT(DISTINCT uid) AS psize
    FROM 
        memberInKnesset
    GROUP BY 
        number, party
)
SELECT 
    number, 
    party, 
    psize AS memberCount
FROM 
    partySize p1
WHERE 
    psize >= ALL (
        SELECT 
            p2.psize
        FROM 
            partySize p2
        WHERE 
            p1.number = p2.number
    )
ORDER BY 
    number, party;
