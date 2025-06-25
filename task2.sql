-- Creating a sample table for the task
CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT DEFAULT 'not_provided@example.com',
    grade TEXT
);

-- Inserting values (with some NULLs and default values)
INSERT INTO Students (student_id, name, age, email, grade) VALUES
(1, 'Alice', 20, 'alice@example.com', 'A'),
(2, 'Bob', 21, NULL, 'B'),
(3, 'Charlie', NULL, 'charlie@example.com', NULL),
(4, 'Daisy', 22, DEFAULT, 'A'),
(5, 'Ethan', 19, NULL, NULL);

-- Updating values where data was missing
UPDATE Students
SET age = 20
WHERE student_id = 3;

UPDATE Students
SET email = 'bob@example.com'
WHERE name = 'Bob';

UPDATE Students
SET grade = 'C'
WHERE student_id = 5;

-- Deleting a specific student
DELETE FROM Students
WHERE student_id = 4;

-- Rollback logic (for practice; won't actually run unless in transaction block)
-- ROLLBACK;

-- Insert using SELECT (e.g., clone a student record)
INSERT INTO Students (student_id, name, age, email, grade)
SELECT 6, name || ' Jr.', age, email, grade FROM Students WHERE student_id = 1;
