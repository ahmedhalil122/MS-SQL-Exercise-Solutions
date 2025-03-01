 --Problem 1

 CREATE TABLE Passports
 ( 
   PassportID INT PRIMARY KEY IDENTITY(101,1)
  ,PassportNumber CHAR(8) NOT NULL
 )

 CREATE TABLE Persons 
 (
  PersonId INT PRIMARY KEY IDENTITY
 ,FirstName VARCHAR(40) NOT NULL
 ,Salary DECIMAL(8,2) NOT NULL
 ,PassportID INT FOREIGN KEY REFERENCES Passports (PassportID) UNIQUE
 )

 INSERT INTO Passports (PassportNumber)
 VALUES
  ('N34FG21B')
 ,('K65LO4R7')
 ,('ZE657QP2')

 INSERT INTO Persons (FirstName,Salary,PassportID)
 VALUES
  ('Roberto', 43300.00, 102)
 ,('Tom', 56100.00, 103)
 ,('Yana', 60200.00, 101)

 --Problem 2

 CREATE TABLE Manufacturers 
 (
  ManufacturerID INT PRIMARY KEY IDENTITY
 ,[Name] VARCHAR (50) NOT NULL
 ,EstablishedOn DATE
 )

 CREATE TABLE Models 
 (
  ModelID INT PRIMARY KEY IDENTITY(101,1)
 ,[Name] VARCHAR(30) NOT NULL
 ,ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers (ManufacturerID)
 )

 INSERT INTO Manufacturers ([Name],EstablishedOn)
 VALUES
  ('BMW', '1916-03-07')
 ,('Tesla', '2003-01-01')
 ,('Lada', '1966-05-01')

 INSERT INTO Models ([Name],ManufacturerID)
 VALUES
  ('X1', 1)
 ,('i6', 1)
 ,('Model S', 2)
 ,('Model X', 2)
 ,('Model 3', 2)
 ,('Nova', 3)

--Problem 3

CREATE TABLE Students 
(
  StudentID INT PRIMARY KEY
 ,[Name] NVARCHAR(70) NOT NULL
)

CREATE TABLE Exams
(
  ExamID INT PRIMARY KEY
 ,[Name] NVARCHAR(100) NOT NULL
)

CREATE TABLE StudentsExams 
(
     StudentID INT NOT NULL
    ,ExamID INT NOT NULL
    ,PRIMARY KEY (StudentID, ExamID)
    ,FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
    ,FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
)

--Problem 4

CREATE TABLE Teachers
(
 TeacherID INT PRIMARY KEY IDENTITY(101,1)
,[Name] VARCHAR(70) NOT NULL
,ManagerID INT FOREIGN KEY REFERENCES Teachers (TeacherID)
)

--Problem 5

CREATE DATABASE OnlineStore

GO

USE OnlineStore

GO

CREATE TABLE Cities 
(
  CityID INT PRIMARY KEY IDENTITY
 ,[Name] VARCHAR (70) NOT NULL
)

CREATE TABLE ItemTypes
(
 ItemTypeID INT PRIMARY KEY IDENTITY
,[Name] VARCHAR(70) NOT NULL
)

CREATE TABLE Items
(
 ItemID INT PRIMARY KEY IDENTITY
,[Name] VARCHAR(70) NOT NULL
,ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE Customers 
(
 CustomerID INT PRIMARY KEY  IDENTITY
,[Name] VARCHAR(70) NOT NULL
,Birthday DATETIME2 NOT NULL
,CityID INT FOREIGN KEY REFERENCES Cities(CityID)
)

CREATE TABLE Orders
(
 OrderID INT PRIMARY KEY IDENTITY
,CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems
(
 OrderID INT NOT NULL
,ItemID INT NOT NULL
,PRIMARY KEY (OrderID, ItemID)
,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
,FOREIGN KEY (ItemID)  REFERENCES Items(ItemID)
)

GO

--Problem 6

GO

CREATE DATABASE University

GO

USE University

GO

CREATE TABLE Subjects
(
  SubjectID INT PRIMARY KEY
 ,SubjectName VARCHAR(70) NOT NULL
)

CREATE TABLE Majors 
(
  MajorID INT PRIMARY KEY
 ,[Name] VARCHAR(70) NOT NULL
)

CREATE TABLE Students
(
  StudentID INT PRIMARY KEY
 ,StudentNumber INT NOT NULL
 ,StudentName VARCHAR(70) NOT NULL
 ,MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
  PaymentID INT PRIMARY KEY 
 ,PaymentDate DATETIME2
 ,PaymentAmount DECIMAL(7,2)
 ,StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Agenda 
(
  StudentID INT NOT NULL
 ,SubjectID INT NOT NULL
 ,PRIMARY KEY(StudentID,SubjectID)
 ,FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
 ,FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
)

--Problem 9 

GO

USE Geography

GO

SELECT 
 MountainRange
,PeakName
,Elevation
FROM Peaks AS m
JOIN Mountains AS n ON m.MountainId=n.Id
WHERE MountainRange = 'Rila'
ORDER BY Elevation DESC
