
-- prepare the exercise schema 
DROP SCHEMA IF EXISTS exercise_101 CASCADE;
CREATE SCHEMA exercise_101;
SET SEARCH_PATH TO exercise_101;

-- Create the employee table
CREATE TABLE dummy (
    value INT PRIMARY KEY
);

-- Insert sample data
INSERT INTO dummy(value)
VALUES
    (1),
    (2);
