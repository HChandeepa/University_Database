use NSBM;

create table student(
stud_id int primary key identity(0,1),
NIC varchar(13) not null,
Sname varchar,
Address varchar,
DOB date,
Email varchar,
password varchar);


create table dependent(
stud_id int,
Name varchar,
Ph_no int,
Relaionship varchar,
foreign key (stud_id) references student (stud_id));

create table Phone_Number(
Stud_id int,
Ph_no int,
foreign key(stud_id) references student(stud_id),
primary key(stud_id,Ph_no));


