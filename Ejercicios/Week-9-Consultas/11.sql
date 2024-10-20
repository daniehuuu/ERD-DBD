--- to fix
SELECT e.Country AS País_Origen_Empleado, YEAR(o.OrderDate) AS Año, ROUND(SUM(od.Quantity * od.UnitPrice), 2) AS Monto
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.Country, YEAR(o.OrderDate)
ORDER BY Monto DESC, Año DESC;