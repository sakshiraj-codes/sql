--Exercise 1

--1.1
SELECT COUNT(*) AS 'NO OF RECORDS' FROM Sales.SalesPerson;


--1.2
SELECT FirstName, LastName FROM Person.Person WHERE FirstName like 'B%';

--1.3
SELECT FirstName, LastName, JobTitle FROM Person.Person INNER JOIN HumanResources.Employee ON Person.BusinessEntityID=HumanResources.Employee.BusinessEntityID 
WHERE HumanResources.Employee.JobTitle IN ('Design Engineer', 'Tool Designer', 'Marketing Assistant');

--1.4
SELECT Name, Color FROM Production.Product WHERE Weight = (SELECT MAX(Weight) FROM Production.Product);

--1.5
SELECT Description, ISNULL(MaxQty,0.00) AS MaxQty FROM Sales.SpecialOffer;

--1.6
SELECT AVG(AverageRate) AS 'Average exchange rate for the day' FROM Sales.CurrencyRate WHERE FromCurrencyCode='USD' AND ToCurrencyCode='GBP';

--1.7
SELECT ROW_NUMBER() OVER (ORDER BY FirstName) AS RowNumber, FirstName, LastName FROM Person.Person WHERE FirstName LIKE '%ss%';

--1.8
SELECT BusinessEntityID AS SalesPersonID, CommissionPct, 'Commission Band'= CASE WHEN CommissionPct = 0 then 'band 0'
WHEN CommissionPct > 0 AND CommissionPct <= 0.01 THEN 'band 1'
WHEN CommissionPct > 0.01 AND CommissionPct <= 0.015 THEN 'band 2'
WHEN CommissionPct > 0.015 THEN 'band 3' END
FROM Sales.SalesPerson ORDER BY CommissionPct;

--1.9
DECLARE @EmployeeID int = (
	SELECT Person.Person.BusinessEntityID FROM Person.Person 
	WHERE FirstName = 'Ruth' AND LastName = 'Ellerbrock' AND PersonType ='EM' ) ;
EXECUTE dbo.uspGetEmployeeManagers @BusinessEntityID = @EmployeeID;

--1.10
SELECT ProductID, Quantity FROM Production.ProductInventory WHERE Quantity = (SELECT MAX(Quantity) FROM Production.ProductInventory);