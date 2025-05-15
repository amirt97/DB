WITH party_counts AS (
    SELECT 
        number,
        party,
        COUNT(*) AS memberCount
    FROM 
        memberInKnesset
    GROUP BY 
        number, party
),
max_counts AS (
    SELECT 
        number,
        MAX(memberCount) AS maxCount
    FROM 
        party_counts
    GROUP BY 
        number
)
SELECT 
    pc.number,
    pc.party,
    pc.memberCount
FROM 
    party_counts pc
JOIN 
    max_counts mc 
    ON pc.number = mc.number AND pc.memberCount = mc.maxCount
ORDER BY 
    pc.number,
    pc.party;
