create database Uni;
use Uni;

create table Student(
StudentID int not null Identity(0,1),
NIC varchar(13),
Name varchar(200),
Address varchar(200),
DOB varchar(15),
Email varchar(100),
Password varchar(45),
primary key(StudentID)
);

create table Dependent(
StudentID int,
Name varchar(200),
PhoneNo varchar(10),
Relationship varchar(100),
Foreign key(StudentID)REFERENCES Student(StudentID)
);

create table PhoneNo(
StudentID int,
PhoneNo varchar(10),
Foreign key(StudentID)REFERENCES Student(StudentID),
Primary key(StudentID,PhoneNo)
);

create table Faculty(
FacultyID varchar(10) not null,
Fname varchar(50),
Primary key(FacultyID)
);

create table Department(
DepartmentID int not null,
DepName varchar(50),
FacultyID varchar(10),
Primary key(DepartmentID),
Foreign key(FacultyID)REFERENCES Faculty(FacultyID)
);

create table Degree(
DegreeID int not null,
Dname varchar(50),
Dtype varchar(20),
DepartmentID int,
Primary key(DegreeID),
Foreign key(DepartmentID)REFERENCES Department(DepartmentID)
);

create table Person(
EmpID int not null,
Name varchar(50),
Email varchar(100),
Password varchar(45),
Primary key(EmpID)
);

create table Lecturer(
EmpID int not null,
Qualification varchar(200),
DepartmentID int,
Primary key(EmpID),
Foreign key(DepartmentID)REFERENCES Department(DepartmentID),
Foreign key(EmpID)REFERENCES Person(EmpID)
);

create table Admin(
EmpID int not null,
OT int,
Foreign key(EmpID)REFERENCES Person(EmpID)
);

create table Module(
ModuleID int not null,
ModuleName varchar(200),
Semester varchar(20),
EmpID int,
Primary key(ModuleID),
Foreign key(EmpID)REFERENCES Lecturer(EmpID)
);

create table PersonAccess(
StudentID int not null,
EmpID int not null,
AccessTime varchar(20),
Primary key(StudentID,EmpID),
Foreign key(EmpID)REFERENCES Person(EmpID),
Foreign key(StudentID)REFERENCES Student(StudentID)
);

create table AccessValidity(
StudentID int not null,
Status varchar(20),
PayStatus varchar(20),
Primary key(StudentID),
Foreign key(StudentID)REFERENCES Student(StudentID)
);


