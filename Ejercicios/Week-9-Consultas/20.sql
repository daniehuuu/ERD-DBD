SELECT 
    p.ProductID,
    p.ProductName,
    p.CategoryID
FROM 
    Products p
LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID
LEFT JOIN Orders o ON o.OrderID = od.OrderID
WHERE 
    p.CategoryID = 8
    AND p.Discontinued = 0  
    AND (o.OrderDate IS NULL  
         OR o.OrderDate NOT BETWEEN '2016-08-01' AND '2016-08-15')  
    AND p.ProductID NOT IN (
        SELECT od2.ProductID
        FROM [Order Details] od2
        JOIN Orders o2 ON o2.OrderID = od2.OrderID
        WHERE o2.OrderDate BETWEEN '2016-08-01' AND '2016-08-15'
    )
GROUP BY 
    p.ProductID, p.ProductName, p.CategoryID
ORDER BY    
    p.ProductID ASC;