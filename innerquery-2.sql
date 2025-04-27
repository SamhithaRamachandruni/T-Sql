CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SalespersonID INT,
    Region VARCHAR(50),
    TotalSales DECIMAL(10, 2)
);
INSERT INTO Sales (SaleID, SalespersonID, Region, TotalSales)
VALUES
(1, 101, 'North', 5000),
(2, 102, 'North', 7000),
(3, 103, 'North', 6000),
(4, 104, 'South', 8000),
(5, 105, 'South', 7500),
(6, 106, 'South', 6500),
(7, 107, 'East', 4000),
(8, 108, 'East', 3000);

SELECT 
    SalespersonID,
    Region,
    TotalSales
FROM 
    Sales AS s
WHERE 
    TotalSales > (
        SELECT 
            AVG(TotalSales)
        FROM 
            Sales
        WHERE 
            Region = s.Region
    );
