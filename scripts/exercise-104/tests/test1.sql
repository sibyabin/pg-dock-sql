-- SET search_path to exercise_104;

SELECT 'expected' as type, * FROM expected
UNION ALL
SELECT 'actual' as type, * FROM solution