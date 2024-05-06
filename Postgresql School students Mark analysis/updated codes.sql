-- Creating tables
CREATE TABLE Student_marks (
    MarkID SMALLINT NOT NULL PRIMARY KEY,
    StudentID SMALLINT NOT NULL,
    SubjectID SMALLINT NOT NULL,
    TeacherID SMALLINT NOT NULL,
    MarkObtained SMALLINT NOT NULL,
    ExamDate DATE NOT NULL
);

CREATE TABLE Students (
    StudentID SMALLINT NOT NULL PRIMARY KEY,
    FirstName VARCHAR NOT NULL,
    LastName VARCHAR NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR NOT NULL,
    ContactNumber TEXT NOT NULL,
    Email VARCHAR NOT NULL
);

CREATE TABLE Students_Subject (
    SubjectID SMALLINT NOT NULL PRIMARY KEY,
    SubjectName VARCHAR NOT NULL
);

CREATE TABLE Teachers (
    TeacherID SMALLINT NOT NULL,
    FirstName VARCHAR NOT NULL,
    LastName VARCHAR NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR NOT NULL,
    ContactNumber TEXT NOT NULL,
    Email VARCHAR NOT NULL
);

-- Copying data from CSV files
COPY Student_marks FROM 'E:\kalai Notes\Project\SQL Student data\Marks.csv' DELIMITER ',' CSV HEADER;
COPY Teachers FROM 'E:\kalai Notes\Project\SQL Student data\Teachers.csv' DELIMITER ',' CSV HEADER;
COPY Students_Subject FROM 'E:\kalai Notes\Project\SQL Student data\Subjects.csv' DELIMITER ',' CSV HEADER;
COPY Students FROM 'E:\kalai Notes\Project\SQL Student data\Students.csv' DELIMITER ',' CSV HEADER;

-- Viewing data from tables
SELECT * FROM Students;
SELECT * FROM Teachers;
SELECT * FROM Students_Subject;
SELECT * FROM Student_marks;

-- Creating new column for full name in students table
ALTER TABLE Students ADD COLUMN Fullname VARCHAR;
UPDATE Students SET Fullname = CONCAT(FirstName, ' ', LastName);

-- Highest marks scored by students based on their marks
SELECT A.Fullname, B.MarkObtained, B.ExamDate 
FROM Students AS A 
LEFT JOIN Student_marks AS B ON A.StudentID = B.StudentID 
ORDER BY B.MarkObtained DESC 
LIMIT 5;

-- Overall students subject-wise average marks
SELECT B.SubjectID, C.SubjectName, AVG(B.MarkObtained) AS "Total students average marks in all subjects" 
FROM Students_Subject AS C 
LEFT JOIN Student_marks AS B ON B.SubjectID = C.SubjectID 
GROUP BY B.SubjectID, C.SubjectName 
ORDER BY "Total students average marks in all subjects" DESC;

-- Students all subject marks list
SELECT A.StudentID, A.Fullname, C.SubjectName, B.MarkObtained 
FROM Students AS A 
LEFT JOIN Student_marks AS B ON A.StudentID = B.StudentID 
LEFT JOIN Students_Subject AS C ON B.SubjectID = C.SubjectID;

-- List of subjects
SELECT DISTINCT(SubjectName) FROM Students_Subject;

-- Subject-wise students marks
-- Biology Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Biology' 
ORDER BY A.MarkObtained DESC;

-- Chemistry Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Chemistry' 
ORDER BY A.MarkObtained DESC;

-- Physics Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Physics' 
ORDER BY A.MarkObtained DESC;

-- Swahili Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Swahili' 
ORDER BY A.MarkObtained DESC;

-- Computer Science Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Computer Science' 
ORDER BY A.MarkObtained DESC;

-- Geography Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Geography' 
ORDER BY A.MarkObtained DESC;

-- History Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'History' 
ORDER BY A.MarkObtained DESC;

-- Science Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Science' 
ORDER BY A.MarkObtained DESC;

-- English Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'English' 
ORDER BY A.MarkObtained DESC;

-- Mathematics Marks
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Mathematics' 
ORDER BY A.MarkObtained DESC;

-- Subject that the student scored more marks on 
SELECT B.SubjectID, C.SubjectName, AVG(B.MarkObtained) AS "Total students average marks in this subject" 
FROM Students_Subject AS C 
LEFT JOIN Student_marks AS B ON B.SubjectID = C.SubjectID 
GROUP BY B.SubjectID, C.SubjectName 
ORDER BY "Total students average marks in this subject" DESC 
LIMIT 1;

-- Teacher performance analysis
-- Creating a new column with the full name for the teacher table
ALTER TABLE Teachers ADD COLUMN Fullname VARCHAR;
UPDATE Teachers SET Fullname = CONCAT(FirstName, ' ', LastName);

-- Teacher performance report based on students' total marks
SELECT B.TeacherID, D.Fullname, C.SubjectName, SUM(B.MarkObtained) AS "Total student marks" 
FROM Teachers AS D 
LEFT JOIN Student_marks AS B ON D.TeacherID = B.TeacherID 
LEFT JOIN Students_Subject AS C ON B.SubjectID = C.SubjectID 
GROUP BY B.TeacherID, D.Fullname, C.SubjectName 
ORDER BY "Total student marks" DESC;

-- Top 3 performing teachers based on students' total marks
SELECT B.TeacherID, D.Fullname, C.SubjectName, SUM(B.MarkObtained) AS "Total student marks" 
FROM Teachers AS D 
LEFT JOIN Student_marks AS B ON D.TeacherID = B.TeacherID 
LEFT JOIN Students_Subject AS C ON B.SubjectID = C.SubjectID 
GROUP BY B.TeacherID, D.Fullname, C.SubjectName 
ORDER BY "Total student marks" DESC 
LIMIT 3;

-- Topper of this batch 
SELECT C.StudentID, C.Fullname, SUM(A.MarkObtained) AS TOTAL_MARKS 
FROM Student_marks AS A 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
GROUP BY C.StudentID, C.Fullname  
ORDER BY TOTAL_MARKS DESC LIMIT 1;

-- Student overall score
SELECT C.StudentID, C.Fullname, SUM(A.MarkObtained) AS TOTAL_MARKS 
FROM Student_marks AS A 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
GROUP BY C.StudentID, C.Fullname  
ORDER BY TOTAL_MARKS DESC;

-- Topper subject-wise
-- Biology Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Biology' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Chemistry Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Chemistry' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Physics Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Physics' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Swahili Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Swahili' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Computer Science Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Computer Science' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Geography Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Geography' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- History Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'History' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Science Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Science' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- English Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'English' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Mathematics Topper
SELECT C.Fullname, B.SubjectName, A.MarkObtained 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE SubjectName = 'Mathematics' 
ORDER BY A.MarkObtained DESC 
LIMIT 1;

-- Individual student marks, e.g., name= 'Moses Kimani'
SELECT C.Fullname, B.SubjectName, A.MarkObtained, A.ExamDate 
FROM Student_marks AS A 
LEFT JOIN Students_Subject AS B ON A.SubjectID = B.SubjectID 
LEFT JOIN Students AS C ON A.StudentID = C.StudentID 
WHERE Fullname = 'Moses Kimani' 
ORDER BY A.MarkObtained DESC;