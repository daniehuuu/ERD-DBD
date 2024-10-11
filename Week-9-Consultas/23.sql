SELECT 
    País, 
    ID, 
    Total
FROM (
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
) AS Totales
WHERE Total = (
    SELECT MAX(Total)
    FROM (
        SELECT 
            O.ShipCountry AS País,
            SUM(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Total
        FROM 
            Orders O
        INNER JOIN  
            [Order Details] OD ON O.OrderID = OD.OrderID
        WHERE 
            O.ShippedDate IS NOT NULL
        GROUP BY 
            O.ShipCountry, O.OrderID
    ) AS TotalesSub
    WHERE TotalesSub.País = Totales.País
)
ORDER BY 1;