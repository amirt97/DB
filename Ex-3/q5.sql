WITH party_gender_counts AS (
    SELECT 
        mik.number,
        mik.party,
        COUNT(*) AS totalCount,
        SUM(CASE WHEN m.gender = 'female' THEN 1 ELSE 0 END) AS femaleCount
    FROM 
        memberInKnesset mik
    JOIN 
        members m ON mik.uid = m.uid
    GROUP BY 
        mik.number, mik.party
)
SELECT 
    party_gender_counts.party,
    party_gender_counts.number,
    (party_gender_counts.femaleCount * 100) / party_gender_counts.totalCount AS femalePercent
FROM 
    party_gender_counts
WHERE 
    (party_gender_counts.femaleCount * 100) / party_gender_counts.totalCount >= 30
ORDER BY 
    party_gender_counts.party,
    party_gender_counts.number;
