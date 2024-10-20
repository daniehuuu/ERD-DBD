SELECT P.ProductID, P.ProductName as Nombre, C.CategoryID, P.UnitPrice as Precio
FROM Products P
INNER JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE P.UnitPrice > (
    SELECT AVG(P2.UnitPrice) 
    FROM Products P2 
    INNER JOIN Categories C ON P.CategoryID = C.CategoryID
    WHERE P.CategoryID = P2.CategoryID
)
AND P.Discontinued = 0
ORDER BY 3, 4