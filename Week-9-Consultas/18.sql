SELECT O.OrderID, O.OrderDate, O.ShippedDate, DATEDIFF(DAY, O.OrderDate, O.ShippedDate) AS DiasParaDespacho
FROM Orders O
WHERE O.ShippedDate IS NOT NULL AND DATEDIFF(DAY, O.OrderDate, O.ShippedDate) > 
	(
        SELECT AVG(DATEDIFF(DAY, O.OrderDate, O.ShippedDate))
        FROM Orders O
        WHERE O.ShippedDate IS NOT NULL
    )
	AND DATEDIFF(DAY, O.OrderDate, O.ShippedDate) / 7.0 >
	(
        SELECT AVG(DATEDIFF(DAY, O.OrderDate, O.ShippedDate) / 7.0)
        FROM Orders O
        WHERE O.ShippedDate IS NOT NULL
    )