SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS CantidadOrdenesPendientes
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.ShippedDate IS NULL
GROUP BY c.CustomerID, c.CompanyName
ORDER BY CantidadOrdenesPendientes DESC;