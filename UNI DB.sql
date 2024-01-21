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
