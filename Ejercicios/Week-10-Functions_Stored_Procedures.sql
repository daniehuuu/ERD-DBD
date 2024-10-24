
USE NORTHWND1

GO


/*Pregunta 1 Crear una funci�n que retorne el pa�s de procedencia del cliente con la menor cantidad de pedidos 
atendidos para un determinado a�o. */


CREATE VIEW vPaisTOrdenes
AS
SELECT C.Country, YEAR(O.OrderDate) AS 'Fecha', COUNT(OrderID) AS 'Total Ordenes'
FROM Customers C
INNER JOIN Orders O ON C.CustomerID=O.CustomerID
GROUP BY C.Country, YEAR(O.OrderDate)

CREATE FUNCTION fPaisCliente (@y int) RETURNS TABLE
AS
RETURN 
SELECT Country, [Total Ordenes]
FROM vPaisTordenes
WHERE [Total Ordenes] = (Select Min([Total Ordenes]) 
						 FROM vPaisTOrdenes
						 WHERE Fecha = @y)
SELECT * FROM dbo.fPaisCliente (2016)

/* 2 */

CREATE VIEW vCategoriaCantidad
AS
SELECT 
    C.CategoryName, 
    YEAR(O.OrderDate) AS 'A�o', 
    SUM(OD.Quantity) AS 'TotalProductosVendidos'
FROM 
    [Order Details] OD
    INNER JOIN Products P ON OD.ProductID = P.ProductID
    INNER JOIN Categories C ON P.CategoryID = C.CategoryID
    INNER JOIN Orders O ON OD.OrderID = O.OrderID
GROUP BY 
    C.CategoryName, 
    YEAR(O.OrderDate);

CREATE FUNCTION fCategoriaTopPorA�o (@y INT) 
RETURNS TABLE
AS
RETURN 
    SELECT CategoryName, [TotalProductosVendidos]
    FROM vCategoriaCantidad
    WHERE [TotalProductosVendidos] = (
        SELECT MAX([TotalProductosVendidos])
        FROM vCategoriaCantidad
        WHERE A�o = @y
    ) AND A�o = @y;

SELECT * FROM dbo.fCategoriaTopPorA�o(2023);

/* 3 */

CREATE VIEW vOrdenesPorA�o
AS
SELECT YEAR(O.OrderDate) AS 'A�o', COUNT(O.OrderID) AS 'TotalOrdenes'
FROM Orders O
GROUP BY YEAR(O.OrderDate);

CREATE FUNCTION fCantidadOrdenesPorA�o (@y INT) 
RETURNS TABLE
AS
RETURN 
    SELECT A�o, TotalOrdenes
    FROM vOrdenesPorA�o
    WHERE A�o = @y;

SELECT * FROM dbo.fCantidadOrdenesPorA�o(2018);

/* 4 */

CREATE VIEW vOrdenesCompa�ia
AS
SELECT 
    C.Country, 
    YEAR(O.OrderDate) AS 'Fecha', 
    COUNT(O.OrderID) AS 'Total Ordenes'
FROM 
    Customers C
INNER JOIN 
    Orders O ON C.CustomerID = O.CustomerID
GROUP BY 
    C.Country, YEAR(O.OrderDate);

CREATE FUNCTION fCompa�iaConMasOrdenes (@y INT) 
RETURNS TABLE
AS
RETURN 
(
    SELECT 
        C.CompanyName, 
        COUNT(O.OrderID) AS 'Total Ordenes'
    FROM 
        Customers C
    INNER JOIN 
        Orders O ON C.CustomerID = O.CustomerID
    WHERE 
        YEAR(O.OrderDate) = @y
    GROUP BY 
        C.CompanyName
    HAVING 
        COUNT(O.OrderID) = (SELECT MAX(TotalOrdenes) 
                            FROM (
                                SELECT COUNT(OrderID) AS TotalOrdenes
                                FROM Orders
                                WHERE YEAR(OrderDate) = @y
                                GROUP BY CustomerID
                            ) AS SubQuery)
);

SELECT * FROM dbo.fCompa�iaConMasOrdenes(2016);

/*Pregunta 5 Crear una funci�n que retorne el nombre del shipper con mayor cantidad de pedidos atendidos para
un determinado a�o.*/

---Nombre entidades: Orders

CREATE VIEW vNombreShippers
AS
SELECT O.ShipName, YEAR(O.OrderDate) AS 'Fecha', COUNT(OrderID) AS 'Total Ordenes'
FROM Orders O
GROUP BY O.ShipName, YEAR(O.OrderDate)

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

/* 6 */

CREATE VIEW vProveedorTOrdenes
AS
SELECT S.SupplierID, S.CompanyName, YEAR(O.OrderDate) AS 'Fecha', COUNT(O.OrderID) AS 'TotalOrdenes'
FROM Suppliers S
INNER JOIN Products P ON S.SupplierID = P.SupplierID
INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
INNER JOIN Orders O ON OD.OrderID = O.OrderID
GROUP BY S.SupplierID, S.CompanyName, YEAR(O.OrderDate);

CREATE FUNCTION fProveedorMayorPedidos (@year INT) 
RETURNS TABLE
AS
RETURN 
SELECT SupplierID, CompanyName, [TotalOrdenes]
FROM vProveedorTOrdenes
WHERE [TotalOrdenes] = 
(
    SELECT MAX([TotalOrdenes])
    FROM vProveedorTOrdenes
    WHERE Fecha = @year
)
AND Fecha = @year;

SELECT * FROM dbo.fProveedorMayorPedidos(2017);  

/* 7 */

CREATE VIEW vClienteTOrdenes
AS
SELECT C.CustomerID, C.ContactName, C.Country, YEAR(O.OrderDate) AS 'Fecha', COUNT(O.OrderID) AS 'TotalOrdenes'
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.ContactName, C.Country, YEAR(O.OrderDate);

CREATE FUNCTION fClienteMayorPedidos (@year INT, @pais NVARCHAR(50)) 
RETURNS TABLE
AS
RETURN 
SELECT TOP 1 ContactName, Country, [TotalOrdenes]
FROM vClienteTOrdenes
WHERE Fecha = @year AND Country = @pais
ORDER BY [TotalOrdenes] DESC;

SELECT * FROM dbo.fClienteMayorPedidos(2016, 'Germany');

/*Pregunta 8 Crear un procedimiento o funci�n que liste la relaci�n de productos para una determinada categor�a.*/

CREATE PROCEDURE sp_listarprodcat
@categoryName NVARCHAR(15)
AS
SELECT P.ProductName, C.CategoryName
FROM Products P
INNER JOIN Categories C ON P.CategoryID=C.CategoryID
WHERE C.CategoryName=@categoryName

--- Ejecutar SP: sp:listarprodcat
EXEC sp_listarprodcat @CategoryName= 'Produce'

/*Pregunta 9  Crear un procedimiente o funci�n que muestre los productos que comercializa un determinado 
proveedor.*/

CREATE PROCEDURE sp_listarprodprov
@CompanyName NVARCHAR(40)
AS
SELECT P.ProductName AS 'Nombre Producto' , S.CompanyName AS 'Nombre Proveedor' 
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID=S.SupplierID
WHERE S.CompanyName=@CompanyName

EXEC sp_listarprodprov 'New England Seafood Cannery'

/* 10 */

CREATE VIEW vProveedorTProductosPorPais
AS
SELECT S.SupplierID, S.CompanyName, C.Country, COUNT(P.ProductID) AS 'TotalProductos'
FROM Suppliers S
INNER JOIN Products P ON S.SupplierID = P.SupplierID
INNER JOIN [Order Details] OD ON P.ProductID = OD.ProductID
INNER JOIN Orders O ON OD.OrderID = O.OrderID
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY S.SupplierID, S.CompanyName, C.Country;

CREATE FUNCTION fProveedorMayorProductos (@pais NVARCHAR(50)) 
RETURNS TABLE
AS
RETURN 
SELECT SupplierID, CompanyName, [TotalProductos]
FROM vProveedorTProductosPorPais
WHERE [TotalProductos] = 
(
    SELECT MAX([TotalProductos])
    FROM vProveedorTProductosPorPais
    WHERE Country = @pais
)
AND Country = @pais;

SELECT * FROM dbo.fProveedorMayorProductos('Germany'); 

/*Pregunta 11 Crear un procedimiento almacenado o una funci�n que retorne la categor�a de producto con la mayoria
de �rdenes realizadas de acuerdo al pa�s de destino.*/

CREATE PROCEDURE ObtenerCategoria
AS
SELECT O.ShipCountry AS Pais,C.CategoryName AS Categoria, COUNT(OD.OrderID) AS TotalOrdenes
FROM Orders O
JOIN [Order Details] OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
JOIN Categories C ON P.CategoryID = C.CategoryID
GROUP BY O.ShipCountry, C.CategoryName
HAVING COUNT(OD.OrderID) =
(
SELECT MAX(ContadorOrdenes)
FROM (
      SELECT COUNT(OD2.OrderID) AS ContadorOrdenes
      FROM Orders O2
      JOIN [Order Details] OD2 ON O2.OrderID = OD2.OrderID
      JOIN Products P2 ON OD2.ProductID = P2.ProductID
      WHERE O2.ShipCountry = O.ShipCountry
      GROUP BY P2.CategoryID
     ) AS Subquery
)

/* 12 */

CREATE PROCEDURE ObtenerCategoriaMayorVenta
AS
    SELECT O.ShipCountry AS Pais, C.CategoryName AS Categoria, SUM(OD.UnitPrice * OD.Quantity) AS TotalVentas
    FROM Orders O
    JOIN [Order Details] OD ON O.OrderID = OD.OrderID
    JOIN Products P ON OD.ProductID = P.ProductID
    JOIN Categories C ON P.CategoryID = C.CategoryID
    GROUP BY O.ShipCountry, C.CategoryName
    HAVING SUM(OD.UnitPrice * OD.Quantity) =
    (
        SELECT MAX(VentasTotales)
        FROM (
              SELECT SUM(OD2.UnitPrice * OD2.Quantity) AS VentasTotales
              FROM Orders O2
              JOIN [Order Details] OD2 ON O2.OrderID = OD2.OrderID
              JOIN Products P2 ON OD2.ProductID = P2.ProductID
              JOIN Categories C2 ON P2.CategoryID = C2.CategoryID
              WHERE O2.ShipCountry = O.ShipCountry
              GROUP BY C2.CategoryID
             ) AS Subquery
    )

EXEC ObtenerCategoriaMayorVenta;
/* Pregunta 13  Mostrar en un procedimiento almacenado, el pa�s donde se ha vendido m�s �rdenes durante un a�o 
ingresado como par�metro. */

CREATE PROCEDURE sp_obtenera�opais
@Year INT
AS
SELECT C.Country,COUNT(O.OrderID) AS 'Total_ordenes'
FROM Orders O
INNER JOIN Customers C ON O.CustomerID=C.CustomerID
WHERE YEAR(O.OrderDate) = @Year
GROUP BY C.Country
ORDER BY Total_ordenes DESC
EXEC sp_obtenera�opais '2016'

EXEC ObtenerCategoriaConMasOrdenesPorPais 

/* 14 */
CREATE FUNCTION dbo.fn_OrdenesPorAno(@Year INT)
RETURNS INT
AS

    DECLARE @OrderCount INT;

    SELECT @OrderCount = COUNT(*)
    FROM Orders
    WHERE YEAR(OrderDate) = @Year;

    RETURN @OrderCount;

SELECT dbo.fn_OrdenesPorAno(2023) AS TotalOrdenes;
/* 15 */

CREATE PROCEDURE sp_ProveedorMenorCantidadVendida
    @Year INT
AS
BEGIN
    SELECT TOP 1 S.SupplierID, S.CompanyName, SUM(OD.Quantity) AS TotalCantidadVendida
    FROM Orders O
    INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
    INNER JOIN Products P ON OD.ProductID = P.ProductID
    INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID
    WHERE YEAR(O.OrderDate) = @Year
    GROUP BY S.SupplierID, S.CompanyName
    ORDER BY TotalCantidadVendida ASC;
END;
GO
EXEC sp_ProveedorMenorCantidadVendida @Year = 2023;
/* 16 */
CREATE PROCEDURE spCategoriaConMenosOrdenesA�o
    @a�o INT
AS
    SELECT 
        Cat.CategoryName, 
        COUNT(O.OrderID) AS 'TotalOrdenes'
    FROM 
        Categories Cat
    INNER JOIN 
        Products P ON Cat.CategoryID = P.CategoryID
    INNER JOIN 
        [Order Details] OD ON P.ProductID = OD.ProductID
    INNER JOIN 
        Orders O ON OD.OrderID = O.OrderID
    WHERE 
        YEAR(O.OrderDate) = @a�o
    GROUP BY 
        Cat.CategoryName
    ORDER BY 
        COUNT(O.OrderID) ASC;


EXEC spCategoriaConMenosOrdenesA�o 2017;

/* 17 */

CREATE PROCEDURE spOrdenesPorEmbarcadorPorA�o
    @a�o INT
AS
    SELECT 
        S.CompanyName AS 'Shipper', 
        COUNT(O.OrderID) AS 'TotalOrdenes'
    FROM 
        Shippers S
    INNER JOIN 
        Orders O ON S.ShipperID = O.ShipVia
    WHERE 
        YEAR(O.OrderDate) = @a�o
    GROUP BY 
        S.CompanyName;

EXEC spOrdenesPorEmbarcadorPorA�o 2018;

/* 18 */

CREATE PROCEDURE spClienteConMasOrdenesPorPaisA�o
    @pais NVARCHAR(100),
    @a�o INT
AS
    SELECT TOP 1 
        C.CompanyName AS 'Cliente', 
        COUNT(O.OrderID) AS 'TotalOrdenes'
    FROM 
        Customers C
    INNER JOIN 
        Orders O ON C.CustomerID = O.CustomerID
    WHERE 
        O.ShipCountry = @pais
        AND YEAR(O.OrderDate) = @a�o
    GROUP BY 
        C.CompanyName
    ORDER BY 
        COUNT(O.OrderID) DESC;

EXEC spClienteConMasOrdenesPorPaisA�o 'USA', 2016;

/*pregunta 19 Crear un procedimiento almacenado o funci�n que retorne la cantidad de empleados de acuerdo a un 
determinado pa�s, el cual es ingresado como par�metro.*/

CREATE PROCEDURE EmpleadoPais
@Pais NVARCHAR(50)
AS
SELECT COUNT(*) AS CantidadDeEmpleados
FROM Employees
WHERE Country = @Pais

EXEC EmpleadoPais 'USA'


/* 20 */

CREATE PROCEDURE spOrdenesPorPaisPorA�o
    @year INT
AS

    SELECT O.ShipCountry AS PaisDestino, COUNT(O.OrderID) AS TotalOrdenes
    FROM Orders O
    WHERE YEAR(O.OrderDate) = @year
    GROUP BY O.ShipCountry
    ORDER BY TotalOrdenes DESC;

EXEC spOrdenesPorPaisPorA�o 2017;

/* 21 */

CREATE PROCEDURE spClienteConMasOrdenes
    @paisDestino NVARCHAR(50)
AS
    SELECT 
        C.CompanyName, 
        COUNT(O.OrderID) AS 'TotalOrdenes'
    FROM 
        Customers C
    INNER JOIN 
        Orders O ON C.CustomerID = O.CustomerID
    WHERE 
        O.ShipCountry = @paisDestino
    GROUP BY 
        C.CompanyName
    ORDER BY 
        COUNT(O.OrderID) DESC;

EXEC spClienteConMasOrdenes 'USA';


/* 22 */

CREATE PROCEDURE spShipperConMasPedidosPorPais
    @paisDestino NVARCHAR(50)
AS
SELECT 
        S.CompanyName, 
        COUNT(O.OrderID) AS 'TotalPedidos'
    FROM 
        Shippers S
    INNER JOIN 
        Orders O ON S.ShipperID = O.ShipVia
    WHERE 
        O.ShipCountry = @paisDestino
    GROUP BY 
        S.CompanyName
    ORDER BY 
        COUNT(O.OrderID) DESC;

EXEC spShipperConMasPedidosPorPais 'USA';