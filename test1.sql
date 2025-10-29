drop schema if exists company;
create schema company;
use company;


create table Department (
	Dname Varchar(10) Not NULL,
    Dnumber Integer default 0,
    Mgr_ssn char(9),
    Mgr_start_date  char(9),
    unique (Dname),
    primary key (Dnumber)
);
create table Employee (
	Fname varchar(10) not null,
    Minit char(1),
    Lname varchar(10) not null, 
    Ssn char(9),
    Bdate date not null, 
    Address varchar(50),
    Sex char(1)check(sex in('M', 'F')),
    Salary float,
    Super_ssn char(9),
    Dno int,
    primary key (Ssn),
    foreign key (Super_Ssn) references Employee(Ssn),
    foreign key (Dno) references Department(Dnumber)
);

create table Dept_location(
	Dnumber int,
    Dlocation varchar(50),
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references Department(Dnumber)
);
create table Project(
	Pname varchar(10),
    Pnumber int,
    Plocation varchar(50),
    Dnum int,
    primary key (Pnumber),
    foreign key (Dnum) references Department(Dnumber)
);
Create table Works_on (
	Essn char(9),
    Pno int,
    Hours int,
    primary key(Essn , Pno),
    foreign key (Essn) references Employee(Ssn),
    foreign key (Pno) references Project(Pnumber)
);
create table dependent(
	Essn char(9),
    Dependent_name varchar(10),
    Sex char(1) check (sex in ('M', 'F')),
    Bdate date,
    Relationship varchar(10),
    primary key (Essn, Dependent_name),
    Foreign key (Essn) references Employee(Ssn)
);
alter table department
	add foreign key (Mgr_ssn) references Employee(Ssn);
	
drop table if exists Employee; 