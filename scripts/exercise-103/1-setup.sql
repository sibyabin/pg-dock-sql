-- prepare the exercise schema 
DROP SCHEMA IF EXISTS exercise_103 CASCADE;
CREATE SCHEMA exercise_103;
SET SEARCH_PATH TO exercise_103;


-- Create the participants table
CREATE TABLE IF NOT EXISTS participants (
    participant_name VARCHAR(255),
    event_year INT
);

-- Insert sample participant data
INSERT INTO participants (participant_name, event_year)
VALUES
    ('Alice', 2019),
    ('Alice', 2020),
    ('Alice', 2021),
    ('Bob', 2020),
    ('Bob', 2021),
    ('Charlie', 2021),
    ('Charlie', 2022),
    ('David', 2018),
    ('David', 2019),
    ('David', 2020),
    ('Eve', 2022),
    ('Eve', 2023);

