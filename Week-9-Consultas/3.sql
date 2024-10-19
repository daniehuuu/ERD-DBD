SELECT E.LastName AS Apellido, E.FirstName AS Nombre, COUNT(O.OrderID) AS CantidadDeOrdenes
FROM EMPLOYEES E
INNER JOIN ORDERS O ON E.EmployeeID = O.EmployeeID
GROUP BY E.LastName, E.FirstName
ORDER BY 3 DESC;
