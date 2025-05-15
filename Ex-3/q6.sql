WITH RECURSIVE connections AS (
    -- Step 1: get Menachem Begin
    SELECT 
        m.uid AS source_uid,
        m.uid AS current_uid,
        0 AS distance
    FROM 
        members m
    WHERE 
        m.name = 'Menachem Begin'

    UNION ALL

    -- Step 2: recursively find connected MKs
    SELECT 
        c.source_uid,
        mik2.uid AS current_uid,
        c.distance + 1 AS distance
    FROM 
        connections c
    JOIN 
        memberInKnesset mik1 ON mik1.uid = c.current_uid
    JOIN 
        memberInKnesset mik2 
            ON mik1.number = mik2.number 
            AND mik1.party = mik2.party
            AND mik2.uid <> c.current_uid
    WHERE 
        NOT EXISTS (
            SELECT 1 
            FROM connections prev 
            WHERE prev.current_uid = mik2.uid
        )
)
SELECT 
    m.uid,
    m.name
FROM 
    connections c
JOIN 
    members m ON c.current_uid = m.uid
WHERE 
    c.distance > 3
ORDER BY 
    m.uid;
