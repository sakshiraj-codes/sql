--USING JOIN

SELECT DISTINCT P.BusinessEntityID, P.LastName, P.MiddleName, P.FirstName
FROM Person.Person P LEFT JOIN Sales.Customer C ON P.BusinessEntityID = C.PersonID LEFT JOIN Sales.SalesOrderHeader S
ON C.CustomerID = S.CustomerID WHERE S.SalesOrderID IS NULL;


--USING SUBQUERY

SELECT DISTINCT P.BusinessEntityID, P.LastName, P.MiddleName, P.FirstName FROM Person.Person P
WHERE P.BusinessEntityID NOT IN ( SELECT C.PersonID FROM Sales.Customer C JOIN Sales.SalesOrderHeader S
ON C.CustomerID = S.CustomerID );

--USING CTE

WITH ActiveCustomers (BusinessEntityID)
AS (
 SELECT DISTINCT C.PersonID
 FROM Sales.Customer C
 INNER JOIN Sales.SalesOrderHeader S
 ON C.CustomerID = S.CustomerID
)

SELECT DISTINCT P.BusinessEntityID, P.LastName, P.MiddleName, P.FirstName
FROM Person.Person P LEFT JOIN ActiveCustomers A ON A.BusinessEntityID = P.BusinessEntityID
WHERE A.BusinessEntityID IS NULL;


--USING EXISTS

SELECT DISTINCT P.BusinessEntityID, P.LastName, P.MiddleName, P.FirstName FROM Person.Person P
WHERE NOT EXISTS ( SELECT * FROM Sales.Customer C INNER JOIN Sales.SalesOrderHeader S 
ON C.CustomerID = S.CustomerID WHERE C.PersonID = P.BusinessEntityID );