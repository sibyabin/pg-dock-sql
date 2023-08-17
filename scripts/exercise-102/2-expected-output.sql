SET SEARCH_PATH TO exercise_102;
DROP TABLE IF EXISTS expected_output;

WITH cte AS (
SELECT 20 as team_id ,'Never' as team_name , 4 as num_points UNION ALL
SELECT 50 as team_id ,'Gonna' as team_name , 4 as num_points UNION ALL
SELECT 10 as team_id ,'Give' as team_name , 3 as num_points UNION ALL
SELECT 30 as team_id ,'You' as team_name , 3 as num_points UNION ALL
SELECT 40 as team_id ,'Up' as team_name , 0 as num_points 
) 

SELECT * INTO expected_output FROM output;