
-- prepare the exercise schema 
DROP SCHEMA IF EXISTS exercise_104 CASCADE;
CREATE SCHEMA exercise_104;
SET SEARCH_PATH TO exercise_104;

-- Create phone_call table
CREATE TABLE phone_call (
    caller_id INT,
    receiver_id INT,
    call_time TIMESTAMP
);

-- Create phone_info table
CREATE TABLE phone_info (
    caller_id INT PRIMARY KEY,
    country_id INT,
    network VARCHAR(50),
    phone_number VARCHAR(15)
);

-- Insert sample data into phone_info table
INSERT INTO phone_info (caller_id, country_id, network, phone_number)
VALUES
    (1, 1, 'Network A', '123-456-7890'),
    (2, 1, 'Network A', '987-654-3210'),
    (3, 2, 'Network B', '555-123-4567'),
    (4, 3, 'Network C', '111-222-3333'),
    (5, 4, 'Network D', '444-555-6666');

-- Insert sample data into phone_call table
INSERT INTO phone_call (caller_id, receiver_id, call_time)
VALUES
    (1, 2, '2023-08-19 09:00:00'),
    (2, 1, '2023-08-19 10:00:00'),
    (3, 4, '2023-08-19 11:00:00'),
    (4, 5, '2023-08-19 12:00:00'),
    (5, 3, '2023-08-19 13:00:00'),
    (1, 3, '2023-08-19 14:00:00'),
    (2, 4, '2023-08-19 15:00:00'),
    (3, 1, '2023-08-19 16:00:00'),
    (4, 2, '2023-08-19 17:00:00'),
    (5, 1, '2023-08-19 18:00:00');