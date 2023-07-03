--Exercise 3

SELECT TOP 5 SalesOrderID AS 'OrderID', OrderDate, AccountNumber, SUM(TotalDue) AS 'Amount Spent'FROM Sales.SalesOrderHeader 
GROUP BY AccountNumber, OrderDate, SalesOrderID HAVING SUM(TotalDue) > 70000 ORDER BY OrderDate DESC;
