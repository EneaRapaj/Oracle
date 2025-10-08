"# Oracle" 
University Database Management SQL Script

This SQL script is designed to manage a university database system. It covers table creation, constraints, sequences, data insertion, and queries to retrieve and analyze student, course, and grade information.

Features
1. Table Management

Deletes existing data and drops tables to reset the schema.

Creates sequences for primary keys:

DepartamentiID_Seq for Departamenti table.

LendaID_Seq for Lenda table.

Creates tables:

Departamenti: Stores department information.

Lenda: Stores course information.

Studenti: Stores student information and links to departments.

Nota: Stores student grades with foreign keys to students and courses, includes a CHECK constraint ensuring grades are between 4 and 10.

Departamenti_Studenti: Links students to departments.

2. Data Insertion

Populates the Departamenti table with department names.

Populates the Lenda table with course names.

Populates the Studenti table with students and their associated departments.

Populates the Nota table with student grades and timestamps.

3. Queries

Retrieve all students and their respective departments.

List students who have at least 2 grades above 8.

Calculate the average grade for each course and display only courses with an average above 7.

Display all students along with their grades for each course.

4. Views

RankStudentet: Ranks students based on their average grades.

Mesatarja_Departamenti: Calculates the average grade per department over the last 2 months.

5. Constraints

Enforces data integrity using primary keys, foreign keys, and CHECK constraints for valid grade ranges.

Example Queries
-- List all students with their department
SELECT S.Emri, S.Mbiemri, D.EmriDepartamentit
FROM Studenti S
JOIN Departamenti D ON S.DepartamentiID = D.DepartamentiID;

-- List students with at least 2 grades above 8
SELECT S.Emri, S.Mbiemri
FROM Studenti S
JOIN Nota N ON S.StudentiID = N.StudentiID
WHERE N.Nota > 8
GROUP BY S.StudentiID, S.Emri, S.Mbiemri
HAVING COUNT(N.NotaID) >= 2;

-- Average grade per course (only those with avg > 7)
SELECT L.EmriLendes, AVG(N.Nota) AS Mesatarja
FROM Lenda L
JOIN Nota N ON L.LendaID = N.LendaID
GROUP BY L.LendaID, L.EmriLendes
HAVING AVG(N.Nota) > 7;

-- Student ranking view
CREATE VIEW RankStudentet AS
SELECT S.Emri, S.Mbiemri, AVG(N.Nota) AS Mesatarja, 
RANK() OVER (ORDER BY AVG(N.Nota) DESC) AS Renditja
FROM Studenti S
JOIN Nota N ON S.StudentiID = N.StudentiID
GROUP BY S.StudentiID, S.Emri, S.Mbiemri;

Usage

Run the script in an Oracle SQL environment.

Ensure sequences are created before inserting data for auto-incremented primary keys.

Use the provided queries and views to retrieve and analyze student and course performance.
