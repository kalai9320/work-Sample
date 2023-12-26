--Creating a table for student marks

CREATE TABLE Student_marks (MarkID SMALLINT NOT NULL PRIMARY KEY,StudentID SMALLINT NOT NULL, SubjectID	SMALLINT NOT NULL, TeacherID	SMALLINT NOT NULL, MarkObtained	SMALLINT NOT NULL,ExamDate DATE NOT NULL);

--Creating a table for students data 

CREATE TABLE Students (StudentID SMALLINT NOT NULL PRIMARY KEY,FirstName VARCHAR NOT NULL, LastName	VARCHAR NOT NULL,DateOfBirth DATE NOT NULL, Address	VARCHAR NOT NULL,ContactNumber TEXT NOT NULL,Email VARCHAR NOT NULL);

--Creating a table for students subject data

CREATE TABLE Students_Subject (SubjectID SMALLINT NOT NULL PRIMARY KEY,SubjectName VARCHAR NOT NULL);

DROP TABLE Teachers;

--Creating a table for Teachers data

CREATE TABLE Teachers (TeacherID SMALLINT NOT NULL,FirstName VARCHAR NOT NULL,LastName VARCHAR NOT NULL, DateOfBirth DATE NOT NULL, Address VARCHAR NOT NULL, ContactNumber TEXT NOT NULL, Email VARCHAR NOT NULL);

--DROP TABLE Students_Subject;

--Copy data from CSV file

COPY Student_marks FROM 'E:\kalai Notes\Project\SQL Student data\Marks.csv' DELIMITER ','  csv header;
COPY Teachers FROM 'E:\kalai Notes\Project\SQL Student data\Teachers.csv' DELIMITER ','  csv header;
COPY Students_Subject FROM 'E:\kalai Notes\Project\SQL Student data\Subjects.csv' DELIMITER ','  csv header;
COPY Students FROM 'E:\kalai Notes\Project\SQL Student data\Students.csv' DELIMITER ','  csv header;

--selecting all the data from the table

SELECT * FROM Students;
SELECT * FROM Teachers;
SELECT * FROM Students_Subject;
SELECT * FROM Student_marks;

-- Creating new column for full name in students table

ALTER TABLE  Students ADD COLUMN Fullname VARCHAR;
UPDATE Students SET Fullname = CONCAT(FirstName, ' ',LastName);

--If we want to drop the column (ALTER TABLE Students DROP COLUMN Fullname)

-- Highest marks scored by students based on their marks

SELECT A.Fullname, B.MarkObtained, B.ExamDate FROM Students AS A LEFT JOIN Student_marks AS B ON A.StudentID=B.StudentID order by markobtained desc limit 5;

--Overall students subject wise average marks 

SELECT B.SubjectID,C.SubjectName,avg(B.MarkObtained) AS "Total students average marks in all subjects" FROM Students_Subject AS C LEFT JOIN Student_marks AS B 
ON B.SubjectID=C.SubjectID GROUP BY B.SubjectID,C.SubjectName 
ORDER BY "Total students average marks in all subjects" desc;

--Students all subject marks list

SELECT A.StudentID,A.Fullname,C.SubjectName,B.MarkObtained FROM Students AS A LEFT JOIN Student_marks AS B ON A.StudentID=B.StudentID
LEFT JOIN Students_Subject AS C ON B.SubjectID=C.SubjectID;

--list of subjects that we have in this dataset
select distinct (SubjectName) from Students_Subject;

--Subject wise students marks
--Biology Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Biology' ORDER BY A.MarkObtained DESC;

--Chemistry Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Chemistry' ORDER BY A.MarkObtained DESC;


--Physics Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Physics' ORDER BY A.MarkObtained DESC;


--Swahili Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Swahili' ORDER BY A.MarkObtained DESC;

--Computer Science Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Computer Science' ORDER BY A.MarkObtained DESC;

--Geography Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Geography' ORDER BY A.MarkObtained DESC;

--History Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'History' ORDER BY A.MarkObtained DESC;


--Science Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Science' ORDER BY A.MarkObtained DESC;

--English Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'English' ORDER BY A.MarkObtained DESC;

--Mathematics Marks

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Mathematics' ORDER BY A.MarkObtained DESC;

--Subject that the student scored more marks on 

SELECT B.SubjectID,C.SubjectName,avg(B.MarkObtained) AS "Total students average marks in this subject" FROM Students_Subject AS C LEFT JOIN Student_marks AS B 
ON B.SubjectID=C.SubjectID GROUP BY B.SubjectID,C.SubjectName 
ORDER BY "Total students average marks in this subject" desc limit 1;

--Teacher performance analysis:

-- Creating a new column with the full name for the teacher table using the concat function
ALTER TABLE  Teachers ADD COLUMN Fullname VARCHAR;
UPDATE Teachers SET Fullname = CONCAT(FirstName, ' ',LastName);

-- Teachers Name

select distinct (Fullname) as Teachers_name from Teachers;

--Total Numbers of teacher in this dataset

select count (distinct Fullname) as Total_teachers_count from Teachers;


--Teacher vs subject list

SELECT  distinct (B.TeacherID),D.Fullname,C.SubjectName FROM Teachers AS D LEFT JOIN Student_marks AS B ON D.TeacherID=B.TeacherID
LEFT JOIN Students_Subject AS C ON B.SubjectID=C.SubjectID order by B.TeacherID asc;

-- Teacher performance report based on students total marks

SELECT B.TeacherID,D.Fullname,C.SubjectName,SUM(B.MarkObtained) AS "Total student marks" FROM Teachers AS D LEFT JOIN Student_marks AS B 
ON D.TeacherID=B.TeacherID LEFT JOIN Students_Subject AS C ON B.SubjectID=C.SubjectID GROUP BY B.TeacherID,D.Fullname,C.SubjectName 
ORDER BY "Total student marks" desc;


--Top 3 performing teacher based on students total mark

SELECT B.TeacherID,D.Fullname,C.SubjectName,SUM(B.MarkObtained) AS "Total student marks" FROM Teachers AS D LEFT JOIN Student_marks AS B 
ON D.TeacherID=B.TeacherID LEFT JOIN Students_Subject AS C ON B.SubjectID=C.SubjectID GROUP BY B.TeacherID,D.Fullname,C.SubjectName 
ORDER BY "Total student marks" desc limit 3;

--student analysis

--Topper of this batch 

select C.StudentID,C.Fullname,sum(A.MarkObtained) AS TOTAL_MARKS FROM Student_marks AS A LEFT JOIN Students AS C ON A.StudentID=C.StudentID
GROUP BY C.StudentID,C.Fullname  ORDER BY TOTAL_MARKS DESC LIMIT 1;

--Student OVERALL SCORE

select C.StudentID,C.Fullname,sum(A.MarkObtained) AS TOTAL_MARKS FROM Student_marks AS A LEFT JOIN Students AS C ON A.StudentID=C.StudentID
GROUP BY C.StudentID,C.Fullname  ORDER BY TOTAL_MARKS DESC;

--Toppers subject wise

--Biology Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Biology' ORDER BY A.MarkObtained DESC limit 1;

--Chemistry Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Chemistry' ORDER BY A.MarkObtained DESC limit 1;


--Physics Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Physics' ORDER BY A.MarkObtained DESC limit 1;


--Swahili Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Swahili' ORDER BY A.MarkObtained DESC limit 1;

--Computer Science Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Computer Science' ORDER BY A.MarkObtained DESC limit 1;

--Geography Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Geography' ORDER BY A.MarkObtained DESC limit 1;

--History Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'History' ORDER BY A.MarkObtained DESC limit 1;


--Science Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Science' ORDER BY A.MarkObtained DESC limit 1;

--English Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'English' ORDER BY A.MarkObtained DESC limit 1;

--Mathematics Topper

select C.Fullname,B.SubjectName,A.MarkObtained FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE SubjectName= 'Mathematics' ORDER BY A.MarkObtained DESC limit 1;

--Indiuval student marks name= 'Moses Kimani'

select C.Fullname,B.SubjectName,A.MarkObtained,A.ExamDate FROM Student_marks AS A LEFT JOIN Students_Subject AS B
ON A.SubjectID=B.SubjectID LEFT JOIN Students AS C ON A.StudentID=C.StudentID WHERE Fullname= 'Moses Kimani' ORDER BY A.MarkObtained DESC;


