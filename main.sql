USE master
GO

-- Check if the database exists, and drop it if necessary
IF DB_ID('Academy') IS NOT NULL
    DROP DATABASE Academy

-- Create a new database
CREATE DATABASE Academy
USE Academy
GO

-- Create a table with groups
CREATE TABLE Groups
(
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name NVARCHAR(10) NOT NULL UNIQUE,
    Rating INT NOT NULL,
    Year INT NOT NULL,

    CONSTRAINT CHK_Groups_Name CHECK(Name <> ''),
    CONSTRAINT CHK_Groups_Rating CHECK(Rating BETWEEN 0 AND 5),
    CONSTRAINT CHK_Groups_YEAR CHECK(Year BETWEEN 1 AND 5)
)

-- Create a table with departments
CREATE TABLE Departments
(
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Financing MONEY NOT NULL DEFAULT(0),
    Name NVARCHAR(100) NOT NULL UNIQUE,

    CONSTRAINT CHK_Departments_Financing CHECK(Financing >= 0),
    CONSTRAINT CHK_Departments_Name CHECK(Name <> '')
)

-- Create a table with faculties
CREATE TABLE Faculties
(
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL UNIQUE,

    CONSTRAINT CHK_Faculties_Name CHECK(Name <> '')
)

-- Create a table with teachers
CREATE TABLE Teachers
(
    Id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    EmploymentDate DATE NOT NULL,
    Name NVARCHAR(MAX) NOT NULL,
    Premium MONEY NOT NULL DEFAULT(0),
    Salary MONEY NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,

    CONSTRAINT CHK_Teachers_EmploymentDate CHECK(EmploymentDate > '01.01.1990'),
    CONSTRAINT CHK_Teachers_Name CHECK(Name <> ''),
    CONSTRAINT CHK_Teachers_Premium CHECK(Premium >= 0),
    CONSTRAINT CHK_Teachers_Salary CHECK(Salary > 0),
    CONSTRAINT CHK_Teachers_Surname CHECK(Surname <> '')
)

-- Execute the current batch of scripts
GO