SELECT P.ProductID, P.ProductName as Nombre, P.UnitPrice as Precio
FROM Products P 
WHERE P.Discontinued = 1 AND
      P.UnitPrice < (
          SELECT AVG(P2.UnitPrice) 
          FROM Products P2 
		  WHERE P2.Discontinued = 1
      );