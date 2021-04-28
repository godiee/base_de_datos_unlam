USE AdventureWorks2012;

/*Ejercicio 1*/

SELECT ProductID , Name AS Descripcion
FROM Production.Product;

/*Ejercicio 2*/

SELECT *
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID = 17;

/*Ejercicio 3*/

SELECT ProductID , Name AS Descripcion
FROM Production.Product
WHERE Name LIKE 'D%';

/*Ejercicio 4*/

SELECT Name as Descripcion
FROM Production.Product
WHERE ProductNumber LIKE '%8';

/*Ejercicio 5*/

SELECT ProductID, Name AS Descripcion, Color
FROM Production.Product
WHERE Color IS NOT NULL;

/*Ejercicio 6*/

SELECT ProductID, Name AS Descripcion
FROM Production.Product
WHERE Color LIKE 'Black' AND SafetyStockLevel = 500;

/*Ejercicio 7*/

SELECT ProductID, Name AS Descripcion
FROM Production.Product
WHERE Color LIKE 'Black' OR Color LIKE 'Silver';

/*Ejercicio 8*/

SELECT DISTINCT Color
FROM Production.Product
WHERE Color IS NOT NULL;

/*Ejercicio 9*/

SELECT COUNT(ProductCategoryID) AS Categoria
FROM Production.ProductCategory;

/*Ejercicio 10*/

SELECT COUNT(ProductSubcategoryID) AS Subcategoria
FROM Production.ProductSubcategory
WHERE ProductCategoryID = 2;

/*Ejercicio 11*/

SELECT DISTINCT Color , COUNT(ProductID) AS Cantidad
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color;

/*Ejercicio 12*/

SELECT SUM(SafetyStockLevel) AS Total_SafetyStockLevel
FROM Production.Product
WHERE Color = 'Black'; 

/*Ejercicio 13*/

SELECT AVG(SafetyStockLevel) AS Promedio_SafetyStockLevel
FROM Production.Product
WHERE ProductID >= 316 AND ProductID <= 320;

/*Ejercicio 14*/

SELECT Product.Name AS Producto, ProductSubcategory.Name AS Descripcion
FROM Production.Product JOIN 
Production.ProductSubcategory ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID;

/*Ejercicio 15*/

SELECT ProductCategory.ProductCategoryID, ProductCategory.Name
FROM Production.ProductCategory JOIN
Production.ProductSubcategory ON Production.ProductCategory.ProductCategoryID = Production.ProductSubcategory.ProductCategoryID;

/*Ejercicio 16*/
SELECT P.ProductID, P.Name
FROM Production.Product P JOIN
Production.ProductProductPhoto PP ON P.ProductID = PP.ProductID ;

/*Ejercicio 17*/
SELECT P.Class, COUNT(P.ProductID) AS Cantidad
FROM Production.Product P
WHERE P.Class IS NOT NULL
GROUP BY P.Class;

/*Ejercicio 18*/

SELECT p.Name,
CASE
	WHEN p.Color='Black' THEN 'Black'
	WHEN p.Color='Silver' THEN 'Silver'
	ELSE 'Otro'
END AS [Color]
FROM Production.Product p
ORDER BY Color;