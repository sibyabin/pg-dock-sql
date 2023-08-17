
-- prepare the exercise schema 
DROP SCHEMA IF EXISTS exercise_101 CASCADE;
CREATE SCHEMA exercise_101;
SET SEARCH_PATH TO exercise_101;

-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    department_id INT,
    salary DECIMAL(10, 2),
    manager_id INT
);

-- Insert sample data
INSERT INTO employee (emp_id, emp_name, department_id, salary, manager_id)
VALUES
    (1, 'John Doe', 101, 50000.00, NULL),
    (2, 'Jane Smith', 101, 55000.00, 1),
    (3, 'Michael Johnson', 102, 60000.00, 1),
    (4, 'Emily Brown', 102, 52000.00, 1),
    (5, 'William Davis', 103, 48000.00, 2),
    (6, 'Olivia Wilson', 103, 52000.00, 2),
    (7, 'James Jones', 104, 55000.00, 3),
    (8, 'Sophia Miller', 104, 58000.00, 3),
    (9, 'Robert Wilson', 105, 65000.00, 4),
    (10, 'Ava Anderson', 105, 60000.00, 4);
