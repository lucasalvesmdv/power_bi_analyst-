create table department (
   Dname varchar(15) NOT NULL,
   Dnumber int NOT NULL PRIMARY KEY,
   Mgr_ssn char(9) NOT NULL,
   Mgr_start_date date,
   Dept_create_date date,
   CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn) ON UPDATE CASCADE,
   CONSTRAINT chk_dates CHECK (Dept_create_date < Mgr_start_date)
);

create table dept_locations (
  Dnumber int NOT NULL,
  Dlocation varchar(15) NOT NULL,
  PRIMARY KEY (Dnumber, Dlocation),
  CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES department(Dnumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

create table project (
  Pname varchar(15) NOT NULL,
  Pnumber int NOT NULL PRIMARY KEY,
  Plocation varchar(15),
  Dnum int NOT NULL,
  CONSTRAINT unique_project UNIQUE (Pname),
  CONSTRAINT fk_project FOREIGN KEY (Dnum) REFERENCES department(Dnumber)
);