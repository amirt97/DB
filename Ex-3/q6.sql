WITH RECURSIVE memberNum(uid, num) AS (
    SELECT DISTINCT 
        uid, 
        0 
    FROM 
        members 
    WHERE 
        name = 'Menachem Begin'

    UNION

    SELECT 
        m1.uid, 
        num + 1
    FROM 
        memberInKnesset m1, 
        memberInKnesset m2 
        NATURAL JOIN memberNum mn
    WHERE 
        m1.number = m2.number 
        AND m1.party = m2.party 
        AND mn.num < 3
)
SELECT DISTINCT 
    name
FROM 
    members
WHERE 
    uid NOT IN (SELECT uid FROM memberNum)
ORDER BY 
    name;
