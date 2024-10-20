SELECT 
    o.OrderID,
    o.CustomerID,
    o.OrderDate,
    o.ShippedDate,
    DATEDIFF(DAY, o.OrderDate, o.ShippedDate) AS DiferenciaEnDias,
    DATEDIFF(DAY, o.OrderDate, o.ShippedDate) / 7.0 AS DiferenciaEnSemanas,
    DATEDIFF(MONTH, o.OrderDate, o.ShippedDate) AS DiferenciaEnMeses
FROM 
    Orders o
WHERE 
    o.ShippedDate IS NOT NULL 
    AND DATEDIFF(DAY, o.OrderDate, o.ShippedDate) / 7.0 > 4  
ORDER BY 
    o.OrderID ASC;