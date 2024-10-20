SELECT 
    Codigo_Producto AS ProductID,
    Nombre_Producto AS ProductName,
    Codigo_Categoria AS CategoryID,
    Nombre_Categoria AS CategoryName,
    Cantidad_Vendida AS Q_Maxi
FROM (
    SELECT 
        p.ProductID AS Codigo_Producto,
        p.ProductName AS Nombre_Producto,
        c.CategoryID AS Codigo_Categoria,
        c.CategoryName AS Nombre_Categoria,
        SUM(od.Quantity) AS Cantidad_Vendida,
        ROW_NUMBER() OVER (PARTITION BY c.CategoryID ORDER BY SUM(od.Quantity) DESC) AS rn
    FROM 
        [Order Details] od
    JOIN Orders o ON o.OrderID = od.OrderID
    JOIN Products p ON p.ProductID = od.ProductID
    JOIN Categories c ON c.CategoryID = p.CategoryID
    WHERE 
        YEAR(o.OrderDate) = 2017
    GROUP BY 
        c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
) AS ProductSales
WHERE 
    rn = 1
ORDER BY 
    Codigo_Producto ASC;