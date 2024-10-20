SELECT s.ShipperID AS Código_Compañía, s.CompanyName AS Nombre_Compañía
FROM Shippers s
JOIN Orders o ON s.ShipperID = o.ShipVia
WHERE o.ShipCountry = 'Mexico'
AND o.OrderDate BETWEEN '20180101' AND '20180228'
GROUP BY s.ShipperID, s.CompanyName
ORDER BY ShipperID DESC;