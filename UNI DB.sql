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
Foreign key(FacultyID) REFERENCES Faculty(FacultyID)
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

create table Attendence(
StudentID int not null,
ModuleID int not null,
AttendDate varchar(20),
Primary key(StudentID,ModuleID),
Foreign key(ModuleID)REFERENCES Module(ModuleID),
Foreign key(StudentID)REFERENCES Student(StudentID)
);

create table Payment(
PayID int not null,
StudentID int not null,
PostDate varchar(20),
Amount float,
TransID int,
RecNo int,
PaymentType varchar(40),
Primary key(PayID,StudentID),
Foreign key(StudentID)REFERENCES Student(StudentID),
Foreign key(TransID)REFERENCES AccountDetails(TransID)
);

create table AccountDetails(
TransID int not null,
StudentID int,
AccountNo varchar(20),
Primary key(TransID),
Foreign key(StudentID)REFERENCES Student(StudentID)
);

create table Result(
StudentID int not null,
ModuleID int not null,
Mark float,
EmpID int,
Primary key(StudentID,ModuleID),
Foreign key(ModuleID)REFERENCES Module(ModuleID),
Foreign key(StudentID)REFERENCES Student(StudentID),
Foreign key(EmpID)REFERENCES Lecturer(EmpID)
);

create table DegreeModuleAllocation(
DegreeID int not null,
ModuleID int not null,
Primary key(DegreeID,ModuleID),
Foreign key(ModuleID)REFERENCES Module(ModuleID),
Foreign key(DegreeID)REFERENCES Degree(DegreeID),
);

create table ExamAllocation(
ExamID int not null,
ModuleID int not null,
EmpID int,
Primary key(ExamID),
Foreign key(ModuleID)REFERENCES Module(ModuleID),
Foreign key(EmpID)REFERENCES Person(EmpID)
);

create table ExamStudentAllocation(
ExamID int not null,
StudentID int not null,
Participation int,
Primary key(ExamID,StudentID),
Foreign key(StudentID)REFERENCES Student(StudentID),
Foreign key(ExamID)REFERENCES ExamAllocation(ExamID)
);

create table Exam(
StudentID int not null,
ModuleID int not null,
ExamDate varchar(20),
ExamTime varchar(20),
NumTimeAttended int,
SeatNo int,
HallNo varchar(10),
Primary key(StudentID,ModuleID),
Foreign key(ModuleID)REFERENCES Module(ModuleID),
Foreign key(StudentID)REFERENCES Student(StudentID)
);

--Student
insert into Student 
values('200018500132','Kamal','Colombo 07','2000/12/03','kamal@gmail.com','224466'),
	  ('200224350132','Chaminda','07/2 Maharagama, Pannipitiya','2002/05/20','Chaminda@gmail.com','467823'),
	  ('200468210135','Sunil','Colombo 05','2004/02/04','Sunil@gmail.com','33465'),
	  ('200114625125','Supun','542/D Kaluthara','2001/10/13','Supun@gmail.com','2468'),
	  ('200246782546','Manel','12/A Mathara','2002/06/07','Manel@gmail.com','2244'),
	  ('200046821654','Tharushi','Colombo 07','2000/04/14','Tharushi@gmail.com','33166'),
	  ('200176558246','Sadun','18/2 Kasbswa','2001/08/19','Sadun@gmail.com','1234567'),
	  ('200349853454','Oshara','Colombo 07','2003/11/01','Oshara@gmail.com','298246');