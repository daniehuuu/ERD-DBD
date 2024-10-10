SELECT 
    O.ShipCountry AS País,
    MAX(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS Monto_Mayor
FROM 
    Orders O
JOIN  
    [Order Details] OD ON O.OrderID = OD.OrderID
WHERE 
    O.ShippedDate IS NOT NULL
GROUP BY 
    O.ShipCountry
ORDER BY 
    Monto_Mayor DESC;