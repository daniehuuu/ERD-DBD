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

/* //second way 
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
), Importes AS (
	SELECT País, MAX(Total) AS 'Max Importe'
	FROM Totales
	GROUP BY País
)
-- Retrieve the order details with the max amount per country
SELECT T.País, T.ID, T.Total
FROM Totales T
INNER JOIN Importes I ON T.País = I.País AND T.Total = I.[Max Importe]
ORDER BY 1
*/