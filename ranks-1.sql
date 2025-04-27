CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Doe', 'HR', 50000),
(2, 'Jane', 'Smith', 'HR', 55000),
(3, 'Alice', 'Brown', 'IT', 70000),
(4, 'Bob', 'White', 'IT', 70000),
(5, 'Charlie', 'Black', 'IT', 60000),
(6, 'Diana', 'Green', 'Finance', 65000),
(7, 'Evan', 'Gray', 'Finance', 65000),
(8, 'Fiona', 'Blue', 'Finance', 62000);

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS RankSalary,
    DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DenseRankSalary
FROM Employees;

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary,
    ROW_NUMBER() OVER (ORDER BY EmployeeID) AS RowNum
FROM Employees;
