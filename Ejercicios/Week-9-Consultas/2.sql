SELECT 
    c.CompanyName AS NombreCompania,
    COUNT(o.OrderID) AS CantidadOrdenes
FROM 
    Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CompanyName