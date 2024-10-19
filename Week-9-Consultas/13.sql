SELECT 
    e.EmployeeID AS JefeID, 
    e.LastName AS ApellidoJefe, 
    YEAR(o.OrderDate) AS Año, 
    MONTH(o.OrderDate) AS Mes, 
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS VentaAcumulada, 
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) * 0.005 AS Comision
FROM Employees e
JOIN Employees sub ON e.EmployeeID = sub.ReportsTo
JOIN Orders o ON o.EmployeeID = sub.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.LastName, YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY e.EmployeeID, Año, Mes