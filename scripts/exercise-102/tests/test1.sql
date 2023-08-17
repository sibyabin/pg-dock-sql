SET SEARCH_PATH TO exercise_102;

SELECT * FROM expected_output
EXCEPT ALL
SELECT * FROM solution_output
