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
	  ('200468210132','Sunil','Colombo 05','2004/02/04','Sunil@gmail.com','33465'),
	  ('200114625125','Supun','542/D Kaluthara','2001/10/13','Supun@gmail.com','2468'),
	  ('200246782546','Manel','12/A Mathara','2002/06/07','Manel@gmail.com','2244'),
	  ('200046821654','Tharushi','Colombo 07','2000/04/14','Tharushi@gmail.com','33166'),
	  ('200176558246','Sadun','18/2 Kasbswa','2001/08/19','Sadun@gmail.com','1234567'),
	  ('200349853454','Oshara','Colombo 07','2003/11/01','Oshara@gmail.com','298246');

--Faculty
insert into Faculty 
values('FOC','Faculty of Computing'),
	  ('FOB','Faculty of Business'),
	  ('FOE','Faculty of Engineering'),
	  ('FOS','Faculty of Science'),
	  ('FOP','Faculty of Postgraduate Studies');

--Department
insert into Department 
values(1,'Department of Computer and Data Science','FOC'),
	  (2,'Department of Network and Security','FOC'),
	  (3,'Department of  Software Engineering','FOC'),
	  (4,'Department of Information and Systems Sciences','FOC'),
	  (5,'Department of Mechatronic and Industry Engineering','FOE'),
	  (6,'Department of Design Studies','FOE'),
	  (7,'Department of Biomedical Science','FOS'),
	  (8,'Department of Management','FOB'),
	  (9,'Department of Accounting and Finance','FOB'),
	  (10,'Department of Marketing and Tourism','FOB'),
	  (11,'Department of Operations and Logistics','FOB'),
	  (12,'Department of English and Modern Languages','FOB');

--Degree
insert into Degree
values(1,'BSC (HONS) COMPUTER SCIENCE','PLYMOUTH',1),
	  (2,'BSC (HONS) COMPUTER SECURITY','PLYMOUTH',2),
	  (3,'BSC (HONS) IN SOFTWARE ENGINEERING','PLYMOUTH',3),
	  (4,'BSC (HONS) TECHNOLOGY MANAGEMENT','PLYMOUTH',4),
	  (5,'BENG (HONS) CIVIL AND STRUCTURAL ENGINEERING','PLYMOUTH',5),
	  (6,'BACHELOR OF INTERIOR DESIGN','UGC',6),
	  (7,'BSC (HONS) PSYCHOLOGY','PLYMOUTH',7),
	  (8,'BSC (HONS) IN SOFTWARE ENGINEERING','UGC',3),
	  (9,'BM (HONS) IN ACCOUNTING AND FINANCE','UGC',9),
	  (10,'BSC (HONS) COMPUTER NETWORKS','UGC',2),
	  (11,'BSC (HONOURS) IN DATA SCIENCE','PLYMOUTH',1),
	  (12,'BACHELOR OF INFORMATION TECHNOLOGY ','VICTORIA ',2);

--Dependent
INSERT INTO Dependent 
VALUES(4, 'Johan', '1234567890', 'Father'),
	  (11, 'Chaminda', '9876543210', 'Father'),
	  (10, 'Manoja', '5551234567', 'Mother'),
  	  (8, 'Nayana', '7778889999', 'Mother'),
	  (13, 'Dhanidu', '4445556666', 'Father');

--Person
INSERT INTO Person
VALUES
(11, 'Sophia Davis', 'sophia.davis@example.com', 'password11'),
(12, 'Liam Wilson', 'liam.wilson@example.com', 'password12'),
(13, 'Emma Brown', 'emma.brown@example.com', 'password13'),
(14, 'Mia Johnson', 'mia.johnson@example.com', 'password14'),
(15, 'Aiden Taylor', 'aiden.taylor@example.com', 'password15'),
(16, 'Ella White', 'ella.white@example.com', 'password16'),
(17, 'Carter Anderson', 'carter.anderson@example.com', 'password17'),
(18, 'Aria Martinez', 'aria.martinez@example.com', 'password18'),
(19, 'Lucas Smith', 'lucas.smith@example.com', 'password19'),
(20, 'Isabella Davis', 'isabella.davis@example.com', 'password20');

--Lecturer
insert into Lecturer
values
  (1, 'Ph.D. in Computer Science', 1),
  (2, 'M.Sc. in Electrical Engineering', 2),
  (3, 'Ph.D. in Psychology', 3),
  (4, 'M.A. in English Literature', 4),
  (5, 'Ph.D. in Business Administration', 5),
  (6, 'M.Sc. in Physics', 6),
  (7, 'Ph.D. in Mechanical Engineering', 7),
  (8, 'M.A. in Sociology', 8),
  (9, 'Ph.D. in Economics', 9),
  (10, 'M.Sc. in Computer Networks', 10),
  (11, 'Ph.D. in Data Science', 1),
  (12, 'M.Sc. in Information Technology', 2);

  --Person_Access
insert into PersonAccess
values
  (2, 1, '2024-01-14 08:00:00'), 
  (1, 2, '2024-01-14 09:15:00'), 
  (4, 3, '2024-01-14 10:30:00'), 
  (12, 4, '2024-01-14 11:45:00'), 
  (10, 5, '2024-01-14 13:00:00'), 
  (8, 6, '2024-01-14 14:15:00'), 
  (7, 7, '2024-01-14 15:30:00'), 
  (9, 8, '2024-01-14 16:45:00');

  --Admin
insert into Admin
values
  (10, 1),
  (11, 0),
  (12, 1),
  (13, 1),
  (14, 1),
  (15, 0),
  (16, 3),
  (17, 0),
  (18, 2),
  (19, 0),
  (20, 2);

--Module
INSERT INTO Module
VALUES
(1, 'Introduction to Programming', '1', 1),
(2, 'Database Management', '2', 2),
(3, 'Web Development', '2', 3),
(4, 'Data Structures and Algorithms', '1', 4),
(5, 'Artificial Intelligence', '2', 5),
(6, 'Software Engineering', '1', 6),
(7, 'Network Security', '1', 7),
(8, 'Mobile App Development', '2', 8),
(9, 'Human-Computer Interaction', '1', 9),
(10, 'Machine Learning', '2', 10);

-- DegreeModuleAllocation
INSERT INTO DegreeModuleAllocation
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(3, 6),
(3, 8),
(4, 9),
(5, 10);

--Result
INSERT INTO Result
VALUES
(1, 1, 95, 1),
(2, 1, 88, 1),
(1, 2, 75, 2),
(4, 2, 92, 2),
(2, 3, 80, 3),
(4, 3, 87, 3),
(7, 4, 93, 4),
(8, 4, 78, 4),
(9, 5, 85, 5),
(10, 5, 90, 5);

--PhoneNo
INSERT INTO PhoneNo (StudentID, PhoneNo) VALUES
(1, '1234567890'),
(2, '9876543210'),
(1, '5551234567'),
(4, '7778889999'),
(4, '4445556666'),
(2, '1112233445'),
(7, '9998887776'),
(8, '3332221110'),
(9, '6667778888'),
(10, '2223334444');

--Access_Validity
insert into AccessValidity
values
  (1, 'Active', 'Paid'),
  (2, 'Active', 'Not Paid'),
  (4, 'Active', 'Paid'),
  (7, 'Deactive', 'Not Paid'),
  (8, 'Active', 'Paid'),
  (9, 'Deactive', 'Not Paid'),
  (10, 'Active', 'Paid'),
  (12, 'Deactive', 'Not Paid');

  --Exam
insert into Exam (StudentID, Examdate, ExamTime, NumTimeAttended, SeatNo, HallNo, ModuleID)
values
  (1, '2024-01-15', '09:00 AM', 3, null, null, 1),
  (2, '2024-01-16', '02:00 PM', 3, null, null, 2),
  (4, '2024-01-17', '11:00 AM', 3, null, null, 3),
  (7, '2024-01-18', '10:00 AM', 3, null, null, 4),
  (8, '2024-01-19', '01:00 PM', null, 13, 'Hall5', 5),
  (9, '2024-01-20', '03:00 PM', null, 20, 'Hall6', 6),
  (10, '2024-01-21', '12:00 PM', null, 60, 'Hall7', 7),
  (12, '2024-01-22', '04:00 PM', null, 40, 'Hall8', 8),
  (11, '2024-01-23', '02:30 PM', null, 63, 'Hall9', 9),
  (13, '2024-01-24', '09:30 AM', null, 24, 'Hall10', 10);

  --Attendence
INSERT INTO Attendence
VALUES
(1, 1, '80'),
(2, 1, '79'),
(1, 2, '90'),
(4, 2, '60'),
(2, 3, '75'),
(7, 3, '83'),
(7, 4, '100'),
(8, 4, '95'),
(9, 5, '100'),
(10, 5, '66');



--ExamAllocation
INSERT INTO ExamAllocation (ExamID, ModuleID, EmpID) VALUES
(1, 1, 1),
(2, 2, 20),
(3, 3, 9),
(4, 4, 4),
(5, 5, 14),
(6, 6, 16),
(7, 7, 11),
(8, 8, 4),
(9, 9, 6),
(10, 10, 13);

--ExamStudentAllocation
INSERT INTO ExamStudentAllocation (ExamID, StudentID, Participation) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 4, 0),
(2, 4, 1),
(2, 7, 1),
(2, 8, 0),
(3, 7, 1),
(3, 8, 1),
(3, 9, 0),
(4, 10, 1);

--AccountDetails
insert into AccountDetails (TransID, StudentID, AccountNo)
values
  (1, 1, '12345678'),
  (2, 2, '23456789'),
  (3, 7, '34567890'),
  (4, 4, '45678901'),
  (5, 8, '56789012');

--Payment
insert into Payment (PayID, PostDate, Amount, TransID, RecNo, PaymentType, StudentID)
values
  (1, '2024-01-25', 500.00, 1, null, 'Bank', 1),
  (2, '2024-01-26', 750.00, 2, null,'Bank', 2),
  (3, '2024-01-27', 600.00, 3, null, 'Bank', 7),
  (4, '2024-01-28', 800.00, 4, null, 'Bank', 4),
  (5, '2024-01-29', 700.00, 5, null, 'Bank', 8),
  (6, '2024-01-30', 550.00, null, 1, 'Cash', 11),
  (7, '2024-01-31', 900.00, null, 3, 'Cash', 12),
  (8, '2024-02-01', 650.00, null, 2, 'Cash', 13),
  (9, '2024-02-02', 700.00, null, 4, 'Cash', 9),
  (10, '2024-02-03', 850.00, null, 5, 'Cash', 10);


@nic varchar(255),
@name varchar(255),
@address varchar(255),
@dob varchar(255),
@email varchar(255),
@password varchar(255)
) AS
begin

insert into Student(NIC,name,Address,DOB,Email,Password)
values(@nic,@name,@address,@dob,@email,@password);

end;

GO
/****** Object:  StoredProcedure [dbo].[AddNewStudent]    Script Date: 13/01/2024 9:55:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[AddNewStudent](

@nic varchar(255),
@name varchar(255),
@address varchar(255),
@dob varchar(255),
@email varchar(255),
@password varchar(255)
) AS
begin

insert into Student(NIC,name,Address,DOB,Email,Password)
values(@nic,@name,@address,@dob,@email,@password);

end;