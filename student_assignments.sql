-- Create Database
CREATE DATABASE student_assignments;
USE student_assignments;

-- STUDENT table
CREATE TABLE student (
    username VARCHAR(50) PRIMARY KEY
);

-- ASSIGNMENT table
CREATE TABLE assignment (
    shortname VARCHAR(50) PRIMARY KEY,
    due_date DATE NOT NULL,
    url VARCHAR(255)
);

-- SUBMISSION table
CREATE TABLE submission (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    shortname VARCHAR(50),
    version INT,
    submit_date DATE NOT NULL,
    data TEXT,
    FOREIGN KEY (username) REFERENCES student(username)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (shortname) REFERENCES assignment(shortname)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
