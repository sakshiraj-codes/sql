--Exercise 4

GO
CREATE FUNCTION Sales.uf_NewFunction(@SalesOrderId int,@CurrencyCode nchar(3),@Date datetime)
RETURNS TABLE
AS
RETURN 
	SELECT sod.ProductID AS 'Product ID',
		   sod.OrderQty AS ' Order Quantity',
		   sod.UnitPrice As 'Unit Price',
		   sod.UnitPrice*scr.EndOfDayRate AS 'Target Price'
	FROM Sales.SalesOrderDetail AS sod,
		 Sales.CurrencyRate AS scr
	WHERE scr.ToCurrencyCode = @CurrencyCode AND
		  scr.ModifiedDate = @Date AND 
		  sod.SalesOrderID = @SalesOrderID

GO

SELECT * FROM Sales.uf_NewFunction(43659,'MXN','2005-09-05');