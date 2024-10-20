SELECT P.ProductName, P.UnitsInStock, SUM(OD.Quantity) AS Pendiente, (SUM(OD.Quantity) - P.UnitsInStock) AS [Stock Faltante]
FROM Products P
JOIN [Order Details] OD ON P.ProductID=OD.ProductID
JOIN Orders O ON OD.OrderID=O.OrderID
WHERE O.ShippedDate IS NULL AND P.Discontinued = 0 
GROUP BY P.ProductName, P.UnitsInStock
HAVING SUM(OD.Quantity) > P.UnitsInStock