
-- prepare the exercise schema 
DROP SCHEMA IF EXISTS exercise_102 CASCADE;
CREATE SCHEMA exercise_102;
SET SEARCH_PATH TO exercise_102;

-- Create table teams
CREATE TABLE IF NOT EXISTS teams (
    team_id INTEGER NOT NULL,
    team_name varchar(30) NOT NULL,
    UNIQUE(team_id)
  );


-- INSERT statements for teams 
INSERT INTO teams (team_id, team_name) VALUES (10,'Give' );
INSERT INTO teams (team_id, team_name) VALUES (20,'Never' );
INSERT INTO teams (team_id, team_name) VALUES (30,'You' );
INSERT INTO teams (team_id, team_name) VALUES (40,'Up' );
INSERT INTO teams (team_id, team_name) VALUES (50,'Gonna' );

-- Create table matches
CREATE TABLE IF NOT EXISTS matches (
      match_id INTEGER NOT NULL,
      host_team INTEGER NOT NULL,
      guest_team INTEGER NOT NULL,
      host_goals INTEGER NOT NULL,
      guest_goals INTEGER NOT NULL,
      UNIQUE(match_id)
  );

-- INSERT statements for matches 
INSERT INTO matches (match_id,host_team,guest_team,host_goals,guest_goals) VALUES 
(1, 30, 20, 1, 0),
(2, 10, 20, 1, 2),
(3, 20, 50, 2, 2),
(4, 10, 30, 1, 0),
(5, 30, 50, 0, 1);
