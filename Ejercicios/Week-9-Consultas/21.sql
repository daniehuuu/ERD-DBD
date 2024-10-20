SELECT C.CategoryID as Categoria, C.CategoryName as Nombre, COUNT(ProductID) as Cantidad
FROM Products P
INNER JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryID, C.CategoryName
HAVING COUNT(ProductID) = (
    SELECT MAX(Cantidad)
    FROM (
        SELECT C.CategoryID as Categoria, C.CategoryName as Nombre, COUNT(ProductID) as Cantidad
        FROM Products P
        INNER JOIN Categories C ON P.CategoryID = C.CategoryID
        GROUP BY C.CategoryID, C.CategoryName
    ) AS Cantidad
)