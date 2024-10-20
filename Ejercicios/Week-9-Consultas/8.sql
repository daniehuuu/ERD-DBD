SELECT 
    o.ShipCountry AS Pais_Destino,
    o.ShipCity AS Ciudad_Destino,
    o.ShipPostalCode AS CodigoPostal_Destino,
    COUNT(o.OrderID) AS TotalPedidos
FROM 
    Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE 
    (o.ShipCity <> c.City OR o.ShipPostalCode <> c.PostalCode) 
GROUP BY 
    o.ShipCountry, o.ShipCity, o.ShipPostalCode
ORDER BY 
    TotalPedidos ASC;