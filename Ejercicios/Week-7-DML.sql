/*1. Nombres de los productos cuyo precio unitario sea mayor a 18 pero menor a 100,
mostrando primero los productos de mayor precio*/

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 18 AND UnitPrice < 100
ORDER BY UnitPrice DESC

/*2. Indicar los pa�ses de procedencia de los clientes*/

SELECT DISTINCT CompanyName, Country 
FROM Customers

/*3. Indicar los nombres de los clientes que no sean de los siguientes
pa�ses de Francia, Brasil y M�xico*/

SELECT CompanyName, Country
FROM Customers 
WHERE Country NOT IN ('France', 'Brazil', 'Mexico')

/*4. Indicar los nombres de clientes que comiencen con la letra L o la letra M*/

SELECT CompanyName 
FROM Customers 
WHERE CompanyName LIKE 'L%' OR CompanyName LIKE 'M%'

/*5. Indicar la cantidad de clientes*/

SELECT COUNT(*) AS TotalClientes 
FROM Customers

/*6. Indicar el mayor precio unitario de los productos*/

SELECT MAX(UnitPrice) AS MayorPrecioUnitario 
FROM Products

/*7. Indicar el menor precio unitario de los productos*/

SELECT MIN(UnitPrice) AS MenorPrecioUnitario 
FROM Products

/*8. Indicar la cantidad de pa�ses distintos de procedencia de los clientes*/

SELECT COUNT(DISTINCT Country) AS PaisesDistintos 
FROM Customers

/*9. Indicar la cantidad de clientes cuya procedencia sea Alemania*/

SELECT COUNT(*) AS ClientesAlemania 
FROM Customers 
WHERE Country = 'Germany'

/*10. Indicar la cantidad de clientes por pa�s de procedencia*/

SELECT Country, COUNT(*) AS TotalClientes 
FROM Customers 
GROUP BY Country

/*11. Indicar la cantidad de productos de acuerdo a su discontinuidad*/

SELECT Discontinued, COUNT(*) AS TotalProductos 
FROM Products 
GROUP BY Discontinued

/*12. Indicar los pa�ses de procedencia que superen los cinco clientes*/

SELECT Country, COUNT(*) AS TotalClientes 
FROM Customers 
GROUP BY Country 
HAVING COUNT(*) > 5

/*13. Indicar el nombre del producto con mayor precio*/

SELECT ProductName
FROM Products 
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products)

/*14. Indicar el nombre del pa�s con la mayor cantidad de clientes*/

SELECT TOP 1 Country, COUNT(*) AS TotalClientes 
FROM Customers 
GROUP BY Country 
ORDER BY TotalClientes DESC
