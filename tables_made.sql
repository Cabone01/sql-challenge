CREATE TABLE titles(
    titleID VARCHAR,
    title VARCHAR,
    PRIMARY KEY (titleID)
);

CREATE TABLE employee(
    employeeID SERIAL,
    employeeTitle VARCHAR,
    birthday DATE,
    firstName VARCHAR,
    lastName VARCHAR,
    sex VARCHAR(1),
    hireDate DATE,
    PRIMARY KEY (employeeID),
    FOREIGN KEY (employeeTitle) REFERENCES titles(titleID)
);

CREATE TABLE departments(
    deptID VARCHAR,
    deptName VARCHAR,
    PRIMARY KEY (deptID)
);

CREATE TABLE deptManager(
    deptID VARCHAR,
    managerID SERIAL,
    FOREIGN KEY (managerID) REFERENCES employee(employeeID),
    FOREIGN KEY (deptID) REFERENCES departments(deptID)
);

CREATE TABLE deptEmployees(
    empID SERIAL,
    deptID VARCHAR,
    FOREIGN KEY (empID) REFERENCES employee(employeeID),
    FOREIGN KEY (deptID) REFERENCES departments(deptID)
);

CREATE TABLE salaries(
    empID SERIAL,
    salary INT,
    FOREIGN KEY (empID) REFERENCES employee(employeeID)
);