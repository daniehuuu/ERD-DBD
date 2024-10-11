WITH Totales AS (
    SELECT 
        O.ShipCountry AS País,
        O.OrderID AS ID, 
        SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Total
    FROM 
        Orders O
    INNER JOIN  
        [Order Details] OD ON O.OrderID = OD.OrderID
    WHERE 
        O.ShippedDate IS NOT NULL
    GROUP BY 
        O.ShipCountry, O.OrderID
)

SELECT 
    País, 
    ID, 
    Total
FROM Totales T1
WHERE Total = (
    SELECT MAX(T2.Total)
    FROM Totales T2
    WHERE T1.País = T2.País
)
ORDER BY 1