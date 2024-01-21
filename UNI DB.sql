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