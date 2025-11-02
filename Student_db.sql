-- 1️⃣ Create Database
CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

-- 2️⃣ Create Tables
-- STUDENT TABLE
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- ASSIGNMENT TABLE
CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    due_date DATE
);

-- SUBMISSION TABLE
CREATE TABLE Submission (
    submission_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    assignment_id INT,
    submission_date DATE,
    grade DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 3️⃣ Insert Sample Data 

-- Insert Students
INSERT INTO Student (student_name, email) VALUES
('Angela Cruz', 'angela.cruz@email.com'),
('Bryan Torres', 'bryan.torres@email.com'),
('Cheska Villanueva', 'cheska.villanueva@email.com'),
('Daniel Reyes', 'daniel.reyes@email.com'),
('Ella Mendoza', 'ella.mendoza@email.com');

-- Insert Assignments
INSERT INTO Assignment (title, due_date) VALUES
('ER Diagram Creation', '2025-11-10'),
('SQL Joins Challenge', '2025-11-15'),
('Stored Procedures Task', '2025-11-22'),
('Triggers and Views Practice', '2025-11-28');

-- Insert Submissions
INSERT INTO Submission (student_id, assignment_id, submission_date, grade) VALUES
(1, 1, '2025-11-09', 93.50),
(1, 2, '2025-11-14', 89.00),
(2, 2, '2025-11-15', 85.75),
(3, 3, '2025-11-21', 97.25),
(4, 4, '2025-11-27', 91.00),
(5, 1, '2025-11-10', 88.50),
(2, 3, '2025-11-22', 90.00),
(3, 4, '2025-11-28', 95.00);


-- 4️⃣ Test Select Queries
-- Show all students
SELECT * FROM Student;

-- Show all assignments
SELECT * FROM Assignment;

-- Show all submissions with student and assignment details
SELECT 
    s.submission_id,
    st.student_name,
    a.title AS assignment_title,
    s.submission_date,
    s.grade
FROM Submission s
JOIN Student st ON s.student_id = st.student_id
JOIN Assignment a ON s.assignment_id = a.assignment_id
ORDER BY s.submission_date;

-- 5️⃣ Verify Table Structures
DESCRIBE Student;
DESCRIBE Assignment;
DESCRIBE Submission;