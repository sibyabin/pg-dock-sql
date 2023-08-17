-- prepare the exercise schema 
DROP SCHEMA IF EXISTS exercise_103 CASCADE;
CREATE SCHEMA exercise_103;
SET SEARCH_PATH TO exercise_103;


-- Create the participants table
CREATE TABLE IF NOT EXISTS participants (
    participant_name VARCHAR(255) NOT NULL,
    event_year INT NOT NULL,
    UNIQUE(participant_name,event_year)
);

-- Insert sample participant data
INSERT INTO participants (participant_name, event_year)
VALUES
    ('Alice', 2019),
    ('David', 2020),
    ('Bob', 2020),
    ('Bob', 2021),
    ('John', 2020),
    ('Bob', 2018),
    ('Charlie', 2021),
    ('David', 2019),
    ('Charlie', 2022),
    ('Alice', 2020),
    ('John', 2018),
    ('Eve', 2022),
    ('Eve', 2023),
    ('Alice', 2021),
    ('Alice', 2016),
    ('John', 2019),
    ('Matt', 2021),
    ('Alice', 2014),
    ('Matt', 2023),
    ('Alice', 2015),
    ('Matt', 2019),
    ('Matt', 2017),
    ('Matt', 2015),
    ('David', 2018),
    ('Test', -1),
    ('Test', -2),
    ('Test', -3),
    ('TestLower', 1970),
    ('TestLower', 1971),
    ('TestLower', 1969)
    ;

