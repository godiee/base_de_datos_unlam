USE AdventureWorks2012;
--SQL AVANZADO

--1
SELECT p.Name AS Producto, pm.Name AS Modelo
FROM Production.Product p JOIN
	Production.ProductModel pm ON p.ProductModelID = pm.ProductModelID;

--2
SELECT p.Name AS Producto, pm.Name AS Modelo
FROM Production.Product p LEFT JOIN
	Production.ProductModel pm ON p.ProductModelID = pm.ProductModelID;

--3
SELECT p.Name AS Producto, (CASE 
							WHEN pm.Name IS NULL THEN 'Sin modelo'
							ELSE pm.Name
						    END) AS Modelo
FROM Production.Product p LEFT JOIN
	Production.ProductModel pm ON p.ProductModelID = pm.ProductModelID;

--4
SELECT COUNT(p.ProductID) AS Cantidad
FROM Production.Product p JOIN
	Production.ProductModel pm ON p.ProductModelID = pm.ProductModelID;

--5
SELECT COUNT(p.ProductID) AS Cantidad
FROM Production.Product p
WHERE p.ProductModelID IN (SELECT pm.ProductModelID
                          FROM Production.Product p2 JOIN
                               Production.ProductModel pm ON p2.ProductModelID = pm.ProductModelID
                          GROUP BY pm.ProductModelID
                          HAVING COUNT(p2.ProductID) >= 2);

--7
SELECT pm.Name AS Modelo, COUNT(p.ProductID) AS Cantidad
FROM Production.Product p RIGHT JOIN
	Production.ProductModel pm ON p.ProductModelID = pm.ProductModelID
GROUP BY pm.Name;

--8
SELECT p.Name AS Producto, pm.Name AS Modelo, pmi.IllustrationID, i.Diagram, pmi.ModifiedDate
FROM Production.Product p JOIN
     Production.ProductModel pm ON p.ProductModelID = pm.ProductModelID JOIN
	 Production.ProductModelIllustration pmi ON pm.ProductModelID = pmi.ProductModelID JOIN
	 Production.Illustration i ON pmi.IllustrationID = i.IllustrationID;

--9
SELECT CultureID AS Cultura
FROM Production.Culture
WHERE CultureID NOT IN (SELECT P.CultureID
                        FROM Production.ProductModelProductDescriptionCulture P);

--10
INSERT INTO Person.ContactType (name)
VALUES('Account executive');

--11
INSERT INTO Production.Culture(CultureID,name)
VALUES('nn','Modern Culture')

--12
UPDATE Production.Culture 
SET ModifiedDate = GETDATE() 
WHERE Name IN ('Spanish','Thai','French') ;

--13
/*No existe la tabla Production.CultureHis*/

--14
UPDATE Person.Person
SET FirstName = 'Juan', LastName = 'Perez'
WHERE BusinessEntityID = 10;

--15
INSERT INTO Sales.Currency(CurrencyCode, Name)
VALUES('PAR', 'Peso Argentino');

--16
DELETE FROM Sales.Currency 
WHERE CurrencyCode = 'ARS';

/*No se puede eliminar este registro ya que la tabla Sales.CountryRegionCurrency, Sales.CurrencyRate esta haciendo referencia a este*/

--17
DELETE FROM Sales.CountryRegionCurrency
WHERE CurrencyCode = 'ARS';

DELETE FROM Sales.CurrencyRate
WHERE ToCurrencyCode = 'ARS';

--18
DELETE FROM Production.Culture
WHERE CultureID NOT IN (SELECT CultureID
                        FROM Production.ProductModelProductDescriptionCulture);