CREATE DATABASE Company;
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
    PRIMARY KEY (Ssn),
    FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn) ON DELETE SET NULL,
    FOREIGN KEY (Dno) REFERENCES department(Dnumber) ON DELETE SET NULL
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
# Add Partner_ssn
ALTER TABLE employee
ADD Partner_ssn CHAR(9),
ADD FOREIGN KEY (Partner_ssn) REFERENCES employee(Ssn)
    ON DELETE SET NULL;
    
# Insert values into department
INSERT INTO department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES 
('Headquarters', 1, '123456789', '2020-01-01'),
('Research',     2, '987654321', '2021-03-15');

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES
('John',  'B', 'Smith',   '123456789', '1985-05-15', '123 Main St', 'M', 60000, NULL,         1),
('Mary',  'A', 'Johnson', '987654321', '1987-07-20', '456 Oak St',  'F', 65000, '123456789',  2),
('James', 'C', 'Brown',   '555667777', '1990-09-12', '789 Pine St', 'M', 50000, '123456789',  1);

# Now update partner references safely
UPDATE employee SET Partner_ssn = '987654321' WHERE Ssn = '123456789';
UPDATE employee SET Partner_ssn = '123456789' WHERE Ssn = '987654321';


INSERT INTO dept_locations (D_number, D_location)
VALUES
(1, 'New York'),
(2, 'Dallas');

INSERT INTO project (Pname, Pnumber, Plocation, Dnum)
VALUES
('ProjectA', 101, 'New York', 1),
('ProjectB', 102, 'Dallas',   2),
('ProjectC', 103, 'New York', 1);

INSERT INTO works_on (Essn, Pno, Hours)
VALUES
('123456789', 101, 20),
('987654321', 101, 15),
('987654321', 102, 10),
('555667777', 103, 30);

INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES
('123456789', 'Anna',    'F', '2015-08-10', 'Daughter'),
('123456789', 'Tom',     'M', '2012-03-22', 'Son'),
('987654321', 'Michael', 'M', '2017-06-05', 'Son'),
('555667777', 'Emma',    'F', '2018-11-14', 'Daughter');



# Drop table
DROP TABLE IF EXISTS dependent;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS dept_locations;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;

