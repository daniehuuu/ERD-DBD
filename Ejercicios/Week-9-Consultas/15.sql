SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.Quantity) AS UnidadesVendidas, 
    COUNT(DISTINCT o.OrderID) AS CantidadOrdenes
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 2017
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(DISTINCT o.OrderID) >= 20