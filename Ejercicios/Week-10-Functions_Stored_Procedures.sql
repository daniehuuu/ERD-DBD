Use NORTHWND1

GO

/*Pregunta 1 Crear una función que retorne el país de procedencia del cliente con la menor cantidad de pedidos 
atendidos para un determinado año. */

--- Nombre entidades: customers / Orders

CREATE VIEW vPaisTOrdenes
AS
SELECT C.Country, YEAR(O.OrderDate) AS 'Fecha', COUNT(OrderID) AS 'Total Ordenes'
FROM Customers C
INNER JOIN Orders O ON C.CustomerID=O.CustomerID
GROUP BY C.Country, YEAR(O.OrderDate)

---Cosultar la vista: SELECT * FROM vPaisTOrdenes

---Crear la Funcion

CREATE FUNCTION fPaisCliente (@y int) RETURNS TABLE
AS
RETURN 
SELECT Country, [Total Ordenes]
FROM vPaisTordenes
WHERE [Total Ordenes] = (Select Min([Total Ordenes]) 
						 FROM vPaisTOrdenes
						 WHERE Fecha = @y)
SELECT * FROM dbo.fPaisCliente (2016)

/*Pregunta 5 Crear una función que retorne el nombre del shipper con mayor cantidad de pedidos atendidos para
un determinado año.*/---Nombre entidades: Orders
CREATE VIEW vNombreShippersASSELECT O.ShipName, YEAR(O.OrderDate) AS 'Fecha', COUNT(OrderID) AS 'Total Ordenes'FROM Orders OGROUP BY O.ShipName, YEAR(O.OrderDate)
---Crear la Funcion
CREATE FUNCTION fNombreShipper (@y int) RETURNS TABLE
AS
RETURN 
SELECT ShipName, [Total Ordenes]
FROM vNombreShippers
WHERE [Total Ordenes] = (Select Max([Total Ordenes]) 
						 FROM vNombreShippers
						 WHERE Fecha = @y)

SELECT * FROM dbo.fNombreShipper (2016)




/*Pregunta 8 Crear un procedimiento o función que liste la relación de productos para una determinada categoría.*/

CREATE PROCEDURE sp_listarprodcat
@categoryName NVARCHAR(15)
AS
SELECT P.ProductName, C.CategoryName
FROM Products P
INNER JOIN Categories C ON P.CategoryID=C.CategoryID
WHERE C.CategoryName=@categoryName

--- Ejecutar SP: sp:listarprodcat
EXEC sp_listarprodcat @CategoryName= 'Produce'



/*Pregunta 9  Crear un procedimiente o función que muestre los productos que comercializa un determinado 
proveedor.*/

CREATE PROCEDURE sp_listarprodprov
@CompanyName NVARCHAR(40)
AS
SELECT P.ProductName AS 'Nombre Producto' , S.CompanyName AS 'Nombre Proveedor' 
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID=S.SupplierID
WHERE S.CompanyName=@CompanyName

EXEC sp_listarprodprov 'New England Seafood Cannery'


/* Pregunta 13  Mostrar en un procedimiento almacenado, el país donde se ha vendido más órdenes durante un año 
ingresado como parámetro. */

CREATE PROCEDURE sp_obtenerañopais
@Year INT
AS
SELECT C.Country,COUNT(O.OrderID) AS 'Total_ordenes'
FROM Orders O
INNER JOIN Customers C ON O.CustomerID=C.CustomerID
WHERE YEAR(O.OrderDate) = @Year
GROUP BY C.Country
ORDER BY Total_ordenes DESC
EXEC sp_obtenerañopais '2016'