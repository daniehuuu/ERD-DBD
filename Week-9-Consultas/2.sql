SELECT P.ProductName, COUNT(*) AS 'Cantidad'
FROM [Order Details] OD
INNER JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName
HAVING COUNT(*) = (
    SELECT MAX(Quantity) AS 'Cantidad de Ordenes'
    FROM (
        SELECT ProductID, COUNT(*) Quantity
        FROM [Order Details]
        GROUP BY ProductID
    ) WX42
)