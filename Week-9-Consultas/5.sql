SELECT C.CompanyName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL

/*
Alternative
SELECT C.CompanyName
FROM Customers C
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders O
    WHERE O.CustomerID = C.CustomerID
);
*/