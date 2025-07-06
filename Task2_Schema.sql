 --✅ TASK 1: Schema Design & Initial Data Insertion
-- Create Database
CREATE DATABASE LibraryDB;
 
--Create Table Books
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    published_year INT CHECK (published_year >= 1000 AND published_year <= 9999)
);
 
CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Step 5: Create the Borrow table (relationship table)
CREATE TABLE Borrow (
    borrow_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
DROP TABLE IF EXISTS Books CASCADE;
--Creating table books
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(50),
    published_year INT CHECK (published_year >= 1000 AND published_year <= 9999)
);
--Inserting values in Books table
INSERT INTO Books (title, author, category, published_year) VALUES
('The Alchemist', 'Paulo Coelho', 'Fiction', 1988),
('Clean Code', 'Robert C. Martin', 'Programming', 2008),
('The Power of Habit', 'Charles Duhigg', 'Self-Help', 2012),
('1984', 'George Orwell', 'Dystopian', 1949),
('Sapiens', 'Yuval Noah Harari', 'History', 2011),
('Atomic Habits', 'James Clear', 'Self-Help', 2018),
('Introduction to Algorithms', 'CLRS', 'Education', 2009),
('The Pragmatic Programmer', 'Andy Hunt', 'Programming', 1999),
('Deep Work', 'Cal Newport', 'Productivity', 2016),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960);

SELECT * FROM Books;
INSERT INTO Members (name, email, phone) VALUES
('Divya Dhumal', 'divya@gmail.com', '9876543210'),
('John Smith', 'john@gmail.com', '9123456780'),
('Aarav Mehta', 'aarav@gmail.com', '9988776655'),
('Priya Sharma', 'priya@gmail.com', '8877665544'),
('Rohan Kulkarni', 'rohan@gmail.com', '7766554433'),
('Anjali Singh', 'anjali@gmail.com', '6655443322'),
('Raj Patel', 'raj@gmail.com', '9988221144'),
('Sneha Nair', 'sneha@gmail.com', '9443322110'),
('Karan Verma', 'karan@gmail.com', '9332211009'),
('Meera Joshi', 'meera@gmail.com', '9221100098');

SELECT * from Members;

--Inserting values
INSERT INTO Borrow (book_id, member_id, borrow_date, return_date) VALUES
(1, 1, '2025-07-01', '2025-07-06'),
(2, 2, '2025-07-02', '2025-07-05'),
(3, 3, '2025-07-03', NULL),
(4, 4, '2025-07-04', NULL),
(5, 5, '2025-07-05', '2025-07-10'),
(6, 6, '2025-07-06', NULL),
(7, 7, '2025-07-07', NULL),
(8, 8, '2025-07-08', '2025-07-15'),
(9, 9, '2025-07-09', NULL),
(10, 10, '2025-07-10', NULL);

SELECT * FROM Borrow;

 -- ✅ TASK 2: Data Insertion, Handling NULLs, UPDATE, DELETE

 -- INSERT: Add new test rows with NULLs for Task 2

-- Add temporary members (with NULL fields)
INSERT INTO Members (name, email, phone) VALUES
('Temporary User 1', NULL, '7000011111'),
('Temporary User 2', 'temp2@gmail.com', NULL);

-- Add temporary books (with NULL category or year)
INSERT INTO Books (title, author, category, published_year) VALUES
('Zero to One', 'Peter Thiel', NULL, 2014),
('Start With Why', 'Simon Sinek', 'Self-Help', NULL);

-- Insert into Borrow (optional if needed for practice)
INSERT INTO Borrow (book_id, member_id, borrow_date, return_date) VALUES
(11, 11, '2025-07-01', NULL),  -- You may update IDs based on your actual table
(12, 12, '2025-07-02', NULL);

 -- Update NULL emails
UPDATE Members
SET email = 'noemail@task2.com'
WHERE email IS NULL;

-- Update NULL phone
UPDATE Members
SET phone = '9999999999'
WHERE phone IS NULL;

-- Update NULL book category
UPDATE Books
SET category = 'Uncategorized'
WHERE category IS NULL;

-- Update NULL year
UPDATE Books
SET published_year = 2020
WHERE published_year IS NULL;
 

-- Delete test books
DELETE FROM Books
WHERE category = 'Uncategorized';

-- Delete books published before the year 2000 (optional cleanup)
DELETE FROM Books
WHERE published_year < 2000;