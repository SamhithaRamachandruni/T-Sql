CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);
GO

CREATE PROCEDURE GetHighEarningEmployees
    @SalaryThreshold DECIMAL(10,2)
AS
BEGIN
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary
    FROM 
        Employees
    WHERE 
        Salary > @SalaryThreshold;
END;
GO

CREATE PROCEDURE UpdateEmployeeSalary
    @DepartmentName VARCHAR(50),
    @PercentageIncrease DECIMAL(5,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * @PercentageIncrease / 100)
    WHERE Department = @DepartmentName;
END;


EXEC GetHighEarningEmployees @SalaryThreshold = 60000;
EXEC UpdateEmployeeSalary 
    @DepartmentName = 'Finance', 
    @PercentageIncrease = 10;

	select * from Employees