CREATE SCHEMA `company`; 
USE company;

# Create tables
CREATE TABLE department (
    Dname VARCHAR(20), 
    Dnumber INT NOT NULL, 
    Mgr_ssn CHAR(9), 
    Mgr_start_date DATE,
    PRIMARY KEY (Dnumber)
);

CREATE TABLE employee (
    Fname VARCHAR(25),
    Minit CHAR(1),
    Lname VARCHAR(25), 
    Ssn CHAR(9), 
    Bdate DATE,
    Address VARCHAR(50),
    Sex CHAR(1) CHECK (Sex IN ('M', 'F')),
    Salary FLOAT CHECK (Salary > 0), 
    Super_ssn CHAR(9),
    Dno INT,
    Partner_ssn CHAR(9),
    PRIMARY KEY (Ssn),
    FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn) ON DELETE SET NULL,
    FOREIGN KEY (Dno) REFERENCES department(Dnumber) ON DELETE SET NULL,
    FOREIGN KEY (Partner_ssn) REFERENCES employee(Ssn) ON DELETE SET NULL
);

CREATE TABLE dept_locations (
    D_number INT NOT NULL,
    D_location VARCHAR(20),
    PRIMARY KEY (D_number, D_location),
    FOREIGN KEY (D_number) REFERENCES department(Dnumber) ON DELETE CASCADE
);

CREATE TABLE project (
    Pname VARCHAR(20),
    Pnumber INT,
    Plocation VARCHAR(20),
    Dnum INT,
    PRIMARY KEY (Pnumber),
    FOREIGN KEY (Dnum) REFERENCES department(Dnumber) ON DELETE SET NULL
);

CREATE TABLE works_on (
    Essn CHAR(9),
    Pno INT,
    Hours INT,
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn) ON DELETE CASCADE,
    FOREIGN KEY (Pno) REFERENCES project(Pnumber) ON DELETE CASCADE
);

CREATE TABLE dependent (
    Essn CHAR(9),
    Dependent_name VARCHAR(15),
    Sex CHAR(1) CHECK (Sex IN ('M','F')),
    Bdate DATE,
    Relationship VARCHAR(15),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn) ON DELETE CASCADE
);

# Insert values into department
INSERT INTO department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES ('Headquarters', 1, NULL, '2020-01-01'),
       ('Research', 2, NULL, '2021-03-15');
       
SELECT * FROM department;

# Drop table
DROP TABLE IF EXISTS dependent;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS dept_locations;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

