CREATE TABLE MonthlySales (
    Month VARCHAR(20),
    Region VARCHAR(50),
    TotalSales DECIMAL(10, 2)
);
INSERT INTO MonthlySales (Month, Region, TotalSales)
VALUES
('January', 'North', 10000),
('February', 'North', 12000),
('March', 'North', 11000),
('January', 'South', 8000),
('February', 'South', 7500),
('March', 'South', 8500);

SELECT 
    Month,
    Region,
    TotalSales,
    LAG(TotalSales) OVER (PARTITION BY Region ORDER BY 
        CASE 
            WHEN Month = 'January' THEN 1
            WHEN Month = 'February' THEN 2
            WHEN Month = 'March' THEN 3
            WHEN Month = 'April' THEN 4
            WHEN Month = 'May' THEN 5
            WHEN Month = 'June' THEN 6
            WHEN Month = 'July' THEN 7
            WHEN Month = 'August' THEN 8
            WHEN Month = 'September' THEN 9
            WHEN Month = 'October' THEN 10
            WHEN Month = 'November' THEN 11
            WHEN Month = 'December' THEN 12
        END
    ) AS PreviousMonthSales,
    (TotalSales - LAG(TotalSales) OVER (PARTITION BY Region ORDER BY 
        CASE 
            WHEN Month = 'January' THEN 1
            WHEN Month = 'February' THEN 2
            WHEN Month = 'March' THEN 3
            WHEN Month = 'April' THEN 4
            WHEN Month = 'May' THEN 5
            WHEN Month = 'June' THEN 6
            WHEN Month = 'July' THEN 7
            WHEN Month = 'August' THEN 8
            WHEN Month = 'September' THEN 9
            WHEN Month = 'October' THEN 10
            WHEN Month = 'November' THEN 11
            WHEN Month = 'December' THEN 12
        END
    )) AS SalesDifference
FROM 
    MonthlySales
ORDER BY 
    Region, 
    CASE 
        WHEN Month = 'January' THEN 1
        WHEN Month = 'February' THEN 2
        WHEN Month = 'March' THEN 3
        WHEN Month = 'April' THEN 4
        WHEN Month = 'May' THEN 5
        WHEN Month = 'June' THEN 6
        WHEN Month = 'July' THEN 7
        WHEN Month = 'August' THEN 8
        WHEN Month = 'September' THEN 9
        WHEN Month = 'October' THEN 10
        WHEN Month = 'November' THEN 11
        WHEN Month = 'December' THEN 12
    END;

	SELECT 
    Month,
    Region,
    TotalSales,
    LAG(TotalSales) OVER (PARTITION BY Region ORDER BY 
        CASE 
            WHEN Month = 'January' THEN 1
            WHEN Month = 'February' THEN 2
            WHEN Month = 'March' THEN 3
            WHEN Month = 'April' THEN 4
            WHEN Month = 'May' THEN 5
            WHEN Month = 'June' THEN 6
            WHEN Month = 'July' THEN 7
            WHEN Month = 'August' THEN 8
            WHEN Month = 'September' THEN 9
            WHEN Month = 'October' THEN 10
            WHEN Month = 'November' THEN 11
            WHEN Month = 'December' THEN 12
        END
    ) AS PreviousMonthSales,
    (TotalSales - LAG(TotalSales) OVER (PARTITION BY Region ORDER BY 
        CASE 
            WHEN Month = 'January' THEN 1
            WHEN Month = 'February' THEN 2
            WHEN Month = 'March' THEN 3
            WHEN Month = 'April' THEN 4
            WHEN Month = 'May' THEN 5
            WHEN Month = 'June' THEN 6
            WHEN Month = 'July' THEN 7
            WHEN Month = 'August' THEN 8
            WHEN Month = 'September' THEN 9
            WHEN Month = 'October' THEN 10
            WHEN Month = 'November' THEN 11
            WHEN Month = 'December' THEN 12
        END
    )) AS SalesDifference,
    CASE 
        WHEN TotalSales < LAG(TotalSales) OVER (PARTITION BY Region ORDER BY 
            CASE 
                WHEN Month = 'January' THEN 1
                WHEN Month = 'February' THEN 2
                WHEN Month = 'March' THEN 3
                WHEN Month = 'April' THEN 4
                WHEN Month = 'May' THEN 5
                WHEN Month = 'June' THEN 6
                WHEN Month = 'July' THEN 7
                WHEN Month = 'August' THEN 8
                WHEN Month = 'September' THEN 9
                WHEN Month = 'October' THEN 10
                WHEN Month = 'November' THEN 11
                WHEN Month = 'December' THEN 12
            END
        ) THEN 'Decrease'
        ELSE 'No Decrease'
    END AS SalesTrend
FROM 
    MonthlySales
ORDER BY 
    Region, 
    CASE 
        WHEN Month = 'January' THEN 1
        WHEN Month = 'February' THEN 2
        WHEN Month = 'March' THEN 3
        WHEN Month = 'April' THEN 4
        WHEN Month = 'May' THEN 5
        WHEN Month = 'June' THEN 6
        WHEN Month = 'July' THEN 7
        WHEN Month = 'August' THEN 8
        WHEN Month = 'September' THEN 9
        WHEN Month = 'October' THEN 10
        WHEN Month = 'November' THEN 11
        WHEN Month = 'December' THEN 12
    END;
