set search_path to solutions;

DROP TABLE IF EXISTS solution_output;

WITH host_team_points AS (
SELECT 
    t.team_id,
    t.team_name,
    SUM(CASE 
        WHEN m.host_goals > m.guest_goals THEN 3 
        WHEN m.host_goals = m.guest_goals THEN 1
        ELSE 0 
    END) as number_of_points
FROM 
    teams t 
LEFT JOIN matches m ON  t.team_id = m.host_team
GROUP BY 1,2
),

guest_team_points AS (
SELECT 
    t.team_id,
    t.team_name,
    SUM(CASE 
        WHEN m.guest_goals > m.host_goals THEN 3 
        WHEN m.host_goals = m.guest_goals THEN 1
        ELSE 0 
    END) as number_of_points
FROM 
    teams t 
LEFT JOIN matches m ON  t.team_id = m.guest_team
GROUP BY 1,2 
) , 

output AS (
SELECT 
    result.team_id,
    result.team_name,
    COALESCE(sum(result.number_of_points),0) AS num_points
FROM 
(
SELECT * FROM  host_team_points
UNION ALL 
SELECT * FROM  guest_team_points
) result
GROUP BY 1 , 2 ORDER BY num_points DESC , 1 ASC
)

SELECT * INTO solution_output from output