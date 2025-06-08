SELECT DISTINCT e1.year, e1.eng_name
FROM enrollment e1
WHERE (year, students5_estimated) IN (
    SELECT year, MAX(students5_estimated)
    FROM enrollment e2
    GROUP BY year
)
ORDER BY year, eng_name;
