SELECT 
    c.CustomerID AS CodigoCliente,
    c.CompanyName AS NombreCompania
FROM 
    Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.ShippedDate IS NULL  
GROUP BY 
    c.CustomerID, c.CompanyName
ORDER BY 
    c.CompanyName ASC;