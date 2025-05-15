USE master
GO

-- Create a new database
CREATE DATABASE Hospital
GO
USE Hospital
GO

-- Create a table with departments
CREATE TABLE Departments
(
    ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Building INT NOT NULL,
    Financing MONEY NOT NULL DEFAULT(0),
    Name NVARCHAR(100) NOT NULL UNIQUE,

    CONSTRAINT CHK_Building CHECK(Building BETWEEN 1 AND 5),
    CONSTRAINT CHK_Financing CHECK(Financing >= 0),
    CONSTRAINT CHK_Name CHECK(Name <> '')
)
GO

-- Create a table with diseases
CREATE TABLE Diseases
(
    ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Severity INT NOT NULL DEFAULT(1),

    CONSTRAINT CHK_Name CHECK(Name <> ''),
    CONSTRAINT CHK_Severity CHECK(Severity >= 1)
)
GO

-- Create a table with doctors
CREATE TABLE Doctors
(
    ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name NVARCHAR(MAX) NOT NULL,
    Phone char(10) NOT NULL,
    Salary MONEY NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,

    CONSTRAINT CHK_Name CHECK(Name <> ''),
    CONSTRAINT CHK_Salary CHECK(Salary > 0),
    CONSTRAINT CHK_Surname CHECK(Surname <> '')
)
GO

-- Create a table with examinations
CREATE TABLE Examinations
(
    ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    DayOfWeek INT NOT NULL,
    EndTime TIME NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE,
    StartTime TIME NOT NULL,

    CONSTRAINT CHK_DayOfWeek CHECK(DayOfWeek BETWEEN 1 AND 7),
    CONSTRAINT CHK_EndTime CHECK(EndTime > StartTime),
    CONSTRAINT CHK_Name CHECK(Name <> ''),
    CONSTRAINT CHK_StartTime CHECK(CAST(StartTime AS TIME) BETWEEN '08:00' AND '18:00')
)
GO