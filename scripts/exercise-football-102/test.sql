set search_path to solutions;

SELECT * FROM expected_output
EXCEPT ALL
SELECT * FROM solution_output
