USE AdventureWorks2012;
--1
SELECT GETDATE();

--2
SELECT DATEPART(YY,GETDATE()) AS Año, DATEPART(MM,GETDATE()) AS Mes;

--3
SELECT DATEDIFF(DAY, GETDATE() ,'2021-09-21') AS Primavera;

--4
SELECT ROUND(385.86, 1);

--5
SELECT POWER(DATEPART(MM,GETDATE()),2) AS Potencia;

--6
SELECT SYSTEM_USER AS LoginUsuario, USER AS Usuario;

--7
SELECT BusinessEntityID, DATEDIFF(YY,BirthDate,GETDATE()) AS Edades
FROM HumanResources.Employee;

--8
SELECT DISTINCT LastName AS Apellido, LEN(LastName) AS LongitudApellido
FROM Person.Person
ORDER BY Apellido;

--9
SELECT MAX(LEN(LastName)) AS LongitudApellido
FROM Person.Person;

--10
SELECT P.FirstName, P.LastName
FROM Person.Person P
WHERE DATEPART(YY,P.ModifiedDate) >= (SELECT DATEPART(YY,MAX(ModifiedDate)) - 3
                                      FROM Person.Person);

--11
SELECT UPPER(EmailAddress)
FROM Person.EmailAddress;

--12
SELECT LEFT(EmailAddress, PATINDEX('%@%', EmailAddress) - 1) AS Nombre, 
       TRIM('.com' FROM SUBSTRING(EmailAddress, PATINDEX('%@%', EmailAddress) + 1, LEN(EmailAddress) - PATINDEX('%@%', EmailAddress) + 4))  AS Dominio
FROM Person.EmailAddress;

--13
SELECT RIGHT(NationalIDNumber, 3) AS Ultimos3DigitosDeNationalIdNumber
FROM HumanResources.Employee
ORDER BY BusinessEntityID;

--14
SELECT REPLACE(SUBSTRING(NationalIDNumber,1,3) + SPACE(1) + SUBSTRING(NationalIDNumber,4,4) + SPACE(1) + SUBSTRING(NationalIDNumber,7,2), ' ', '-') AS Enmascarado
FROM HumanResources.Employee
WHERE LEN(NationalIDNumber) = 9
ORDER BY BusinessEntityID;
/*Aclaracion NationalIdNumber posee registros que son menores y/o mayor a longitud de 9 a estos registros no se le puso mascara*/

--15
SELECT Persona.FirstName AS Nombre, Persona.LastName AS Apellido, Direccion.AddressLine1 AS Direccion, Direccion.City AS Ciudad
FROM HumanResources.Employee Empleado JOIN
     Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID JOIN
	 Person.BusinessEntityAddress A ON Persona.BusinessEntityID = A.BusinessEntityID JOIN
	 Person.Address Direccion ON A.AddressID = Direccion.AddressID 
WHERE JobTitle LIKE '%Supervisor%' AND DATEDIFF(YY,Empleado.BirthDate,GETDATE()) > 30;

--16
SELECT Gender,COUNT(Gender) AS Cantidad
FROM HumanResources.Employee
/*WHERE Gender = 'Femenino' OR Gender = 'Masculino' esta sentencia cumple con el enunciado*/
GROUP BY Gender

--17
SELECT Persona.FirstName + SPACE(1) + Persona.LastName AS Empleado, CASE
																		WHEN VacationHours > 50 THEN 'ALTO'
																		WHEN VacationHours < 20 THEN 'BAJO'
																		ELSE 'MEDIO'
																	END AS Horas
FROM HumanResources.Employee Empleado JOIN
     Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
ORDER BY VacationHours;